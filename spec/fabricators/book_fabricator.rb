Fabricator(:book) do
  title { Faker::Name.name }
  price { Faker::Commerce.price }
  isbn { Faker::Code.isbn }
  page_count { Faker::Number.number(4) }
  description { Faker::Lorem.paragraph }
  published_at 1.year.ago
  book_cover { Faker::Name.name }
  publisher
end
