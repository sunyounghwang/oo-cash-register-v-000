class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      items << title
    end
    prices[title] = [quantity, price]
    self.total += price * quantity
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0
    self.total = total - total * (discount.to_f / 100)
    "After the discount, the total comes to $#{total.to_i}."
  end

  def void_last_transaction
    last_quantity = prices[items.last][0]
    last_price = prices[items.last][1]
    self.total -= last_quantity * last_price
    prices.delete(items.last)
    last_quantity.times do
      items.pop
    end
  end
end
