class Post < ApplicationRecord
    belongs_to :story
    has_many :images
end
