# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ChinaExpress" do

  let(:key) { '774F751593116B5A761C63736004A9B2' }

  let(:number) { '109999669998' }

  let(:company) { 'shunfeng' } # 顺丰

  let(:body) do
    {
      'status' => "3",
      'message' => "",
      'errCode' => "0",
      'data' => [
        {'time' => "2012-09-28 19:19", 'content' => "已收件"},
        {'time' => "2012-09-28 19:58", 'content' => "快件在 深圳 ,准备送往下一站深圳集散中心"},
        {'time' => "2012-09-28 21:24", 'content' => "快件在 深圳集散中心 ,准备送往下一站上海集散中心"},
        {'time' => "2012-09-29 10:16", 'content' => "快件在 上海集散中心 ,准备送往下一站上海集散中心"},
        {'time' => "2012-09-29 15:58", 'content' => "快件在 上海集散中心 ,准备送往下一站上海"},
        {'time' => "2012-10-08 08:21", 'content' => "正在派件.."},
        {'time' => "2012-10-08 09:20", 'content' => "派件已签收"},
        {'time' => "2012-10-08 09:20", 'content' => "签收人是:马"}
      ]
    }.to_json.to_s
  end

  before do
    stub_request(:get, "http://api.ickd.cn/?com=#{company}&encode=utf8&id=#{key}&nu=#{number}&ord=asc&type=json").to_return(body: body)
    #WebMock.allow_net_connect!
  end

  it "should be search" do
    Express.ickd_key = key
    result = Express.search(number, company)
    result.success?.should be_true
    result.data.should_not be_empty
  end

end
