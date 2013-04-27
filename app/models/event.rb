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
  has_many :contents, :inverse_of => :event
end
