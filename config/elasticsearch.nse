--[[
nmap --script ./elasticsearch.nse 192.168.0.0/24 -p 9200,80,8080

PORT     STATE SERVICE
9200/tcp open  wap-wsp
|_elasticsearch: looks like elasticsearch

--]]

local http = require "http"
local string = require "string"

portrule = function(host, port)
  return port.protocol == "tcp" and port.state == "open"
end

action = function(host, port)
  local uri = "/"
  local response = http.get(host, port, uri)
  if ( response.status == 200 ) then
    if ( string.find(response.body, "You Know, for Search") ) then
      return "looks like elasticsearch"
    end
  end
end
