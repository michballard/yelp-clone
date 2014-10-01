require 'rails_helper'

describe 'restaurants' do 
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end
	context 'restaurants have been added' do 
		before do
			Restaurant.create(name: 'KFC')
		end
		it "should display them" do 
			visit '/restaurants'
			expect(page).to have_content('KFC')
			expect(page).not_to have_content("No restaurants")
		end
	end
end

describe "creating restaurants" do 
	context 'a valid restaurant' do 
		it "prompts user to fill out a form, then displays the new restaurant" do 
	    visit '/restaurants'
	    click_link 'Add a restaurant'
	    fill_in 'Name', with: 'KFC'
	    click_button 'Create Restaurant'
	    expect(page).to have_content 'KFC'
	    expect(current_path).to eq '/restaurants'
		end

		it "with a location" do
			visit '/restaurants'
	    click_link 'Add a restaurant'
	    fill_in 'Name', with: 'KFC'
			fill_in 'Location', with: 'Old Street'
			fill_in 'Postcode', with: 'EC2'
			fill_in 'Description', with: 'A restaurant that sells chicken'
	    click_button 'Create Restaurant'
	    click_link 'KFC'
	    expect(page).to have_content('KFC')
	    expect(page).to have_content('Old Street')
	    expect(page).to have_content('EC2')
		end
	end

	context 'an invalid restaurant' do 
		it 'does not let you submit without a name that is too short' do 
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'ab'
			fill_in 'Location', with: ''
			fill_in 'Postcode', with: ''
			fill_in 'Description', with: ''
			click_button 'Create Restaurant'
			expect(page).not_to have_css 'h2', text: 'kf'
			expect(page).to have_content 'error'
		end
	end
end

describe 'editing restaurants' do 
	before do 
		Restaurant.create(name: 'KFC')
	end
	it 'can allow a user to edit a restaurant' do 
		visit '/restaurants'
		click_link 'Edit KFC'
		fill_in 'Name', with: 'Kentucky fried chicken'
		click_button 'Update Restaurant'
		expect(page).to have_content 'Kentucky fried chicken'
		expect(current_path).to eq '/restaurants'
	end
end

describe 'deleting restaurants' do 
	before do 
		Restaurant.create(name: 'KFC')
	end
	it 'removes a restaurant when a user clicks a delete link' do 
    visit '/restaurants'
    click_link 'Delete KFC'
    expect(page).not_to have_content 'KFC'
    expect(page).to have_content 'Restaurant deleted successful'
	end 
end 

describe 'viewing a restaurant' do 
	before do 
		@restaurant = Restaurant.create(name: 'KFC',  
											description: 'A restaurant that sells fried chicken')
	end
	it 'can view a restaurant when a user clicks the restaurant name link' do 
    visit '/restaurants'
    click_link 'KFC'
    expect(page).not_to have_content 'Add a restaurant'
    expect(current_path).to eq restaurant_path(@restaurant)
    expect(page).to have_content 'A restaurant that sells fried chicken'
    # expect(currentpath).to match(/restaurants\/\d/)
	end

end