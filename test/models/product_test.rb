require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors['title'].any?
    assert product.errors['description'].any?
    assert product.errors['price'].any?
    assert product.errors['image_url'].any?
  end

  def new_product(image_url)
    Product.new(title: 'The old man and the sea', description: 'yyy',
                          image_url: image_url, price: 0.02)
  end

  test 'product price must be positive' do
    product = new_product('zzz.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors['price']

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors['price']

    product.price = 1
    assert product.valid?
  end

  test 'image url' do
    valid_urls = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
    invalid_urls = %w{fred.doc fred.gif/more fred.gif.more}

    valid_urls.each do |url|
      assert new_product(url).valid?, "#{url} must be valid"
    end

    invalid_urls.each do |url|
      assert new_product(url).invalid?, "#{url} must be invalid"
    end
  end

end
