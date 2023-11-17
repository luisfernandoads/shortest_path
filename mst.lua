-- Função para calcular a distância entre dois pontos (posições) no mapa
function distance(pos1, pos2)
    return math.abs(pos1[1] - pos2[1]) + math.abs(pos1[2] - pos2[2])
end

-- Função para encontrar o conjunto ao qual um elemento pertence
function find(parent, i)
    if parent[i] == i then
        return i
    end
    return find(parent, parent[i])
end

-- Função para unir dois conjuntos
function union(parent, rank, x, y)
    local xroot = find(parent, x)
    local yroot = find(parent, y)

    if rank[xroot] < rank[yroot] then
        parent[xroot] = yroot
    elseif rank[xroot] > rank[yroot] then
        parent[yroot] = xroot
    else
        parent[yroot] = xroot
        rank[xroot] = rank[xroot] + 1
    end
end

-- Função MST que recebe um conjunto de posições e cria uma Minimum Spanning Tree entre elas
function minimumSpanningTree(map, positions)
    local edges = {}

    -- Criar uma lista de arestas com pesos entre todas as posições
    for i = 1, #positions do
        for j = i + 1, #positions do
            local dist = distance(positions[i], positions[j])
            table.insert(edges, {dist = dist, src = i, dest = j})
        end
    end

    -- Ordenar as arestas por peso
    table.sort(edges, function(a, b) return a.dist < b.dist end)

    local parent = {}
    local rank = {}

    -- Inicializar os conjuntos
    for i = 1, #positions do
        parent[i] = i
        rank[i] = 0
    end

    local mstEdges = {}

    -- Construir a MST usando o algoritmo de Kruskal
    for _, edge in ipairs(edges) do
        local x = find(parent, edge.src)
        local y = find(parent, edge.dest)

        if x ~= y then
            table.insert(mstEdges, edge)
            union(parent, rank, x, y)
        end
    end

    return mstEdges
end

-- Exemplo de utilização
local mapa = {
    { 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 1, 1, 1, 4, 1, 1, 1 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 0, 1, 1 },
    { 1, 0, 1, 0, 0, 0, 1, 0 },
    { 1, 0, 1, 9, 1, 0, 1, 1 },
    { 1, 0, 0, 0, 1, 1, 9, 4 },
    { 9, 1, 1, 1, 1, 1, 1, 1 },
}

local positions = {
    {1, 1},
    {2, 5},
    {3, 7},
    {4, 3},
    {6, 4},
    {7, 7},
    {8, 1}
}

local mst = minimumSpanningTree(mapa, positions)

-- Imprimir as arestas da MST
print("Minimum Spanning Tree:")
for _, edge in ipairs(mst) do
    print(edge.src, edge.dest, edge.dist)
end
