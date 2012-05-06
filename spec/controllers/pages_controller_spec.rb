require 'spec_helper'

describe PagesController do
  render_views

before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
end

  describe "GET 'home'" do
	describe "when not signed in" do

      before(:each) do
        get :home
      end

    it "should be successful" do
      get 'home'
      response.should be_success
    end

     it "should have the right title" do
        response.should have_selector("title",
                                      :content => "#{@base_title} | Home")
      end
    end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content =>
                          "Ruby on Rails Tutorial Sample App | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                        :content =>
                          "Ruby on Rails Tutorial Sample App | About")
    end
  end

describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                        :content =>
                          "Ruby on Rails Tutorial Sample App | Help")
    end
  end

describe "for signed-in users" do 

before(:each) do 
@user = test_sign_in(Factory(:user)) 
@mp1 = Factory(:micropost, :user => @user) 
end 

it "should have micropost count in sidebar" do 
get :home 
response.should have_selector("span.microposts", :content => "1 micropost") 
@mp2 = Factory(:micropost, :user => @user) 
get :home 
response.should have_selector("span.microposts", :content => "2 microposts") 
		end 
	end 
end

