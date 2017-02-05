class Article < ApplicationRecord
  searchable_fields :title, :body
end
