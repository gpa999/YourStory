class User < ApplicationRecord
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :stories, ->{ order("created_at DESC") }
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id' 
  has_many :ratings, through: :comments, source: :user
  has_many :reverse_of_comments, class_name: 'Comment', foreign_key: 'rate_id'
  has_many :raters, through: :reverse_of_comments, source: :rate
  
  validates :nickname, presence: true, length: {minimum: 1, maximum: 10}
  
   def follow(other_user)
     unless self == other_user
       self.relationships.find_or_create_by(follow_id: other_user.id)
     end
   end

   def unfollow(other_user)
     relationship = self.relationships.find_by(follow_id: other_user.id)
     relationship.destroy if relationship
   end

   def following?(other_user)
     self.followings.include?(other_user)
   end
   
   
   
end
