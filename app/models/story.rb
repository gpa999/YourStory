class Story < ApplicationRecord
    has_one_attached :image 
    belongs_to :user
    has_many :posts, ->{ order("created_at DESC") }
    validates :title, presence: true, length: {minimum: 1, maximum: 30}
    validates :text, presence: true, length: {minimum: 1, maximum: 100}
    
    def self.search(search) #ここでのself.はUser.を意味する
      if search
        where(["text LIKE(?)OR title LIKE(?)", "%#{search}%","%#{search}%" ]) #検索とnameの部分一致を表示。User.は省略
      else
        order("created_at DESC") #全て表示。User.は省略
      end
    end
end
