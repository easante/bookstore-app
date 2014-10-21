# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: 'Agatha', last_name: 'Christie')
Author.create!(first_name: 'James', last_name: 'Chase')
Author.create!(first_name: 'Sidney', last_name: 'Sheldon')
Author.create!(first_name: 'Obie', last_name: 'Fernandez')
Author.create!(first_name: 'Cloves', last_name: 'Carneiro')
Author.create!(first_name: 'Rida', last_name: 'Al Barazi')

Publisher.create!( [ { name: 'Wiley' }, { name: 'Addison Wesley' },
                     { name: 'Peachpit Press' }, { name: 'Manning Publications' },
                     { name: 'No Starch Press' }, { name: 'Apress' }
])

Book.create!(title: 'Gnuplot in Action', isbn: '978032177297-8', page_count: 518, price: 38.56, description: 'A very cool graph creating software', 
             published_at: '2012-01-01', publisher_id: 3, book_cover: File.open(File.join(Rails.root, 'app/assets/images/gnuplot.jpg')))

