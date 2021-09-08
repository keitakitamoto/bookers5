class Relationship < ApplicationRecord
    belongs_to :follower, class_name: 'User'
    belongs_to :followed, class_name: 'User'
    # Followクラスという存在しないクラスを参照することを防ぎ、User クラスであることを明示
    
    #validate :user_id, presence: true
    #validate :follow_id, presence: true
end
