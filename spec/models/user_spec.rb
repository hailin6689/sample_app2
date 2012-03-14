require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "micropost assoications" do
	before {@user.save }
	let!(:older_micropost) do
		FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
	end
	let!(:newer_micropost) do 
		FactoryGirl.create(:micropost, user: @use, created_at: 1.hour.ago)
	end

	it "should have the right microposts in the right order" do
		@user.microposts.should == [newer_micropost, older_micropost]
	end

	it "should destroy associated microposts" do
		microposts = @user.microposts
		@user.destroy
		microposts.each do |micropost|
			Micropost.find_by_id(micropost.id).should be_nil
		end
	end
  end
end
