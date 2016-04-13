require 'rails_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'deletes reviews associated with it when deleted' do
    rest = Restaurant.create name: 'KFC'
    review  = rest.reviews.create(thoughts: 'Thought', rating: 2)
    rest.destroy
    expect(Review.all).to_not include review
  end

  it 'is not a valid name if less than 3 characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).to_not be_valid
  end
end
