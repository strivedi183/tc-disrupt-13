# == Schema Information
#
# Table name: events
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  description           :text
#  address               :string(255)
#  latitude              :float            default(0.0)
#  longitude             :float            default(0.0)
#  instagram_location_id :string(255)
#  is_view_public        :boolean          default(TRUE)
#  is_post_public        :boolean          default(TRUE)
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :name, :description, :is_view_public, :is_post_public, :user_id, :address, :latitude, :longitude
  has_many :contents, :inverse_of => :event
  has_many :filters, :inverse_of => :event
  has_many :permissions, :inverse_of => :event
  belongs_to :user, :inverse_of => :events

  # before_save :geocoder

  def order_contents_created_at
    instagram_array = self.contents.order(:instagram_created_at)
    twitter_array = self.contents.order(:twitter_created_at)
    new_array = instagram_array + twitter_array
    new_array.sort!
  end

  def is_view_public?
    if self.is_view_public == true
      true
    else
      false
    end
  end

  def is_post_public?
    if self.is_post_public == true
      true
    else
      false
    end
  end

  def get_all_recent_tweets
    filters_array = self.filters.where(:network => 'twitter').map(&:tag)
    filters_array.each do |filter|
      get_recent_tweets(filter)
    end
  end

  def get_recent_tweets(hashtag)
    # if self.contents != []
    #   @since_id = self.contents.order("twitter_content_id DESC").map(&:twitter_content_id).last
    # else
    #   @since_id = nil
    # end
    Twitter.search(hashtag, options = {:count => 50}).statuses.each do |tweet|
      content = Content.new
      content.content_type = 'twitter'
      content.twitter_content_id = tweet.id
      content.twitter_created_at = tweet.created_at
      content.twitter_body = tweet.text
      content.twitter_user_id = tweet.user.id
      content.twitter_user_name = tweet.user.name
      content.twitter_screen_name = tweet.user.screen_name.downcase
      content.twitter_profile_image_url = tweet.user.profile_image_url
      if tweet.media.present?
        content.twitter_media_id = tweet.media.first.id
        content.twitter_media_url = tweet.media.first.media_url
        content.remote_twitter_media_upload_url = tweet.media.first.media_url
      end
      if self.is_post_public?
        content.save
        self.contents << content
      else
        permissions_array = self.permissions.where(:network => 'twitter').map(&:handle)
        if permissions_array.include?(content.twitter_screen_name)
          content.save
          self.contents << content
        end
      end
    end
  end

  def get_instagram_location_id
    if self.is_post_public?
      # We would have count be greater if we were returning all potential events to the user, instead we are picking one for demo
      if self.address.present?
        self.instagram_location_id = Instagram.location_search(self.latitude, self.longitude, options = {:count => 1}).first.id
        self.save
      end
    end
  end

  def get_all_recent_instagrams
    if self.is_post_public?
      self.get_instagram_location_id if self.address.present?
    end
    filters_array = self.filters.where(:network => 'instagram').map(&:tag)
    filters_array.each do |filter|
      get_recent_instagrams(filter)
    end
  end

  def get_recent_instagrams(hashtag)
    if self.instagram_location_id.present?
      results = []
      location_results = Instagram.location_recent_media(self.instagram_location_id)
      location_results.each do |result|
        if result.tags.first == hashtag
          results << result
        end
      end
    else
      results = Instagram.tag_recent_media(hashtag)
    end
    results.each do |result|
      content = Content.new
      content.content_type = 'instagram'
      content.instagram_content_id = result.id
      content.instagram_created_at = result.created_time #NEED TO CONVERT TO UTC
      content.instagram_media_url = result.images.standard_resolution.url
      content.instagram_body = result.caption.text
      content.instagram_user_name = result.caption.from.full_name
      content.instagram_screen_name = result.caption.from.username
      content.instagram_profile_image_url = result.caption.from.profile_picture
      content.instagram_user_id = result.caption.from.id
      if self.is_post_public?
        content.save
        self.contents << content
      else
        permissions_array = self.permissions.where(:network => 'instagram').map(&:handle)
        if permissions_array.include?(content.instagram_screen_name)
          content.save
          self.contents << content
        end
      end
    end
  end

  private
  def geocoder
    result = Geocoder.search(self.address).first

    if result.present?
      self.latitude = result.latitude
      self.longitude = result.longitude
    end
  end
end

