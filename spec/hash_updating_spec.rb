require File.dirname(__FILE__) + '/spec_helper.rb'

class OneLevel
  extend HashMapper
  map from('/new_reversals'), to('/reversals') {|reversals, new_reversals| reversals + new_reversals }
  map from('/new_reversals'), to('/sales') {|sales, new_reversals| sales - new_reversals }
end

describe 'updating a hash with one level' do

  before :each do
    @from = {:sales => 5, :reversals => 1}
    @to   = {:new_reversals => 2}
  end
  
  it "should map to" do
    OneLevel.update(@from, @to).should == HashWithIndifferentAccess.new({:sales=>3, :reversals=>3})
  end

end

