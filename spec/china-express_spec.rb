# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ChinaExpress" do

  it "should be search" do
    Express.ickd_key = '884F851593116B5A861C63836004A9B2'
    result = Express.search('109888668888', 'shunfeng')
    result.should_not eql []
  end

end
