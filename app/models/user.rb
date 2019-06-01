class User < ApplicationRecord
  	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id",
	                               class_name:  "Relationship",
	                               dependent:   :destroy
	has_many :followers, through: :reverse_relationships, source: :follower 
	has_many :answers, foreign_key: :user_id
	has_many :questions, foreign_key: :user_id
	has_many :user_topics 
	has_many :topics, through: :user_topics 
  	
  	# Include default devise modules. Others available are:
 	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	def following?(other_user)
		relationships.find_by_followed_id(other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by_followed_id(other_user.id).destroy
	end
end
