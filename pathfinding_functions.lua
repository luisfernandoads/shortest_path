-- Função para calcular o caminho mais curto com o algoritmo de Dijkstra
function dijkstra(graph, start, goal)
    local visited = {}  -- Tabela para rastrear nós visitados
    local distance = {}  -- Tabela para armazenar distâncias
    local previous = {}  -- Tabela para rastrear predecessores

    for node, _ in pairs(graph) do
        distance[node] = math.huge  -- Inicializa todas as distâncias como infinito
        previous[node] = nil  -- Inicializa todos os predecessores como nulos
    end

    local startNode = start.row * indexMultiplier + start.col
    local goalNode = goal.row * indexMultiplier + goal.col

    distance[startNode] = 0  -- Define a distância do nó de início como zero

    while not visited[goalNode] do
        local minDistance = math.huge  -- Inicializa a distância mínima como infinito
        local currentNode

        for node, dist in pairs(distance) do
            if not visited[node] and dist < minDistance then
                minDistance = dist  -- Atualiza a distância mínima
                currentNode = node  -- Define o nó atual
            end
        end

        if currentNode == nil then
            break  -- Sai do loop se não houver mais nós a visitar
        end

        visited[currentNode] = true  -- Marca o nó atual como visitado

        for neighbor, weight in pairs(graph[currentNode] or {}) do
            local alt = distance[currentNode] + weight
            if alt < (distance[neighbor] or math.huge) then
                distance[neighbor] = alt  -- Atualiza a distância se uma rota mais curta for encontrada
                previous[neighbor] = currentNode  -- Atualiza o predecessor do nó vizinho
            end
        end
    end

    local path = {}  -- Tabela para armazenar o caminho encontrado
    local currentNode = goalNode  -- Começa a partir do nó de destino

    while currentNode do
        table.insert(path, 1, currentNode)  -- Insere o nó atual no início do caminho
        currentNode = previous[currentNode]  -- Move-se para o nó predecessor
    end

    if #path == 1 and path[1] ~= goalNode then
        return nil  -- Nenhum caminho encontrado (apenas o nó de destino)
    end

    return path  -- Retorna o caminho encontrado
end

-- Função para busca em profundidade (DFS)
function depthFirstSearch(graph, start, goal)
    local startNode = start.row * indexMultiplier + start.col
    local goalNode = goal.row * indexMultiplier + goal.col

    local visited = {}  -- Tabela para rastrear nós visitados
    local path = {}  -- Tabela para armazenar o caminho

    local function dfs(node)
        visited[node] = true  -- Marca o nó atual como visitado
        table.insert(path, node)  -- Adiciona o nó atual ao caminho

        if node == goalNode then
            return true  -- Retorna verdadeiro se o nó de destino for alcançado
        end

        -- pairsByKeys para ordenar antes era pairs
        for neighbor, _ in pairsByKeys(graph[node] or {}) do
            if not visited[neighbor] and dfs(neighbor) then
                return true  -- Retorna verdadeiro se o caminho for encontrado
            end
        end

        table.remove(path)  -- Remove o nó atual do caminho
        return false
    end

    if dfs(startNode) then
        return path  -- Retorna o caminho encontrado
    else
        return nil  -- Nenhum caminho encontrado
    end
end

function aStar(graph, start, goal)
    local visited = {}    -- Tabela para rastrear nós visitados
    local distance = {}   -- Tabela para armazenar distâncias
    local previous = {}   -- Tabela para rastrear predecessores
    local heuristic = {}  -- Tabela para armazenar valores heurísticos

    for node, _ in pairs(graph) do
        distance[node] = math.huge    -- Inicializa todas as distâncias como infinito
        previous[node] = nil          -- Inicializa todos os predecessores como nulos
        heuristic[node] = calculateHeuristic(node, goal)  -- Calcula a heurística para o nó
    end

    local startNode = start.row * indexMultiplier + start.col
    local goalNode = goal.row * indexMultiplier + goal.col

    distance[startNode] = 0  -- Define a distância do nó de início como zero

    while not visited[goalNode] do
        local minDistance = math.huge  -- Inicializa a distância mínima como infinito
        local currentNode

        for node, dist in pairs(distance) do
            if not visited[node] and (dist + (heuristic[node] or 0)) < minDistance then
                minDistance = dist + (heuristic[node] or 0)  -- Calcula a heurística combinada com o custo
                currentNode = node  -- Define o nó atual
            end
        end

        if currentNode == nil then
            break  -- Sai do loop se não houver mais nós a visitar
        end

        visited[currentNode] = true  -- Marca o nó atual como visitado

        for neighbor, weight in pairs(graph[currentNode] or {}) do
            local alt = distance[currentNode] + weight
            if alt < (distance[neighbor] or math.huge) then
                distance[neighbor] = alt  -- Atualiza a distância se uma rota mais curta for encontrada
                previous[neighbor] = currentNode  -- Atualiza o predecessor do nó vizinho
            end
        end
    end

    local path = {}  -- Tabela para armazenar o caminho encontrado
    local currentNode = goalNode  -- Começa a partir do nó de destino

    while currentNode do
        table.insert(path, 1, currentNode)  -- Insere o nó atual no início do caminho
        currentNode = previous[currentNode]  -- Move-se para o nó predecessor
    end

    if #path == 1 and path[1] ~= goalNode then
        return nil  -- Nenhum caminho encontrado (apenas o nó de destino)
    end

    return path  -- Retorna o caminho encontrado
end

function calculateHeuristic(node, goal)
    -- Implemente aqui a sua função heurística compatível com o grafo ponderado
    -- A heurística deve estimar o custo restante do nó atual até o nó de destino
    -- Ela pode ser baseada em distâncias, geometria do grafo ou outras informações relevantes
    -- Para este exemplo, suponha uma função heurística simples que retorna uma estimativa baseada na distância euclidiana entre os nós
    local nodeRow = math.floor(node / indexMultiplier)
    local nodeCol = node % indexMultiplier
    local goalRow = goal.row
    local goalCol = goal.col

    local heuristicValue = math.sqrt((goalRow - nodeRow)^2 + (goalCol - nodeCol)^2)  -- Distância euclidiana entre os nós

    return heuristicValue
end
