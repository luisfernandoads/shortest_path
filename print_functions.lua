-- Função para imprimir a matriz do mapa
function printMap(map)
    -- Itera sobre as linhas da matriz do mapa
    for i = 1, #map do
        local row = map[i]  -- Obtém a linha atual da matriz
        local rowStr = ""   -- Inicializa uma string para a linha

        -- Itera sobre as colunas da linha atual
        for j = 1, #row do
            rowStr = rowStr .. row[j] .. " "  -- Adiciona o valor da célula seguido de um espaço à string
        end

        -- Imprime a string representando a linha da matriz
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

--  Salva a representação em formato Dot
function saveGraphAsDotWithSubgraph(graph, path, path_algorithm)
    -- Obtém a data e hora local
    local currentDate = os.date("%Y-%m-%d")
    local currentTime = os.date("%H-%M-%S-")

    -- Gera o nome do arquivo com a data e hora local
    local filename = "graph_".. path_algorithm .. "_" .. currentDate .. "_" .. currentTime .. ".dot"

    -- Inicializa o conteúdo do arquivo Dot com o cabeçalho
    local dotContent = "digraph G {\n graph [layout = neato]\n"

    -- Percorre todos os nós e arestas no grafo
    -- pairsByKeys para ordenar antes era pairs
    for node, edges in pairsByKeys(graph) do
        -- Adiciona o nó ao conteúdo Dot
        dotContent = dotContent .. "  " .. node .. ";\n"

        -- Percorre as arestas deste nó e adiciona ao conteúdo Dot
        -- pairsByKeys para ordenar antes era pairs
        for neighbor, weight in pairsByKeys(edges) do
            dotContent = dotContent .. "  " .. node .. " -> " .. neighbor .. " [label=\"" .. weight .. "\"];\n"
        end
    end

    -- Create a subgraph for the path
    dotContent = dotContent .. "  subgraph path {\n"
    dotContent = dotContent .. "    rank = same;\n"

    for _, node in ipairs(path) do
        dotContent = dotContent .. "    " .. node .. " [style=filled, fillcolor=yellow];\n"
    end

    for i = 1, #path - 1 do
        dotContent = dotContent .. "    " .. path[i] .. " -> " .. path[i + 1] .. " [color=red];\n"
    end

    dotContent = dotContent .. "  }\n"

    -- Finaliza o conteúdo Dot
    dotContent = dotContent .. "}"

    -- Salva o conteúdo Dot em um arquivo local com o nome gerado
    local file = io.open(filename, "w")  -- Abre o arquivo no modo de escrita
    if file then
        file:write(dotContent)  -- Escreve o conteúdo no arquivo
        file:close()  -- Fecha o arquivo
        -- Exibe uma mensagem indicando o nome do arquivo ao qual o grafo foi exportado
        print("Grafo exportado como " .. filename)
    else
        print("Erro ao abrir o arquivo para escrita.")
    end
end