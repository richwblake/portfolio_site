class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :posts, through: :comments

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  enum role: [:user, :admin]

  def name_with_role_if_admin
    if self.admin?
      "#{self.name} (admin)"
    else
      self.name
    end
  end
end
