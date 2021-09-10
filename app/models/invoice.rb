class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions, dependent: nil
  has_many :invoice_items, dependent: nil

  def self.total_revenue
    joins(:transactions, :invoice_items)
    .where(transactions: { result: :success})
    .select("sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group('invoices.id').sum do |revenue|
      revenue.revenue
    end
  end
end
