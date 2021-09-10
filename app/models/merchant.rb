class Merchant < ApplicationRecord
  attr_reader :revenue
  has_many :invoices, dependent: nil
  has_many :items, dependent: nil

  self.per_page = 20

  def self.find_merchant(query)
    find_by("lower(name) LIKE lower(?)", "%#{query}%" )
  end

  def self.top_merchants(quantity)
    joins(items: {invoice_items: {invoice: :transactions}})
    .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group(:id)
    .where(transactions: { result: :success})
    .order(revenue: :desc)
    .limit(quantity)
  end

  def revenue
    invoices.total_revenue
  end
end
