Fabricator(:order_item) do
  order
  book
  price { Faker::Commerce.price }
  quantity { Faker::Number.number(2) }
end
