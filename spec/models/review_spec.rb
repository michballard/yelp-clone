require 'rails_helper'

RSpec.describe Review, :type => :model do

	it 'will not allow a rating above 5' do 
		review = Review.new(rating: 6)
		expect(review).to have(1).error_on(:rating)
		expect(review).not_to be_valid
	end

	it 'will not allow a rating below 1' do 
		review = Review.new(rating: 0)
		expect(review).to have(1).error_on(:rating)
		expect(review).not_to be_valid
	end

		it 'will allow a rating within the range of 1 and 5' do 
		review = Review.new(rating: 3)
		# expect(review).to have(1).error_on(:rating)
		expect(review).to be_valid
	end

end 