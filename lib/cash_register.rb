class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction, :last_quantity

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      items << title
    end
    self.total += price * quantity
    self.last_transaction = price * quantity
    self.last_quantity = quantity
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0
    self.total = (total - total * (discount.to_f / 100)).to_i
    "After the discount, the total comes to $#{total}."
  end

  def void_last_transaction
    self.total -= last_transaction
    last_quantity.times do
      items.pop
    end
  end
end
