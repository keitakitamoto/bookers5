class Book < ApplicationRecord
	belongs_to :user
	# .から/へ　アソシエーション１対Nの関係
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	def favorited_by?(user)
	 favorites.where(user_id: user.id).exists?
	end
	
	def self.looks(searches,words)
	  if searches == "perfect_match"
	  	@book = Book.where("name LIKE ?","#{words}")
	  else
	  	@book = Book.where("name LIKE?","%#{words}%")
	  end
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
