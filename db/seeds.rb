# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Author.create!(first_name: 'Agatha', last_name: 'Christie')
  Author.create!(first_name: 'James', last_name: 'Chase')
  Author.create!(first_name: 'Sydney', last_name: 'Sheldon')
  Author.create!(first_name: 'Obie', last_name: 'Fernandez')
  Author.create!(first_name: 'Cloves', last_name: 'Carneiro')
  Author.create!(first_name: 'Rida', last_name: 'Al Barazi')

  Publisher.create!([{name: 'Wiley'}, {name: 'Addison Wesley'},
    {name: 'Peachpit Press'}, {name: 'Manning'}, {name: 'McGraw-Hill'},
    {name: 'No Start Press'}])

Book.create!(title: 'JavaScript Visual Quickstart Guide', isbn: '978-0-321-77297-8',
  page_count: 518, price: 38.75, description: 'A very cool and thorough js book',
  published_at: '2012-08-23', publisher_id: 3,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/negrino_js.jpg')))

Book.create!(title: 'Gnuplot in Action', isbn: '978-1-933-98839-9',
  page_count: 360, price: 66.37, description: 'A book on the awesome opensource plotting software',
  published_at: '2010-11-04', publisher_id: 4,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/gnuplot.jpg')))

Book.create!(title: 'The Rails 3 Way', isbn: '978-0-321-60166-7',
             page_count: 708, price: 49.99, description: 'The authoritative book on Rails 3',
  published_at: '2011-08-22', publisher_id: 2,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/rails3_way.jpg')))

Book.create!(title: 'Practical Database Programming with Java', isbn: '978-0-470-88940-4',
  page_count: 919, price: 120.37, description: 'Covers the practical considerations and applications in database programming using Java Netbeans IDE, JSP, JSF, and Java Beans',
  published_at: '2011-11-04', publisher_id: 1,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/practical_db.jpg')))

Book.create!(title: 'iText in Action', isbn: '978-1-935-18261-0',
  page_count: 585, price: 59.99, description: 'This opensource Java library has been the most popular and most broadly used tool for programmatic creation and manipulation of PDF',
  published_at: '2011-08-23', publisher_id: 4,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/itext.jpg')))

Book.create!(title: 'The Art of R Programming', isbn: '978-1-593-27384-2',
  page_count: 373, price: 39.95, description: 'This book takes you on a guided tour of software development wih R, from basic types and data structures to advanced topics like closures, 
  recursion and anonymous functions',
  published_at: '2011-11-04', publisher_id: 6,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/art_of_r.jpg')))

Book.create!(title: 'Introduction to Object-oriented Analysis and Design with UML and Unified Process', isbn: '0-071-21510-7',
             page_count: 395, price: 49.99, description: 'It introduces the object-oriented systems analysis and design',
  published_at: '2004-08-25', publisher_id: 5,
  book_cover: File.open(File.join(Rails.root, 'app/assets/images/ooa_design.jpg')))


  User.create(email:'emmanuel@example.com', first_name:'Emmanuel', last_name:'Asante', password:'password', admin: true)
  User.create(email:'john@example.com', first_name:'John', last_name:'Doe', password:'password', admin: false)
