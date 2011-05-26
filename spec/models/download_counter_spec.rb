require 'spec_helper'


module DownloadCounterSpecHelper
  def valid_downloadCounter_attributes
    {
    :user   =>  mock_model(User, :name => "test user", :email => "test@test.com", :password => "123456", :role => "normal"),
    :fossil => mock_model(Fossil,     
    :name                      => "Test Fossil"           ,
     :description              =>  "This is a test fossil",
     :date_available_from      =>  Date.today             ,
     :date_available_to        =>  Date.tomorrow          ,
     :created_at               =>  Date.yesterday         ,
     :updated_at               =>  Date.yesterday         ,
     :attachment               =>  File.new(Rails.root + "public/images/rails.png"),
     :collection               => Collection.new
)
    }
  end
end

describe DownloadCounter do

  include DownloadCounterSpecHelper

  before(:each) do 
    @dlcounter = DownloadCounter.new 
  end

  it "should be valid" do 
    @dlcounter.attributes = valid_downloadCounter_attributes
    @dlcounter.should be_valid
  end

  it "should require a fossil" do 
    @dlcounter.attributes = valid_downloadCounter_attributes.except(:fossil)
    @dlcounter.should have(1).error_on(:fossil)
  end

end
