require File.join(File.dirname(__FILE__), 'spec_helper')

describe "oa-blip strategry" do

  let(:strategy) { OmniAuth::Strategies::Blip }

  it 'should be initializable with only three arguments' do
    lambda{ strategy.new(lambda{|env| [200, {}, ['Hello World']]}, 'key', 'secret') }.should_not raise_error
  end

  it 'should be initializable with a block' do
    lambda{ strategy.new(lambda{|env| [200, {}, ['Hello World']]}){|s| s.consumer_key = 'abc'} }.should_not raise_error
  end

  it 'should handle the setting of client options' do
    s = strategy.new(lambda{|env| [200, {}, ['Hello World']]}, 'key', 'secret', :client_options => {:abc => 'def'})
    s.consumer.options[:abc].should == 'def'
  end

end
