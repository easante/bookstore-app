Fabricator(:order_item) do
  order
  book
  price { Faker::Number.number(2) }
  quantity { Faker::Number.number(2) }
end
