require 'spec_helper'

describe "microposts/index" do
  before(:each) do
    assign(:microposts, [
      stub_model(Micropost),
      stub_model(Micropost)
    ])
  end

  it "renders a list of microposts" do
    render
  end
end
