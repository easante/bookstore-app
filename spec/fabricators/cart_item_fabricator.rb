Fabricator(:cart_item) do
  cart
  book
  price { Faker::Commerce.price }
  quantity { Faker::Number.number(1) }
end
