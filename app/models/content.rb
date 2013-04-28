# == Schema Information
#
# Table name: contents
#
#  id                          :integer          not null, primary key
#  content_type                :string(255)
#  twitter_content_id          :string(255)
#  twitter_created_at          :string(255)
#  twitter_body                :string(255)
#  twitter_user_id             :string(255)
#  twitter_user_name           :string(255)
#  twitter_screen_name         :string(255)
#  twitter_profile_image_url   :string(255)
#  twitter_media_id            :string(255)
#  twitter_media_url           :string(255)
#  twitter_media_upload        :string(255)
#  instagram_content_id        :string(255)
#  instagram_created_at        :string(255)
#  instagram_media_url         :string(255)
#  instagram_body              :text
#  instagram_user_name         :string(255)
#  instagram_screen_name       :string(255)
#  instagram_profile_image_url :string(255)
#  instagram_user_id           :string(255)
#  event_id                    :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Content < ActiveRecord::Base
  attr_accessible :content_type, :event_id, :remote_twitter_media_upload_url
  belongs_to :event, :inverse_of => :contents
  mount_uploader :twitter_media_upload, ImageUploader

  before_save :convert_instagram_created_time_to_utc

  def convert_instagram_created_time_to_utc
    if self.instagram_created_at.present?
      self.instagram_created_at = Time.at(self.instagram_created_at.to_i)
    end
  end
end
