require 'spec_helper'

describe ToZh do
  it 'has a version number' do
    expect(ToZh::VERSION).not_to be nil
  end

  it 'should get zero' do
    expect(0.to_zh).to eq "零"
    expect(0000.to_zh).to eq "零"
  end

  it 'should get upper zh chars in length smaller than 4' do
    expect(123.to_zh).to eq "壹佰貳拾參"
    expect(456.to_zh).to eq "肆佰伍拾陸"
  end

  it 'should get upper zh chars in length larger than 5' do
    expect(12345.to_zh).to eq "壹萬貳仟參佰肆拾伍"
    expect(102345.to_zh).to eq "壹拾萬貳仟參佰肆拾伍"
  end

  it 'should get upper zh chars with zero offset' do
    expect(100002345.to_zh).to eq "壹億零貳仟參佰肆拾伍"
    expect(1000000002345.to_zh).to eq "壹兆零貳仟參佰肆拾伍"
  end

  it 'should get upper zh chars end with zero' do
    expect(100.to_zh).to eq "壹佰"
    expect(10000.to_zh).to eq "壹萬"
    expect(100000000.to_zh).to eq "壹億"
    expect(120.to_zh).to eq "壹佰貳拾"
    expect(10000102340.to_zh).to eq "壹佰億零壹拾萬貳仟參佰肆拾"
  end

  it 'should get upper zh chars with zero offset and end with zero' do
    expect(1000000000010.to_zh).to eq "壹兆零壹拾"
  end

end
