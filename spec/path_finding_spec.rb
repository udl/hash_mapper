require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class OneLevel
  extend HashMapper
  map from('/name'),            to('/nombre')
end
class MoreMappings
  extend HashMapper
  map from('/narme'), to('/name')
  map from('/nombre'), to('/name')
  map from('/naim'), to('/name')
  map from('/nombre'), to('/nombre')
end
describe "PathFinding" do
  before :each do
    @from = {:name => 'ismael'}
    @to   = {:nombre => 'ismael'}
  end
 it "should map to" do
    OneLevel.find_from_paths('/nombre').first.path.should == '/name'
    OneLevel.find_to_paths('/name').first.path.should == '/nombre'
  end

  it "should find all mappings" do
    MoreMappings.find_from_paths('/name').collect{|p| p.path}.should == ['/narme', '/nombre', '/naim']
    MoreMappings.find_to_paths('/nombre').collect{|p| p.path}.should == ['/name', '/nombre']
  end
 
end

