class UserTopic < ApplicationRecord
	belongs_to :user
	belongs_to :topic

	validates :user, :topic, presence: true

	validates_uniqueness_of :user_id, :scope => :topic_id 
end
