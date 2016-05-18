require 'net/http'
require 'json'

class Parse
  
  def self.get_url(path)
    uri = URI(path)
    req = Net::HTTP::Get.new(uri)

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end

  def self.get_json(path)
    # puts "#{SITE_URL}/#{path}"
    json_results path
  end

  def self.json_results(url)
    response = Net::HTTP.get_response(URI.parse(url))
    data = response.body
    JSON.parse(data)
  end
  
  def self.format_array(arr, indexes)
    unique = indexes.length
    formatted = []
    aux = []
    arr.each_with_index do |e, i|
      aux.push e
      if(i > 0 && i % unique == unique-1)
        # aux[-1] += "\n\n"
        formatted.push aux
        aux = []
      end
    end
    formatted
  end
  
end