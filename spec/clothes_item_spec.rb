require 'clothes_item'

describe ClothesItem do
  before(:all) do
    file_info = File.readlines('spec/fixtures/head_1.txt', chomp: true)
    @clothes_item = ClothesItem.new(file_info)
  end

  it 'show temperature range from a single file' do
    expect(@clothes_item.range).to eq -20..-5
  end

  it 'show the name from a single file' do
    expect(@clothes_item.name).to eq 'Шапка-ушанка'
  end

  it 'show the type from a single file' do
    expect(@clothes_item.type).to eq 'Головной убор'
  end

  it 'show false for temperature 20' do
    expect(@clothes_item.weather_suitable?(20)).to eq false
  end

  it 'show true for temperature -5' do
    expect(@clothes_item.weather_suitable?(-5)).to eq true
  end

  it 'show string with all info' do
    expect(@clothes_item.to_s).to eq 'Шапка-ушанка (Головной убор) -20..-5'
  end
end
