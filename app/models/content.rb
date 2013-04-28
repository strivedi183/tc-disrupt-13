# == Schema Information
#
# Table name: contents
#
#  id                        :integer          not null, primary key
#  body                      :text
#  url                       :string(255)
#  content_type              :string(255)
#  twitter_content_id        :string(255)
#  twitter_created_at        :string(255)
#  twitter_body              :string(255)
#  twitter_user_id           :string(255)
#  twitter_user_name         :string(255)
#  twitter_screen_name       :string(255)
#  twitter_profile_image_url :string(255)
#  twitter_media_id          :string(255)
#  twitter_media_url         :string(255)
#  event_id                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Content < ActiveRecord::Base
  attr_accessible :body, :url, :content_type, :event_id
  belongs_to :event, :inverse_of => :contents

end
