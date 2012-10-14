# encoding: utf-8
module Express
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
