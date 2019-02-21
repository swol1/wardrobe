require_relative "lib/clothes_item"
require_relative "lib/clothes_collection"
require_relative 'lib/temperature'

dir_clothes = Dir["data/*.txt"]
clothes = ClothesCollection.new(dir_clothes)

CITIES = {
  'Москва' => '37',
  'Абу Даби' => '326',
  'Амстердам' => '279',
  'Бали' => '263',
  'Брюссель' => '287',
  'Веллингтон' => '409',
  'Венеция' => '368',
  'Лондон' => '248'
}.freeze

all_cities = CITIES.keys

puts 'В каком городе Вы хотите узнать погоду?'
all_cities.each_with_index { |city, index| puts "#{index + 1}. #{city}" }
user_choice = gets.to_i

city_value = CITIES[all_cities[user_choice - 1]]
city  = CITIES.key(city_value)

temperature_from_net =
  Temperature.xml_from_net("https://xml.meteoservice.ru/export/gismeteo/point/#{city_value}.xml")

begin
  puts "В #{city} сейчас #{temperature_from_net} градусов"
rescue
  puts "Не установлено соединение с сетью, введите температуру вручную"
  user_input = STDIN.gets.to_i
  clothes.select_by_temp(user_input)
else
  clothes.select_by_temp(temperature_from_net)
end

puts
puts "Предлагаем сегодня надеть"
puts
puts clothes.selected_clothes
puts



