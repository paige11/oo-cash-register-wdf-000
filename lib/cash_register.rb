class CashRegister
  attr_accessor :total, :discount, :items, :receipt

  def initialize(discount = 0) 
    @total = 0
    @discount = discount
    @items = []
    @receipt = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times { self.receipt.push (price) }
    quantity.times { self.items.push(title) }
    self.total += (price * quantity)
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else 
      percent = @discount / 100.0
      self.total -= (percent * @total)
      if self.total % 1 == 0
        self.total = self.total.to_i
      end
      return "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total -= self.receipt.last
  end

end
