class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3, message: ": please create a longer name"}, uniqueness: true
end
