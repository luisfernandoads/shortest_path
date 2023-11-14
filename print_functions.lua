-- Função para imprimir a matriz do map
function printMap(map)
    -- Itera sobre as rows da matriz do map
    for i = 1, #map do
        local row = map[i]  -- Obtém a row atual da matriz
        local rowStr = ""   -- Inicializa uma string para a row

        -- Itera sobre as cols da row atual
        for j = 1, #row do
            rowStr = rowStr .. row[j] .. " "  -- Adiciona o valor da célula seguido de um espaço à string
        end

        -- Imprime a string representando a row da matriz
        print(rowStr)
    end
end

-- Função para imprimir um grafo em notação Lua
function printGraphAsLuaTable(graph)
    local luaTable = "{\n"

    -- pairsByKeys para ordenar antes era pairs
    for node, edges in pairsByKeys(graph) do
        luaTable = luaTable .. "  [" .. node .. "] = {\n"
        -- pairsByKeys para ordenar antes era pairs
        for neighbor, weight in pairsByKeys(edges) do
            luaTable = luaTable .. "    [" .. neighbor .. "] = " .. weight .. ",\n"
        end
        luaTable = luaTable .. "  },\n"
    end

    luaTable = luaTable .. "}"

    print(luaTable)
end

-- Função para imprimir o caminho em notação Lua
function printPathAsLuaTable(path)
    local luaTable = "{"

    for i, node in ipairs(path) do
        -- Converta o valor do nó para um número inteiro usando a função math.floor
        node = math.floor(node)
        luaTable = luaTable .. node
        if i < #path then
            luaTable = luaTable .. ", "
        end
    end

    luaTable = luaTable .. "}"

    print(luaTable)
end

function calculatePathWeight(graph, path)
    local totalWeight = 0  -- Inicializa o peso total do caminho como zero

    for i = 1, #path - 1 do
        local currentNode = path[i]
        local nextNode = path[i + 1]

        -- Verifica se há uma aresta entre o nó atual e o próximo nó no caminho
        if graph[currentNode] and graph[currentNode][nextNode] then
            totalWeight = totalWeight + graph[currentNode][nextNode]  -- Adiciona o peso da aresta ao peso total
        else
            return nil  -- Se não houver uma aresta válida, retorna nil (caminho inválido)
        end
    end

    return totalWeight  -- Retorna o peso total do caminho
end

