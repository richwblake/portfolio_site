class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true

  def get_formatted_date_and_time
    created = self.created_at.in_time_zone('Eastern Time (US & Canada)')
    "#{created.strftime("%m/%d/%y")} at #{created.strftime("%I:%M%p")}"
  end
end