# == Schema Information
#
# Table name: contents
#
#  id           :integer          not null, primary key
#  body         :text
#  url          :string(255)
#  content_type :string(255)
#  event_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Content < ActiveRecord::Base
  attr_accessible :body, :url, :content_type, :event_id
  belongs_to :event, :inverse_of => :contents
end
