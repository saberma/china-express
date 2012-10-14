# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Company" do

  let(:list) do 
    {
      '顺丰快递' => 'shunfeng',
      '顺丰' => 'shunfeng',
      'EMS' => 'ems',
      'ems' => 'ems',
      '申通E物流' => 'shentong',
      '申通快递' => 'shentong',
      '申通' => 'shentong',
      '圆通快递' => 'yuantong',
      '圆通速递' => 'yuantong',
      '圆通' => 'yuantong',
      '中通速递' => 'zhongtong',
      '中通' => 'zhongtong',
      '宅急送快递' => 'zhaijisong',
      '宅急送' => 'zhaijisong',
      '韵达快运' => 'yunda',
      '韵达快递' => 'yunda',
      '天天快递' => 'tiantian',
      '联邦快递' => 'fedexcn',
      'Fedex国内' => 'fedexcn',
      '汇通快运' => 'huitong',
      '汇通快递' => 'huitong'
    }
  end

  it "should be search" do
    list.each do |name, code|
      Express.company_code(name).should eql code
    end
  end

end
