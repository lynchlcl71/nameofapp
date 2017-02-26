require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: "race bike")
    
      #@user = User.create!(email: "email@test.com", password: "mypass")
      @user = FactoryGirl.create(:user)

      @product.comments.create!(rating: 1, user: @user, body: "Lousy bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Super bike")
      @product.comments.create!(rating: 5, user: @user, body: "Love this bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "when product is not named" do
    it "is not valid" do
      expect(Product.new(description: "Nice Bike")).not_to be_valid
    end
  end
end



# require 'rails_helper'

# describe Product do 
#    context "when the product has comments" do
#         before do
#                @product = Product.create!(name: "race bike")
#                @user = User.create!(email: "email@test.com", password: "mypass")
#                @product.comments.create!(rating: 1, user: @user, body: "Lousy bike!")
#                @product.comments.create!(rating: 3, user: @user, body: "Super bike")
#                @product.comments.create!(rating: 5, user: @user, body: "Love this bike!")
#         end
#         it "returns the average rating of all comments" do
#             expect(@product.average_rating).to eq 3
#         end
#         it "is not valid" do
#             expect(Product.new(description: "Nice bike")).not_to be_valid
#         end
#     end
# end