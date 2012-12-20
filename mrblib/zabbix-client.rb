class Zabbix
  class Client
    def initialize(config)
      @url  = config[:url]
      @user = config[:user]
      @pass = config[:pass]
      @ua   = config[:ua]
      @cid  = 1
      @auth_toke = nil
      @request = {
        'Content-Type'   => "application/json-rpc",
        'User-Agent'     => @ua,
      }
    end
    def get_id
      @cid
    end
    def get_auth_token
      @auth_token
    end
    def get_request
      @request
    end
    def post(data)
      auth
      method = data[:object] + "." + data[:method] 
      req_json = {
        :jsonrpc => "2.0",
        :method  => method,
        :params  => data[:params],
        :auth    => @auth_token,
        :id      => self.next_id,
      }
      http = HttpRequest.new()
      http.get(@url, JSON::stringify(req_json), @request)
    end
    def auth
      auth_data = {
        :auth        =>  nil,
        :jsonrpc     =>  "2.0",
        :method      =>  "user.login",
        :params      =>  {   
                            :user        => @user,
                            :password    => @pass,
                        },
        :id          =>  1,
      }
      http = HttpRequest.new()
      response = http.get(@url, JSON::stringify(auth_data), @request)
      @auth_token = JSON::parse(response["body"])["result"]
    end
    def next_id
      @cid += 1
    end
  end
end
