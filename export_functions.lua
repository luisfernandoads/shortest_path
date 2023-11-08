--  Exporta a representação em formato Dot
function exportGraphAsDotWithSubgraph(graph, path, path_algorithm)
    -- Obtém a data e hora local
    local currentDate = os.date("%Y-%m-%d")
    local currentTime = os.date("%H-%M-%S")

    -- Gera o nome do arquivo com a data e hora local
    local filename = "graph_".. path_algorithm .. "_" .. currentDate .. "_" .. currentTime .. ".dot"

    -- Inicializa o conteúdo do arquivo Dot com o cabeçalho
    local dotContent = "digraph G {\n"
    -- metadados do grafo
    dotContent = dotContent .. "graph [\n"
    dotContent = dotContent .. "layout = neato\n"
    dotContent = dotContent .. "label = \"" .. path_algorithm:upper() .. "\"\n"
    dotContent = dotContent .. "fontsize= \"40pt\"\n"
    dotContent = dotContent .. "]\n"

    -- Percorre todos os nós e arestas no grafo
    -- pairsByKeys para ordenar antes era pairs
    for node, edges in pairsByKeys(graph) do
        -- Adiciona o nó ao conteúdo Dot
        -- Converta o valor do nó para um número inteiro usando a função math.floor
        node = math.floor(node)
        dotContent = dotContent .. "  " .. node .. ";\n"

        -- Percorre as arestas deste nó e adiciona ao conteúdo Dot
        -- pairsByKeys para ordenar antes era pairs
        for neighbor, weight in pairsByKeys(edges) do
            -- Converta o valor do nó para um número inteiro usando a função math.floor
            node = math.floor(node)
            dotContent = dotContent .. "  " .. node .. " -> " .. neighbor .. " [label=\"" .. weight .. "\"];\n"
        end
    end

    -- Create a subgraph for the path
    dotContent = dotContent .. "  subgraph path {\n"
    dotContent = dotContent .. "    rank = same;\n"

    for _, node in ipairs(path) do
        -- Converta o valor do nó para um número inteiro usando a função math.floor
        node = math.floor(node)
        dotContent = dotContent .. "    " .. node .. " [style=filled, fillcolor=yellow];\n"
    end

    for i = 1, #path - 1 do
        -- Converta o valor do nó path[] para um número inteiro usando a função math.floor
        dotContent = dotContent .. "    " .. math.floor(path[i]) .. " -> " .. math.floor(path[i + 1]) .. " [color=red];\n"
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
    return filename
end

function generateSVGFromDotFile(dotFileName)
    -- Gere o nome do arquivo de saída substituindo ".dot" por ".svg"
    local outputFileName = string.gsub(dotFileName, "%.dot$", ".svg")
    
    -- Crie o comando para gerar o arquivo SVG a partir do arquivo DOT
    local command = string.format("dot -Tsvg %s > %s", dotFileName, outputFileName)
    
    -- Execute o comando e obtenha o código de saída
    local exitCode = os.execute(command)

    -- Verifique se a exportação foi bem-sucedida
    if exitCode then
        print("Exportado para svg como " .. outputFileName)
    else
        -- Se ocorrer um erro na exportação, remova o arquivo de saída (SVG)
        os.remove(outputFileName)
        
        -- Imprima mensagens de erro e instruções
        print("\n")
        print("Erro ao exportar para svg.")
        print("Verifique se o Graphviz esta instalado.")
        print("Ao instalar, adicione o Graphviz ao PATH do sistema.")
        print("Voce pode baixa-lo em: https://graphviz.org/download/")
        print("\n")
    end
end