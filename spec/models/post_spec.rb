require 'spec_helper'

describe Post do
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(title: "Lorem ipsum", text: "Lorem ipsum") }
  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:text) }
  it { should respond_to(:user_id) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not presence" do
  	before { @post.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank title" do
  	before { @post.title = "" }
  	it { should_not be_valid }
  end

  describe "with blank text" do
  	before { @post.text = "" }
  	it { should_not be_valid }
  end
end
