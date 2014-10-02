require 'rails_helper'

describe 'endorsing reviews' do 
	before do 
		kfc = Restaurant.create(name: 'KFC')
		kfc.reviews.create(rating: 3, thoughts: 'OK')
	end

	it 'shows 0 endorsements when a restaurant has not been endorsed', js: true do 
		visit '/restaurants'
		expect(page).to have_content '0 endorsements'
	end

	it 'can show an endorsement updating the review endorsement count', js: true do 
		visit '/restaurants'
		click_link 'Endorse this review'
		expect(page).to have_content '1 endorsement'
	end

	it 'can show two endorsements updating the review endorsement count and pluralising the endorsement text', js: true do 
		visit '/restaurants'
		click_link 'Endorse this review'
		click_link 'Endorse this review'
		expect(page).to have_content '2 endorsements'
	end

end
