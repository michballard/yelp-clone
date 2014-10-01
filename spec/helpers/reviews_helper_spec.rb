require 'rails_helper'

describe ReviewsHelper, :type => :helper do 
  context '#star_rating' do 
    it 'does nothing for not a number' do 
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end

    it 'returns 5 black stars for 5 rating' do 
      expect(helper.star_rating(5)).to eq '★★★★★'
    end

    it 'returns 3 black stars and 2 white stars for rating of 3' do 
    	expect(helper.star_rating(3)).to eq '★★★☆☆'
    end

    it 'rounds to the nearest star for non whole numbers' do 
    	expect(helper.star_rating(3.5)).to eq '★★★★☆'
    end
    
  end
end
