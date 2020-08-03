# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = Role.create([{ name: 'student' }, { name: 'author' }, { name: 'admin' }])
permissions = Permission.create([
                                  {
                                    name: 'createBook',
                                    description: 'This privilege grants user to create books'
                                  }, {
                                    name: 'editBooks',
                                    description: 'This privilege grants user to edit books'
                                  }, {
                                    name: 'deleteBooks',
                                    description: 'This privilege grants user to delete books'
                                  }, {
                                    name: 'seeBooks',
                                    description: 'This privilege grants user to see books'
                                  }
                                ])
roles[0].permissions = [permissions[3]]
roles[1].permissions = [permissions[3], permissions[1], permissions[0]]
roles[2].permissions = [permissions[3], permissions[2], permissions[1], permissions[0]]
roles.each(&:save)

users = User.create([
                      {
                        first_name: 'amirhossein',
                        last_name: 'akbari',
                        nickname: 'amirhosseinak20',
                        birth_date: Date.new(1998, 9, 15),
                        email: 'amirhosseinakbarie@gmail.com',
                        phone: '+989185796491',
                        password: '123456789'
                      }, {
                        first_name: 'super',
                        last_name: 'admin',
                        nickname: 'superadmin',
                        birth_date: Date.new(1998, 9, 15),
                        email: 'horsun6@gmail.com',
                        phone: '+989185796493',
                        password: '123456789'
                      }, {
                        first_name: 'Delia',
                        last_name: 'Owens',
                        birth_date: Date.new(1949, 12, 12),
                        email: 'deliaOwens@test.com',
                        phone: '+989185796494',
                        password: '123456789'
                      }, {
                        first_name: 'Jeanine',
                        last_name: 'Cummins',
                        birth_date: Date.new(1949, 12, 13),
                        email: 'jeaninecummins@test.com',
                        phone: '+989185796495',
                        password: '123456789'
                      }, {
                        first_name: 'Celeste',
                        last_name: 'Ng',
                        birth_date: Date.new(1980, 7, 30),
                        email: 'celesteng@test.com',
                        phone: '+989185796496',
                        password: '123456789'
                      }, {
                        first_name: 'Tara',
                        last_name: 'Westover',
                        birth_date: Date.new(1986, 9, 27),
                        email: 'tarwestover@test.com',
                        phone: '+989185796497',
                        password: '123456789'
                      }, {
                        first_name: 'Philip',
                        last_name: 'Rucker',
                        birth_date: Date.new(1986, 9, 27),
                        email: 'philiprucker@test.com',
                        phone: '+989185796498',
                        password: '123456789'
                      }, {
                        first_name: 'Carol',
                        last_name: 'Leonnig',
                        birth_date: Date.new(1966, 1, 1),
                        email: 'carolleoning@test.com',
                        phone: '+989185796499',
                        password: '123456789'
                      }
                    ])
users[0].role = roles[0]
users[1].role = roles[2]
users[2].role = roles[1]
users[3].role = roles[1]
users[4].role = roles[1]
users[5].role = roles[1]
users[6].role = roles[1]
users[7].role = roles[1]
users.each(&:save)

publishers = Publisher.create([
                                {
                                  name: "G. P. Putnam's Sons"
                                }, {
                                  name: "Macmillan Publishers"
                                }, {
                                  name: "Penguin Group"
                                }, {
                                  name: "Houghton Mifflin Harcourt Company"
                                }, {
                                  name: "Robert Hartnoll Limited"
                                }, {
                                  name: "Black Lawrence Press"
                                }, {
                                  name: "Random House"
                                }
                              ])
