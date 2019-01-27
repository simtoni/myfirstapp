require 'rails_helper'

describe Product do

  let(:product) { Product.create!(name: "Name of a Product") }
  # let(:user) { User.create!(email: "test@mail.com", password: "test123") }

  before do
    @user = FactoryBot.create(:user)

    product.comments.create!(rating: 1, user: @user, body: "This is a comment!")
    product.comments.create!(rating: 3, user: @user, body: "This is another comment!")
    product.comments.create!(rating: 5, user: @user, body: "This is one more comment!")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "is not valid without a name" do
    expect(Product.new(description: "This describes a product")).not_to be_valid
  end

end
