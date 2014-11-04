Fabricator(:cart_item) do
  cart_id { Faker::Number.number(1) }
  book_id { Faker::Number.number(1) }
  price { Faker::Number.number(1) }
  quantity { Faker::Number.number(1) }
end
