class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates :email, uniqueness: true

  validates :password,
            presence: true,
            confirmation: true,
            on: :create

  validates :password,
            presence: true,
            confirmation: true,
            if: proc { |o| o.password.present? },
            on: :update


  def full_name
    [name, lastname].join(' ')
  end

  enum role: [:admin]

end
