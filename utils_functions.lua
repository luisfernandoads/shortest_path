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