class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :rate, class_name: 'User'

    validates :user_id, presence: true
    validates :rate_id, presence: true
    validates :text, presence: true, length: {minimum: 1, maximum: 60}
end
