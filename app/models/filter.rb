# == Schema Information
#
# Table name: filters
#
#  id         :integer          not null, primary key
#  network    :string(255)
#  tag        :string(255)
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Filter < ActiveRecord::Base
  attr_accessible :network, :tag, :event_id
  belongs_to :event, :inverse_of => :filters


end
