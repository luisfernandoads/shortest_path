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
  
-- Função para calcular o tempo de execução de uma determinada função
function measureExecutionTime(func)
  local startTime = os.clock()  -- Marca o tempo de início
  func()  -- Executa a função fornecida como argumento
  local endTime = os.clock()  -- Marca o tempo de término
  return endTime - startTime  -- Retorna a diferença entre o tempo de término e o tempo de início
end