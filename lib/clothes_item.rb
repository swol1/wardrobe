require_relative "clothes_collection"

class ClothesItem
  attr_reader :name, :type, :range

  def initialize(all_clothes)
    @name = all_clothes[0]
    @type = all_clothes[1]

    temperature = all_clothes[2].gsub(/[^\d +-]/, " ").split(" ")
    @range = temperature[0].to_i..temperature[1].to_i
  end

  def weather_suitable?(user_temp)
    @range.include?(user_temp)
  end

  def to_s
    "#{name} (#{type}) #{range}"
  end
end
