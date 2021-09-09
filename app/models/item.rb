class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: nil

  self.per_page = 20
end
