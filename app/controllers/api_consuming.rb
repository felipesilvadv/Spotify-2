require 'open-uri'
def api_consult(url, params={}, json=true)
  puts url
  uri = URI.parse(url)
  req = Net::HTTP::Get.new(uri.to_s, params)
  res = Net::HTTP.start(uri.host, uri.port) {|http|
    http.request(req)
  }
  if json
    JSON.parse(res.body)
  else
    res.body
  end
end

def api_consum(url)
  open(url).read
end