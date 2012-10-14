# encoding: utf-8
require 'httparty'

class Express # 快递查询
  include HTTParty
  base_uri 'http://api.ickd.cn'
  format :json
  default_params type: :json, encode: :utf8, ord: :asc
  #debug_output
  class << self
    attr_accessor :ickd_key
  end

  # @number 运单号
  # @company 快递公司拼音
  def self.search(number, company, key = nil)
    options= { com: company, nu: number, id: key || self.ickd_key }
    get("/", query: options)
  end
end
