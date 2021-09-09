class Merchant < ApplicationRecord
  has_many :invoices, dependent: nil
  has_many :items, dependent: nil

  self.per_page = 20

  def self.find_merchant(query)
    find_by("lower(name) LIKE lower(?)", "%#{query}%" )
  end
end
