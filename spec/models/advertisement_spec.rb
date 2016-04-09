require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "Ad Title", body: "Ad body", price: 5) }
  
  describe "attributes" do
    it "responds to title" do
        expect(advertisement).to respond_to(:title)
    end
    
    it "responds to body" do
        expect(advertisement).to respond_to(:body)
    end
    
    it "responds to price" do
        expect(advertisement).to respond_to(:price)
    end
  end
end
