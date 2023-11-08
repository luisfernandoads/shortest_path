-- Função para calcular o caminho mais curto com o algoritmo de Dijkstra
function dijkstra(graph, start, goal)
    local visited = {}
    local distance = {}
    local previous = {}

    for node, _ in pairs(graph) do
        distance[node] = math.huge
        previous[node] = nil
    end

    local startNode = start.linha * indexMultiplier + start.coluna
    local goalNode = goal.linha * indexMultiplier + goal.coluna

    distance[startNode] = 0

    while not visited[goalNode] do
        local minDistance = math.huge
        local currentNode

        for node, dist in pairs(distance) do
            if not visited[node] and dist < minDistance then
                minDistance = dist
                currentNode = node
            end
        end

        if currentNode == nil then
            break
        end

        visited[currentNode] = true

        for neighbor, weight in pairs(graph[currentNode] or {}) do
            local alt = distance[currentNode] + weight
            if alt < (distance[neighbor] or math.huge) then
                distance[neighbor] = alt
                previous[neighbor] = currentNode
            end
        end
    end

    local path = {}
    local currentNode = goalNode

    while currentNode do
        table.insert(path, 1, currentNode)
        currentNode = previous[currentNode]
    end

    if #path == 1 and path[1] ~= goalNode then
        return nil  -- Nenhum caminho encontrado
    end

    return path
end

-- Função para busca em profundidade (DFS)
function depthFirstSearch(graph, start, goal)
    local startNode = start.linha * indexMultiplier + start.coluna
    local goalNode = goal.linha * indexMultiplier + goal.coluna

    local visited = {}
    local path = {}
    
    local function dfs(node)
        visited[node] = true
        table.insert(path, node)
        
        if node == goalNode then
            return true
        end
        
        -- pairsByKeys para ordenar antes era pairs
        for neighbor, _ in pairsByKeys(graph[node] or {}) do
            if not visited[neighbor] and dfs(neighbor) then
                return true
            end
        end
        
        table.remove(path)
        return false
    end
    
    if dfs(startNode) then
        return path
    else
        return nil
    end
end