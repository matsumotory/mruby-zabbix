config = {
  :url  => "http://127.0.0.1/zabbix/api_jsonrpc.php", 
  :ua   => "mruby-zabbix",
  :user => "api-admin",
  :pass => "api-admin",
}

z = Zabbix::Client.new(config)

data = {
    :method  =>  "get",
    :object  =>  "host",
    :params  =>  {
                    :output    =>  "extend",
                    :filter          =>  {
                                            :host    =>  "tg.net.ist.i.kyoto-u.ac.jp",
                                         },
                },
}

p z.post(JSON::stringify(data))["body"]
