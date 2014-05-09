require 'spec_helper'

describe ServicesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'thanks'" do
    it "returns http success" do
      get 'thanks'
      response.should be_success
    end
  end

end
