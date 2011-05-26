require 'spec_helper'

module FossilSpecHelper
  def valid_fossil_attributes
    {
    
    :name                      => "Test Fossil"           ,
     :description              =>  "This is a test fossil",
     :date_available_from      =>  Date.today             ,
     :date_available_to        =>  Date.tomorrow          ,
     :created_at               =>  Date.yesterday         ,
     :updated_at               =>  Date.yesterday         ,
     :attachment               =>  File.new(Rails.root + "public/images/rails.png"),
     :collection               => Collection.new
    }
  end
end

describe Fossil do

  include FossilSpecHelper

  before(:each) do 
    @fossil = Fossil.new 
  end 
  
  it "should be valid" do 
    @fossil.attributes = valid_fossil_attributes
    @fossil.should be_valid
  end
  
  it "should require name" do 
    @fossil.attributes = valid_fossil_attributes.except(:name)
    @fossil.should have(1).error_on(:name) 
  end
  
  it "should require a Collection" do 
    @fossil.attributes = valid_fossil_attributes.except(:collection)
    @fossil.should have(1).error_on(:collection)
  end
  
  it "should require an attachment" do 
    @fossil.attributes = valid_fossil_attributes.except(:attachment)
    @fossil.should have(1).error_on(:attachment_file_name)
  end
  
  
  it "should report the right attachment metadata" do 
    @fossil.should have_attached_file(:attachment)
  end
  
end
