# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  is_view_public :boolean          default(TRUE)
#  is_post_public :boolean          default(TRUE)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :name, :description, :is_view_public, :is_post_public, :user_id
  has_many :contents, :inverse_of => :event
  has_many :filters, :inverse_of => :event
  has_many :permissions, :inverse_of => :event

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
    filters_array = self.filters.where(:network => 'twitter')
    filters_array.each do |filter|
      get_recent_tweets(filter)
    end
  end

  def get_recent_tweets(hashtag)
    Twitter.search(hashtag).statuses.each do |tweet|
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
        content.twitter_media_id = tweet.media.id
        content.twitter_media_url = tweet.media.media_url
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

  def get_recent_instagrams(hashtag)

  end

end

