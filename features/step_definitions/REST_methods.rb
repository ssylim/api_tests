def send_get(host, path)
  url = URI(host + path)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(url)
  request['Content-Type'] = 'application/json'
  @response = http.request(request)
end

def send_delete(host, path)
  url = URI(host + path)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Delete.new(url)
  request['Content-Type'] = 'application/json'
  @response = http.request(request)
end

def send_post(host, path, body)
  url = URI(host + path)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Post.new(url)
  request['Content-Type'] = 'application/json'
  request.body = body
  @response = http.request(request)
end

def send_put(host, path, body)
  url = URI(host + path)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Put.new(url)
  request['Content-Type'] = 'application/json'
  request.body = body
  @response = http.request(request)
end

def send_get_with_parameters(host, path, params)
  url = URI(host + path)
  url.query = params
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(url)
  request['Content-Type'] = 'application/json'
  @response = http.request(request)
end