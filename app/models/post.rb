class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  validates :title, presence: true
  validates :content, presence: true
end