books = Book.create([
                      {
                        title: 'Where the Crawdads Sing',
                        isbn: '0735219117',
                        pages: 368,
                        genre: ['Novel', 'Bildungsroman', 'Mystery', 'Coming-of-age story'],
                        language: 'English',
                        publication_date: Date.new(2018, 8, 14)
                      }, {
                        title: 'American Dirt',
                        genre: ['Fiction', 'Thriller', 'Suspense'],
                        pages: 400,
                        language: 'English',
                        isbn: '9781250209764',
                        publication_date: Date.new(2020, 1, 21)
                      }, {
                        title: 'Little Fires Everywhere',
                        genre: ['Domestic Fiction', 'Novel'],
                        pages: 352,
                        language: 'English',
                        isbn: '0735224293',
                        publication_date: Date.new(2017, 1, 1)
                      }, {
                        title: 'Delia and Mark Owens in Africa: A Life in the Wild',
                        genre: ['Biography', 'Autobiography', 'Travel literature'],
                        pages: 960,
                        language: 'English',
                        isbn: '9780358394211',
                        publication_date: Date.new(2020, 7, 19)
                      }, {
                        title: 'Secrets of the Savanna: Twenty-three Years in the African Wilderness Unraveling the Mysteries of Elephants and People',
                        genre: ['Biography', 'Guidebook'],
                        pages: 230,
                        language: 'English',
                        isbn: '9780395893104',
                        publication_date: Date.new(2006, 1, 1)
                      }, {
                        title: 'Cry of the Kalahari',
                        genre: ['Guidebook', 'Autobiography', 'Travel literature'],
                        pages: 230,
                        language: 'English',
                        isbn: '9780395893104',
                        publication_date: Date.new(2006, 1, 1)
                      }, {
                        title: 'The Crooked Branch',
                        genre: ['Psychological Fiction', 'Domestic Fiction'],
                        pages: 400,
                        language: 'English',
                        isbn: '9781101615072',
                        publication_date: Date.new(2013, 1, 1)
                      }, {
                        title: 'The Outside Boy',
                        genre: ['Bildungsroman', 'Domestic Fiction'],
                        pages: 384,
                        language: 'English',
                        isbn: '9781101429679',
                        publication_date: Date.new(2010, 1, 1)
                      }, {
                        title: 'A Rip in Heaven',
                        genre: ['Autobiography', 'True crime'],
                        pages: 320,
                        language: 'English',
                        isbn: '9781440627910',
                        publication_date: Date.new(2004, 1, 1)
                      }, {
                        title: 'Many Small Fires',
                        genre: ['Fiction'],
                        pages: 98,
                        language: 'English',
                        isbn: '9781625579188',
                        publication_date: Date.new(2015, 1, 1)
                      }, {
                        title: 'Everything I Never Told You',
                        genre: ['Novel', 'Mystery', 'Thriller', 'Suspense', 'Psychological Fiction'],
                        pages: 298,
                        language: 'English',
                        isbn: '9781625579188',
                        publication_date: Date.new(2014, 6, 26)
                      }, {
                        title: 'Educated: A Memoir ',
                        genre: ['Biography', 'Autobiography'],
                        pages: 352,
                        language: 'English',
                        isbn: '9780399590504',
                        publication_date: Date.new(2018, 2, 18)
                      }, {
                        title: 'A Very Stable Genius',
                        genre: ['Biography'],
                        pages: 465,
                        language: 'English',
                        isbn: '9781984877499',
                        publication_date: Date.new(2020, 1, 21)
                      }
                    ])
books[0].publisher = publishers[0]
books[0].authors = [users[2]]
books[1].publisher = publishers[1]
books[1].authors = [users[3]]
books[2].publisher = publishers[2]
books[2].authors = [users[4]]
books[3].publisher = publishers[3]
books[3].authors = [users[2]]
books[4].publisher = publishers[3]
books[4].authors = [users[2]]
books[5].publisher = publishers[4]
books[5].authors = [users[2]]
books[6].publisher = publishers[2]
books[6].authors = [users[3]]
books[7].publisher = publishers[2]
books[7].authors = [users[3]]
books[8].publisher = publishers[2]
books[8].authors = [users[3]]
books[9].publisher = publishers[5]
books[9].authors = [users[4]]
books[10].publisher = publishers[2]
books[10].authors = [users[4]]
books[11].publisher = publishers[6]
books[11].authors = [users[5]]
books[12].publisher = publishers[2]
books[12].authors = [users[6], users[7]]
books.each do |book|
  if book.errors.any?
    puts book.publisher
    puts book.errors.full_messages
  else
    book.save
  end
end
