# encoding: utf-8
module Express
  module Company
    DATA = {
      '顺丰快递' => 'shunfeng'
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def company_code(name)
        DATA[name] || name
      end

    end
  end
end
