class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # through: :relationships は[中間テーブルはrelationships]という意味
  has_many :reverse_of_relationships, class_name: 'Relationship',foreign_key: 'followed_id', dependent: :destroy
  # has_many :reverse_of_relationshipsはrelationshipsの逆、つまりフォロワーを意味する
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  
  def follow(user_id)
     relationships.create(followed_id: user_id)
      # 重複するフォローを無くす記述
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
    # relationshipが存在すれば、destroy
  end
  
  def following?(user)
    followings.include?(user)
    # フォローしているUser達を取得し、include?(other_user)によってother_userが含まれていないかチェック　含まれている：ture 含まれていない：false
  end

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
  # , if: :user_signed_in? presence :tureだと必須項目になってしまう
  
end
