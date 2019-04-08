z = 0

5.times do
  z += 1

Article.seed do |s|
  s.title = "title#{z}"
  s.body = "body#{z}"
  s.image_id = Rails.root.join("db/fixtures/image/test#{z}.jpg").open
end
end
