require 'spec_helper'

describe Collection do 

  before(:each) do 
    @public_collection = mock_model(Collection, :name => 'test collection', :public => true)
    @private_collection = mock_model(Collection, :name => 'test collection', :public => false)
  end
  
  it "should be valid" do 
    @public_collection.should be_valid
  end  
  
end