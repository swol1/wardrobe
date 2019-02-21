require_relative "clothes_item"

class ClothesCollection
  attr_reader :selected_clothes, :all_clothes

  def initialize(clothes_path)
    @all_clothes =
      clothes_path.map do |file|
        lines = File.readlines(file, chomp: true)
        ClothesItem.new(lines)
      end

    @clothes_by_temperature = []
    @selected_clothes = []
  end

  def select_by_temp(temp_value)
    @clothes_by_temperature = @all_clothes.select { |item| item.weather_suitable?(temp_value) }

    random_same_types
  end

  def random_same_types
    all_types = @clothes_by_temperature.group_by { |item| item.type }
    all_types.each_value { |value| @selected_clothes << value.sample }
  end
end
