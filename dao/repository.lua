local uow = require("dao.unitOfWork")
local json = require("json")
local _ = {}

--Obter por código
function _.getByCode(objectName, code)
    local address = "api/" .. objectName .. "/" .. tostring(code);
    local result = uow.get(address)
    local single = json.decode(result[1])
    return single
end

--Obter todos
function _.getAll(objectName)
    local address = "api/" .. objectName;
    local result = uow.get(address)
    local resultItens = json.decode(result[1])
    if (resultItens == nil) then
        return {}
    else
        return resultItens
    end
end

--Obter por consulta OData
function _.query(objectName, odata)
    local address = "api/" .. objectName .. "?" .. odata
    local result = uow.get(address)
    local resultItens = json.decode(result[1])
    if (resultItens == nil) then
        return {}
    else
        return resultItens
    end
end

--Insere um novo registro na base de dados
function _.insert(objectName, data)
    local jsonString = json.encode(data)
    local address = "api/" .. objectName;
    local result = uow.post(address, jsonString)
    return json.decode(result)
end

--Faz o download da imagem na tabela indicada
function _.downloadImage(tableName, code, path)
    local address = "api/IMAGE/" .. tableName .. "-" .. tostring(code);
    local data = uow.getImage(address, path)
    return data
end

--Faz o upload da imagem na tabela indicada
function _.uploadImage(tableName, code, path)
    local address = "api/IMAGE/" .. tableName .. "-" .. tostring(code);
    uow.postImage(address, path, code, tableName)
end

--Atualiza a entidade indicada
function _.update(objectName, data)
    local name = getModelCodeFieldName(objectName)
    local code = data[name]

    local jsonString = json.encode(data)
    local address = "api/" .. objectName .. "/" .. code

    uow.put(address, jsonString)
    return data
end

--Exclui a entidade indicada
function _.remove(objectName, data)
    local name = _.getModelCodeFieldName(objectName)
    local code = data[name]

    local jsonString = json.encode(data)
    local address = "api/" .. objectName .. "/" .. code
    uow.delete(address, jsonString)
    return data
end

--Obtem o código da coluna de identidade da tabela
local function getModelCodeFieldName(tableName)
    if (tableName == "AE_ALUNO") then return "ALU_CODIGO"
    elseif (tableName == "AE_ESCOLA") then return "ESC_CODIGO"
    elseif (tableName == "AE_GALERIA") then return "GAL_CODIGO"
    elseif (tableName == "AE_NIVEL_ENSINO") then return "NIE_CODIGO"
    elseif (tableName == "AE_PERIODO_LETIVO") then return "PER_CODIGO"
    elseif (tableName == "AE_PROFESSOR") then return "PRO_CODIGO"
    elseif (tableName == "AE_RESPONSAVEL") then return "RES_CODIGO"
    elseif (tableName == "AE_SUBNIVEL_ENSINO") then return "SNE_CODIGO"
    elseif (tableName == "AE_TURMA_ALUNO") then return "TUA_CODIGO"
    elseif (tableName == "AE_TURMA") then return "TUR_CODIGO"
    elseif (tableName == "AE_TURNO") then return "TNO_CODIGO"
    elseif (tableName == "AE_USUARIO") then return "USU_CODIGO"
    else return nil
    end
end

return _
