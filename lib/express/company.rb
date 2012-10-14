# encoding: utf-8
module Express
  module Company
    MATCHES = {
      /顺丰/ => 'shunfeng',
      /ems/i => 'ems',
      /申通/ => 'shentong',
      /圆通/ => 'yuantong',
      /中通/ => 'zhongtong',
      /宅急送/ => 'zhaijisong',
      /韵达/ => 'yunda',
      /天天/ => 'tiantian',
      /联邦|Fedex/i => 'fedexcn',
      /汇通/ => 'huitong'
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def company_code(name)
        result = ''
        MATCHES.each do |pattern, code|
          if name =~ pattern
            result = code
            break
          end
        end
        result
      end

    end
  end
end
