require "test_helper"

class ProductTest < ActiveSupport::TestCase
  setup do
    @product_one = products(:one)
    @category_one = categories(:one)
  end

  test "product must have category" do
    assert_difference('Product.count', 0) do
      product = Product.new(name: 'String',
                            description: 'some Description',
                            price: 3.99)
      product.save
    end
  end

  test "product can be created when category is present" do
    assert_difference('Product.count', 1) do
      product = Product.new(name: 'String',
                            description: 'some Description',
                            price: 3.99,
                            category_id: @category_one.id)
      product.save
    end
  end
end
