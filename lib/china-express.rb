# encoding: utf-8
require 'httparty'
require 'json'

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
    options= { com: company, nu: number, id: (key || self.ickd_key )}
    body = get("/", query: options).body
    Result.new JSON(body)
  end

  class Result
    attr_accessor :status, :data

    def initialize(json)
      self.status = json['status']
      self.data = json['data']
    end

    def success?
      status == '3'
    end

    def to_s
      {success: self.success?, data: self.data}.to_s
    end
  end
end
