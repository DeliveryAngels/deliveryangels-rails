# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :address
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  def has_address? # rubocop:disable Naming/PredicateName
    address.present?
  end
end
