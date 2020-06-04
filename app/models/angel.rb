# frozen_string_literal: true

class Angel < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :postcode, presence: true
  validates :symptom_free, acceptance: {
    message: "for our user's safety we can not accept angels who are, or have recently been, symptomatic."
  }

  validates :terms_and_conditions, acceptance: true

  has_many :accepted_orders, class_name: "Order", inverse_of: :angel, foreign_key: :angel_id, dependent: :nullify

  include Geolocatable

  before_save :update_location

  acts_as_mappable(
    default_units: :miles,
    default_formula: :sphere,
    distance_field_name: :distance,
    lat_column_name: :lat,
    lng_column_name: :lng,
  )
end
