class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence:{message: "Комментарий не должен быть пустым!" }
end
