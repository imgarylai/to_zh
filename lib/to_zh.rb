require "to_zh/version"

module ToZh
  module InstanceMethods
    def to_zh
      ToZh.to_zh(self)
    end
  end

  @upper_digit = { "1" => "壹", "2" => "貳", "3" => "參", "4" => "肆", "5" => "伍", "6" => "陸",
     "7" => "柒", "8" => "捌", "9" => "玖"}
  @lower_digit = { "1" => "一", "2" => "二", "3" => "三", "4" => "四", "5" => "五", "6" => "六",
     "7" => "七", "8" => "八", "9" => "九"}
  @upper_decimal_unit = ['', '拾', '佰', '仟']
  @lower_decimal_unit = ['', '十', '百', '千']
  @thousand_unit = ['', '萬', '億', '兆', '京', '垓', '秭', '穰', '溝', '澗', '正', '載', '極']

  def self.to_upper_zh int
    # ex: convert 100 -> 壹佰, 123,456,789 -> 壹億貳仟參佰肆拾伍萬陸仟柒佰捌拾玖
    digit_conversion(int, true)
  end

  def self.to_lower_zh int
    # ex: convert 100 -> 一百, 123,456,789 -> 一億兩千三百四十五萬六千七百八十九
    digit_conversion(int, false)
  end

  private

  def digit_conversion int, is_upper
    ary = int.to_s.split("").reverse!
    new_ary = Array.new
    ary.each_index do |i|
      new_ary.push(unit_conversion(i, is_upper))
      is_upper ? new_ary.push(@upper_digit[ary[i]]) : new_ary.push(@lower_digit[ary[i]])
    end
    return new_ary.reverse.join
  end

  def unit_conversion i, is_upper
  case (i % 4)
  when 0
    @thousand_unit[i / 4]
  when 1..3
    is_upper ? @upper_decimal_unit[i % 4] : @lower_decimal_unit[i % 4]
  end
end

Integer.send :include, ToZh::InstanceMethods
