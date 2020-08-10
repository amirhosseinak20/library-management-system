json.pagination do
  json.page @page
  json.count @count.ceil
  json.items_count @items_count
end
json.books do
  json.array! @books do |book|
    json.title book.title
    json.image book.front_cover.attached? ? url_for(book.front_cover) : asset_url("front-cover-placeholder.jpg")
    json.authors do
      json.array! book.authors do |author|
        json.name "#{author.first_name} #{author.last_name}"
        json.url user_path(author.id)
        json.avatar author.avatar.attached? ? url_for(author.avatar) : gravatar_image_url(author.email)
      end
    end
    json.url book_path(book.id)
  end
end
