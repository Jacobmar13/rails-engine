class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: nil
  validates_associated :merchant

  self.per_page = 20
end
