require "to_zh_num/version"

module ToZhNum
  module InstanceMethods
    def to_zh_num
      ToZhNum.to_zh_num(self)
    end
  end

  def self.to_zh_num int
    upper_zh_num = ['零', '壹', '貳', '參', '肆', '伍', '陸', '柒', '捌', '玖']
    decimal_unit = ['', '拾', '佰', '仟']
    thousand_unit = ['', '萬', '億', '兆', '京', '垓', '秭', '穰', '溝', '澗', '正', '載', '極']
    # ex: convert 100 -> 壹佰, 123,456,789 -> 壹億貳仟參佰肆拾伍萬陸仟柒佰捌拾玖
  end
end

Integer.send :include, ToZhNum::InstanceMethods
