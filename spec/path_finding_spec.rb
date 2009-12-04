require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class OneLevel
  extend HashMapper
  map from('/name'),            to('/nombre')
end
class MoreMappings
  extend HashMapper
  map from('/nombre'), to('/name')
  map from('/nombre'), to('/nombre')
end
describe "PathFinding" do
  before :each do
    @from = {:name => 'ismael'}
    @to   = {:nombre => 'ismael'}
  end
 it "should map to" do
    OneLevel.find_from_path('/nombre').path.should == '/name'
    OneLevel.find_to_paths('/name').first.path.should == '/nombre'
  end

  it "should find_from_path" do
    MoreMappings.find_from_path('/name').path.should == '/nombre'
  end

  it "should find_to_paths" do
    MoreMappings.find_to_paths('/nombre').collect{|p| p.path}.should == ['/name', '/nombre']
  end
 
end

