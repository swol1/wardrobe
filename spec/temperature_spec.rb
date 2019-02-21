require 'temperature'

describe Temperature do
  it 'show temperature' do
    file = File.dirname(__dir__) + '/spec/fixtures/temperature.xml'
    xml = File.read(file)
    doc = REXML::Document.new(xml)
    temperature = Temperature.temperature_from_xml(doc)

    expect(temperature).to eq 1
  end
end