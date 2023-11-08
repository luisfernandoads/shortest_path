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