require 'spec_helper'

describe "microposts/show" do
  before(:each) do
    @micropost = assign(:micropost, stub_model(Micropost))
  end

  it "renders attributes in <p>" do
    render
  end
end
