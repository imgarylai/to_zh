require 'to_zh/version'

module ToZh
  module InstanceMethods
    def to_zh
      ToZh.to_zh(self)
    end
  end
  UPPPER_DIGIT = ['零', '壹', '貳', '參', '肆', '伍', '陸', '柒', '捌', '玖']
  UPPER_DECIMAL_UNIT = ['', '拾', '佰', '仟']
  LOWER_DIGIT = ['零', '一', '二', '三', '四', '五', '六', '七', '八', '九']
  LOWER_DECIMAL_UNIT = ['', '十', '百', '千']
  THOUSAND_UNIT = ['', '萬', '億', '兆', '京', '垓', '秭', '穰', '溝', '澗', '正', '載', '極']
  UNIT_LENGTH = 4

  def self.to_zh int
    negative = (int < 0)
    return UPPPER_DIGIT[int] if int == 0
    arr = int.abs.to_s.chars.map(&:to_i).reverse.each_slice(4).map(&:reverse).reverse
    result = []
    need_zero_offset = true
    arr.each_with_index do |a, index|
      if a.inject(:+) == 0 && need_zero_offset && arr.last.inject(:+) != 0
        result.push(UPPPER_DIGIT[0])
        need_zero_offset = false
      elsif a.inject(:+) != 0
        a.each_with_index do |i, index|
          if i == 0 && index == 0 && need_zero_offset
            result.push(UPPPER_DIGIT[i])
          elsif i == 0 && index != 0
            next
          elsif i != 0
            result.push(UPPPER_DIGIT[i])
            result.push(UPPER_DECIMAL_UNIT[a.length - index - 1])
          end
        end
        result.push(THOUSAND_UNIT[(int.to_s.length/UNIT_LENGTH.to_f).ceil - index - 1])
        need_zero_offset = true
      end
    end
    result.join
  end

end

Integer.send(:include, ToZh::InstanceMethods)
