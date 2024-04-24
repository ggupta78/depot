Cart.all.each do |cart|
  binding.break
  grouped = cart.line_items.group(:product_id)
  p grouped.class
  sums = grouped.sum(:quantity)
  p sums
  sums.each { |product_id, quantity| p "#{product_id} - #{quantity}" }
end
