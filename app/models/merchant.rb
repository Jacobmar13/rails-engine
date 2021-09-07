class Merchant < ApplicationRecord
  has_many :invoices, dependent: nil
  has_many :items, dependent: nil

  self.per_page = 20
end
