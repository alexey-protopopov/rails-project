class User < ApplicationRecord
	validates :username,  uniqueness: {message: "Это имя пользователя уже занято!"}
	validates :username,  length: { in: 1..20, message: "Имя пользователя — от 1 до 20 символов!"}
	validates :password,  length: { in: 6..20, message: "Пароль — от 6 до 20 символов!"}
	has_secure_password
end