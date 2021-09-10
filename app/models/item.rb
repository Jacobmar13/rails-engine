class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: nil

  self.per_page = 20

  def self.find_items(query)
    where("lower(name) LIKE lower(?)", "%#{query}%" )
  end

  def self.top_items(quantity = 10)
    joins(invoice_items: {invoice: :transactions})
    .select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .group(:id)
    .where(transactions: { result: :success})
    .order(revenue: :desc)
    .limit(quantity)
  end
end
