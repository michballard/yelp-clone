require 'rails_helper'

RSpec.describe Review, :type => :model do

# test that a restaurant is associated

	it 'will not allow the input of an invalid rating' do 
		review = Review.new(rating: 100)
		expect(review).to have(1).error_on(:rating)
	end

end 