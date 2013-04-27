# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  network    :string(255)
#  handle     :string(255)
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  attr_accessible :network, :handle, :event_id
  belongs_to :event, :inverse_of => :permissions
end
