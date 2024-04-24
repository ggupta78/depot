class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    # replace multiple line items for a single product with a single line item with correct quantity
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        next unless quantity > 1

        # remove all individual items
        cart.line_items.where(product_id:).delete_all

        # replace with single item
        item = cart.line_items.build(product_id:)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    LineItem.where('quantity > 1').each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end

      line_item.destroy
    end
  end
end
