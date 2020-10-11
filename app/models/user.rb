class User < ApplicationRecord
  has_secure_password

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
