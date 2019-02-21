require 'clothes_collection'

describe ClothesCollection do
  before(:all) do
    dir_clothes = Dir["spec/fixtures/*.txt"]
    @clothes = ClothesCollection.new(dir_clothes)
  end

  it 'show unique type of clothes selected by temperature (10)' do
    @clothes.select_by_temp(10)

    result = @clothes.selected_clothes

    expect(result[0].to_s).to eq("Пальто (Верхняя одежда) -5..10")
    expect(result[1].to_s).to eq("Кроссовки (Обувь) 0..15").or(eq("Ботинки (Обувь) -5..10"))
  end
end