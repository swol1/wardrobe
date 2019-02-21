require 'net/http'
require 'rexml/document'

module Temperature
  def self.xml_from_net(url)
    response = Net::HTTP.get_response(URI.parse(url))
    doc = REXML::Document.new(response.body)

    self.temperature_from_xml(doc)
  end

  def self.temperature_from_xml(doc)
    doc.root.elements['REPORT/TOWN/FORECAST/TEMPERATURE'].attributes['min'].to_i
  end
end
