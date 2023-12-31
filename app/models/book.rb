class Book < ApplicationRecord

has_one_attached :image
belongs_to :user
has_many :favorites, dependent: :destroy
has_many :book_comments, dependent: :destroy

def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 } 
 
 
 # 検索方法分岐
# allの意味は？
# %定義の意味
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end

