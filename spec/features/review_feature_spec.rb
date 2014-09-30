# require 'rails_helper'

# 	describe 'reviewing' do 
# 	before do 
# 	  Restaurant.create(name: KFC)
# 	end

# 	it 'allows users to leave reviews using the form which appear alongside restaurants' do 
# 	  visit '/restaurants'
# 	  click_link 'Review KFC'
# 	  fill_in 'thoughts', with: ‘so so’
# 	  select ‘3’, from: ‘Rating’
# 	  click_button ‘Leave review’
# 	  expect(current_path).to eq ‘/restaurants’
# 	  expect(page).to have_content ‘so so'
# 	end

# end