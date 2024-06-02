class Book < ApplicationRecord
  has_many :reading_list_items
  has_many :users, through: :reading_list_items

  validates :external_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :authors, presence: true
end
