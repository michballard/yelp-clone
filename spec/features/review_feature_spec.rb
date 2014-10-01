require 'rails_helper'

	describe 'reviewing' do 

		before do 
		  Restaurant.create(name: 'KFC',
										  	description: 'A restaurant that sells fried chicken')
		end

	  def leave_review(thoughts, rating)
	    visit restaurants_path
		  click_link 'Review KFC'
		  fill_in 'Thoughts', with: thoughts
		  select rating, from: 'Rating'
		  click_button 'Leave review'
	  end

		it 'allows users to leave reviews using the form which appear alongside restaurants' do 
	    leave_review('So so', '3')
		  expect(current_path).to eq '/restaurants'
		  expect(page).to have_content 'So so'
		end

		it 'displays an average rating for all reviews' do 
	    leave_review('So so', '3')
	    leave_review('Great', '5')
	    expect(page).to have_content('Average rating: ★★★★☆')
		end 

		it 'displays a timestamp' do 
      leave_review('So so', '3')
      expect(page).to have_content('posted: less than a minute ago')
		end

end