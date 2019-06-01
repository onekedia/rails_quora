class Answer < ApplicationRecord
	validates :user_id, presence: true
  	validates :question_id, presence: true
  	validates :description, presence: true

  	belongs_to :question
	belongs_to :user
	before_create :one_answer_per_user
	default_scope { order(created_at: :desc) }

	def get_question
		self.question
	end
	private

	def one_answer_per_user
		if self.new_record? && (self.question.nil? || self.question.answers.where(user_id: self.user_id).exists?)
		  	self.errors.add(:user, "can only answer once")
		end
	end
end
