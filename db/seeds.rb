50.times do
  title = Faker::Book.title
  author = Faker::Book.author
  description = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Book.create title: title, author: author, description: description
end
