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

