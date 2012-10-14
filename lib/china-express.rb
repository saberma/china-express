# encoding: utf-8
require 'httparty'
require 'json'
require 'express/company'
require 'express/result'

module Express # 快递查询
  include HTTParty
  include Company
  base_uri 'http://api.ickd.cn'
  format :json
  default_params type: :json, encode: :utf8, ord: :asc
  #debug_output
  class << self
    attr_accessor :key
  end

  # @number 运单号
  # @company 快递公司拼音
  def self.search(number, company, key = nil)
    options= { com: company_code(company), nu: number, id: (key || self.key )}
    body = get("/", query: options).body
    Result.new JSON(body)
  end
end
