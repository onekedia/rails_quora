class Question < ApplicationRecord
	validates :user_id, presence: true

	belongs_to :user
  	has_many :answers
  	has_many :question_topics
  	has_many :topics, through: :question_topics

  	default_scope { order(created_at: :desc) }
  	scope :topic, ->(topic_id) { joins(:topics).where("topics": { id: topic_id }).group(:id) }
end
