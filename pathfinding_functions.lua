-- Função para calcular o caminho mais curto com o algoritmo de Dijkstra
function pathDijkstra(graph, start, goal)
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

-- Função para calcular o caminho mais curto com o algoritmo aStar (A*)
-- A heuristica utilizada deve ser passada como argumento
function pathAStar(graph, start, goal, heuristicFunction)
    local visited = {}    -- Tabela para rastrear nós visitados
    local distance = {}   -- Tabela para armazenar distâncias
    local previous = {}   -- Tabela para rastrear predecessores
    local heuristic = {}  -- Tabela para armazenar valores heurísticos

    for node, _ in pairs(graph) do
        distance[node] = math.huge    -- Inicializa todas as distâncias como infinito
        previous[node] = nil          -- Inicializa todos os predecessores como nulos
        heuristic[node] = heuristicFunction(node, goal)  -- Calcula a heurística para o nó
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

-- Função que calcula a heurística entre um nó e o objetivo utilizando distância Euclidiana
function heuristicEuclidean(node, goal)
    -- Obtém a linha e a coluna do nó
    local nodeRow = math.floor(node / indexMultiplier)  -- Obtém a linha do nó na matriz
    local nodeCol = node % indexMultiplier  -- Obtém a coluna do nó na matriz
    local goalRow = goal.row  -- Obtém a linha do objetivo
    local goalCol = goal.col  -- Obtém a coluna do objetivo

    -- Calcula a distância Euclidiana entre os nós (heurística)
    local heuristicValue = math.sqrt((goalRow - nodeRow)^2 + (goalCol - nodeCol)^2)

    return heuristicValue  -- Retorna o valor heurístico calculado
end

-- Função que calcula a heurística entre um nó e o objetivo utilizando distância de Manhattan
function heuristicManhattan(node, goal)
    -- Obtém a linha e a coluna do nó
    local nodeRow = math.floor(node / indexMultiplier)  -- Obtém a linha do nó na matriz
    local nodeCol = node % indexMultiplier  -- Obtém a coluna do nó na matriz
    local goalRow = goal.row  -- Obtém a linha do objetivo
    local goalCol = goal.col  -- Obtém a coluna do objetivo

    -- Calcula a distância de Manhattan entre os nós (heurística)
    local heuristicValue = math.abs(goalRow - nodeRow) + math.abs(goalCol - nodeCol)

    return heuristicValue  -- Retorna o valor heurístico calculado
end
