class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  self.per_page = 20
end
