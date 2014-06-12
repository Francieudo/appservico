json.array!(@comments_photo) do |cp|
  json.extract! cp, :id_photo, :name, :title, :body
end