config = {
  :url  => "http://127.0.0.1/zabbix/api_jsonrpc.php", 
  :ua   => "mruby-zabbix",
  :user => "api-admin",
  :pass => "api-admin",
}

z = Zabbix::Client.new(config)

data = {
  :method => "get",
  :object => "host",
  :params => {
               :output => "extend",
               :filter => {
                            :host    =>  "example.com",
                          },
             },
}

puts "request:  #{JSON::stringify(data)}"
puts "response: #{z.post(data)["body"]}"
