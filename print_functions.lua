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

--  Recebe um grafo como entrada e imprime sua representação em formato Dot, adequada para uso com o Graphviz
function printGraphAsDot(graph)
    print("digraph G {")
    
    -- Itera sobre os nós e suas arestas no grafo
    -- pairsByKeys para ordenar antes era pairs
    for node, edges in pairsByKeys(graph) do
        -- Itera sobre as arestas do nó e seus pesos
        -- pairsByKeys para ordenar antes era pairs
        for neighbor, weight in pairsByKeys(edges) do
            -- Imprime a representação da aresta em formato Dot
            print(string.format('  %d -> %d [label="%d"];', node, neighbor, weight))
        end
    end

    print("}")
end