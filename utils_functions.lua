-- Note that, for Lua, arrays also have no order
-- https://www.lua.org/pil/19.3.html
-- decrescente funcao f (function(a, b) return a > b end)
-- pairsByKeys(graph,function(a, b) return a > b end)
function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
      i = i + 1
      if a[i] == nil then return nil
      else return a[i], t[a[i]]
      end
    end
    return iter
  end

-- Função para calcular o tempo de execução com maior precisão
function measureExecutionTime(func)
  local startTime = os.time()  -- Marca o tempo de início em segundos
  func()  -- Executa a função fornecida como argumento
  local endTime = os.time()  -- Marca o tempo de término em segundos
  local elapsedTime = endTime - startTime  -- Calcula o tempo decorrido em segundos
  local decimalPart = os.clock()  -- Obtem a parte decimal da precisão do tempo
  return elapsedTime + decimalPart  -- Retorna o tempo decorrido em segundos com a precisão decimal
end

--  Gera o nome do arquivo
function generateFilename(execution_info, table_algorithm)
  -- Gera o nome do arquivo com a data e hora local
  local filename = execution_info.executionCount .. "_graph_".. table_algorithm.name .. "_" .. execution_info.currentDate .. "_" .. execution_info.currentTime
  return filename
end