# Zabbix 2.0 API client for mruby

require mruby-httprequest mruby-json

## install by mrbgems
```bash
git clone git://github.com/matsumoto-r/mruby-zabbix.git
cp -pr mruby-zabbix ${MRUBY_ROOT}/mrbgems/g/.
echo mruby-zabbix >> ${MRUBY_ROOT}/mrbgems/GEMS.active
cd ${MRUBY_ROOT}
make
./bin/mruby ${MRUBY_ROOT}/mrbgems/g/mruby-zabbix/example/zabbix-api-cient.rb
```

## example

```ruby
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
```

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


