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

-- Função para medir o tempo de execução de uma função passada como argumento
function measureExecutionTime(func)
  local startTime = os.clock() -- Marca o tempo inicial
  func() -- Executa a função passada como argumento
  local endTime = os.clock() -- Marca o tempo final após a execução da função
  local elapsedTime = endTime - startTime -- Retorna a diferença entre os tempos para obter o tempo de execução
  return elapsedTime
end


--  Gera o nome do arquivo
function generateFilename(execution_info, table_algorithm)
  -- Gera o nome do arquivo com a data e hora local
  local filename = execution_info.executionCount .. "_graph_".. table_algorithm.name .. "_" .. execution_info.currentDate .. "_" .. execution_info.currentTime
  return filename
end