class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: {message: "Заголовок не должен быть пустым!" }
	validates :body, length:{minimum: 5,message: "Длина поста должна быть не менее 5 символов!" }
end
