-- Função MST que recebe um conjunto de posições e modifica o mapa com a Minimum Spanning Tree
function minimumSpanningTree(map, positions)
    math.randomseed(os.time()) -- Inicializa a semente de números aleatórios com o tempo atual
    local edges = {}

    -- Função para calcular a distância entre dois pontos (posições) no mapa considerando direções ortogonais
    local function distance(pos1, pos2)
        return math.abs(pos1[1] - pos2[1]) + math.abs(pos1[2] - pos2[2])
    end

    -- Função para encontrar o conjunto ao qual um elemento pertence
    local function find(parent, i)
        if parent[i] == i then
            return i
        end
        return find(parent, parent[i])
    end

    -- Função para unir dois conjuntos
    local function union(parent, rank, x, y)
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

    -- Criar uma lista de arestas com pesos entre todas as posições
    for i = 1, #positions do
        for j = i + 1, #positions do
            local dist = distance(positions[i], positions[j])
            table.insert(edges, { dist = dist, src = i, dest = j })
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

    -- Construir a MST usando o algoritmo de Kruskal e marcar as arestas no mapa
    for _, edge in ipairs(edges) do
        local x = find(parent, edge.src)
        local y = find(parent, edge.dest)

        if x ~= y then
            local srcPos = positions[edge.src]
            local destPos = positions[edge.dest]

            -- Marcar a aresta no mapa (apenas nas direções ortogonais)
            while srcPos[1] ~= destPos[1] or srcPos[2] ~= destPos[2] do
                if srcPos[1] ~= destPos[1] then
                    if srcPos[1] < destPos[1] then
                        srcPos[1] = srcPos[1] + 1
                    else
                        srcPos[1] = srcPos[1] - 1
                    end
                elseif srcPos[2] ~= destPos[2] then
                    if srcPos[2] < destPos[2] then
                        srcPos[2] = srcPos[2] + 1
                    else
                        srcPos[2] = srcPos[2] - 1
                    end
                end
                map[srcPos[1]][srcPos[2]] = math.random(9) -- Valor para marcar a Minimum Spanning Tree no mapa
            end


            union(parent, rank, x, y)
        end
    end

    return map
end

-- Exemplo de utilização
local mapa = {
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
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

local mapWithMST = minimumSpanningTree(mapa, positions)

-- Função para imprimir o mapa
local function printMap(map)
    for i = 1, #map do
        for j = 1, #map[i] do
            io.write(map[i][j] .. " ")
        end
        io.write("\n")
    end
end

-- Imprimir o mapa com a Minimum Spanning Tree
print("Mapa com Minimum Spanning Tree:")
printMap(mapWithMST)
