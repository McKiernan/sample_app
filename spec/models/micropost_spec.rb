require 'spec_helper'

describe Micropost do
	let(:user) { FactoryGirl.create(:user) }
	before do
		#@micropost = Micropost.new(content: "Lorum ipsum", user_id: user.id)
		@micropost = user.microposts.create(content: "Lorum ipsum")
	end

	subject { @micropost }
	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end
end
