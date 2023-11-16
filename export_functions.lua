--  Exporta a representação em formato Dot
function exportGraphAsDotWithSubgraph(graph, path, path_algorithm, path_filename)
    -- Gera o nome do arquivo com extenção correta
    local filename = path_filename .. ".dot"

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
end

function generateSVGFromDotFile(path_algorithm)
    -- Gera o nome do arquivo com extenção correta
    local dotFileName = path_algorithm .. ".dot"
    local outputFileName = path_algorithm .. ".svg"
    
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

function generateCSV(data)
    -- Nome do arquivo CSV
    local currentDate = os.date("%Y-%m-%d")
    local currentTime = os.date("%H-%M-%S")
    local filename = "execution_data_" .. currentDate .. "_" .. currentTime .. ".csv"
    -- Abre o arquivo para escrita
    local file = io.open(filename, "w")
    if file then
    -- Cabeçalho do CSV
    file:write("execution,dijkstra_time,aStarEuclidean_time,aStarManhattan_time,dijkstra_weight,aStarEuclidean_weight,aStarManhattan_weight,dijkstra_edges,aStarEuclidean_edges,aStarManhattan_edges,dijkstra_file,aStarEuclidean_file,aStarManhattan_file")
    -- Adicionar quebra de linha
    file:write("\n")
    -- Escreve os dados das execuções no arquivo
    for i, execution in ipairs(data) do
        -- Escreve a linha no arquivo
      file:write(
        -- Monta a linha no formato CSV
        execution.executionCount .. "," ..
        execution.dijkstra.time .. "," ..
        execution.aStarEuclidean.time .. "," ..
        execution.aStarManhattan.time .. "," ..
        execution.dijkstra.weight .. "," ..
        execution.aStarEuclidean.weight .. "," ..
        execution.aStarManhattan.weight .. "," ..
        execution.dijkstra.edges .. "," ..
        execution.aStarEuclidean.edges .. "," ..
        execution.aStarManhattan.edges .. "," ..
        execution.dijkstra.file .. "," ..
        execution.aStarEuclidean.file .. "," ..
        execution.aStarManhattan.file .. "\n"
      )
    end
    -- Fecha o arquivo
    file:close()
    print("Arquivo CSV gerado com sucesso: " .. filename)
    else
        print("Erro ao abrir o arquivo para escrita.")
    end
  end
  