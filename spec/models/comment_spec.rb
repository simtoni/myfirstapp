require 'rails_helper'


describe Comment do
  context "when comments are created" do
    let(:product) { Product.create!(name: "t-shirt") }

    before do
      @user = FactoryBot.create(:user)
    end

    it "is not valid without a user" do
      expect(Comment.new(rating: 3, body: "This is a comment.")).not_to be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(body: nil)).not_to be_valid
    end

    it "is not valid without a rating" do
      expect(Comment.new(rating: nil)).not_to be_valid
    end

    it "is not valid without a product_id" do
      expect(Comment.new(product_id: nil)).to_not be_valid
    end

    it "only valid with all user, rating, body" do
      expect(Comment.new(user_id: @user.id, product_id: product.id, body: "This is a comment.", rating:3)).to be_valid
    end
  end
end
