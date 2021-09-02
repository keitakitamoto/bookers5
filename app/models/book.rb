class Book < ApplicationRecord
	belongs_to :user
	# .から/へ　アソシエーション１対Nの関係
	

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
