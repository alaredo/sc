require ( "util")

local http = require("socket.http")
local ltn12 = require("ltn12")
local _webaddress, _token, _urlLogoff
local _ = {}


--Efetua o Login e Retorna:
--0 : Login não efetuado
--1 : Login Efetuado com Sucesso
function _.tryLogin(webaddress, urlLogin, urlLogoff)
    _webaddress = webaddress
    _urlLogoff = urlLogoff
    _token = ""
    _token = _.get(urlLogin)[1]
    if (_token == nil or _token == "") then
        return 0
    else
        return 1
    end
end

--Logoff
function logoff() 
    _.get(_urlLogoff)
    _token = ""
end

function _.get(url)
    local address = _webaddress .. url
    local response = {}
    http.request{
        url = address,
        method = "GET",
        headers = {
            ["token"] = _token
        },
        sink = ltn12.sink.table(response)
    }
    return response
end

function _.put(url, content)
    local address = _webaddress .. url
    local response = {}
    http.request{
        url = address,
        method = "PUT",
        headers = {
            ["token"] = _token,
            ["content-length"] = string.len(content),
            ["content-type"] = "application/json"
        },
        source = ltn12.source.string(content),
        sink = ltn12.sink.table(response)
    }
    return response[1]
end

function _.postImage(url, path, code, name)
    local address = _webaddress .. url
    local response = {}
    local tempHandle = io.open(path, 'r')
    local content = tempHandle:read("*all")
    print(string.len(content))

    http.request{
        url = address,
        method = "POST",
        headers = {
            ["code"] = code,
            ["name"] = name,
            ["token"] = _token,
            ["content-length"] = string.len(content),
            ["content-type"] = "image/jpg"
        },
        source = ltn12.source.string(content),
        sink = ltn12.sink.table(response)
    }
    io.close(tempHandle)
    print(response[1])
    return response[1]
end

function _.getImage(url, path)

    if (_.file_exists(path)) then
        os.remove(path)
    end

    local tempHandle = io.open(path, 'w+b')
    local tempFile = ltn12.sink.file(tempHandle)
    local address = _webaddress .. url
    local finish = false
    http.request{
        url = address,
        method = "GET",
        headers = {
            ["token"] = _token,
        },
        sink = tempFile,
        create = function ()
          finish = true  
        end
    }

    while not finish do
        
    end

    local download = io.open(path)
    local data = download:read('*a')
    io.close(download)
    return data
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function _.file_exists(name)
    _.current_dir = io.popen"cd":read'*l'
    print(_.current_dir)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
end

function _.post(url, content)
    local address = _webaddress .. url
    local response = {}
    http.request{
        url = address,
        method = "POST",
        headers = {
            ["token"] = _token,
            ["content-length"] = string.len(content),
            ["content-type"] = "application/json"
        },
        source = ltn12.source.string(content),
        sink = ltn12.sink.table(response)
    }
    return response[1]
end

function _.delete(url, content)
    local address = _webaddress .. url
    local response = {}
    http.request{
        url = address,
        method = "DELETE",
        headers = {
            ["token"] = _token,
            ["content-length"] = string.len(content),
            ["content-type"] = "application/json"
        },
        source = ltn12.source.string(content),
        sink = ltn12.sink.table(response)
    }
    return response[1]
end

return _
