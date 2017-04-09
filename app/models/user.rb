class User < ApplicationRecord
  has_many :books
  validates :name, presence: true
  after_initialize :set_default_role, if: :new_record?

  enum role: [:user, :admin]

  def set_default_role
    self.role ||= :user
  end

  default_scope { order("name ASC") }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
