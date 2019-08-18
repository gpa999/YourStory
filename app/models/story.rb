class Story < ApplicationRecord
    has_one_attached :image 
    belongs_to :user
    has_many :posts, ->{ order("created_at DESC") }
    validates :title, presence: true, length: {minimum: 1, maximum: 30}
    validates :text, length: {minimum: 1, maximum: 100}
end
