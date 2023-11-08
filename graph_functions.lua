function createWeightedGraph(mapa)
    local graph = {}
    
    local function isValidCell(row, col)
        return mapa[row] and mapa[row][col] and mapa[row][col] > 0
    end
    
    -- Defina as direções possíveis: acima, abaixo, esquerda e direita
    local directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}}
    
    for row = 1, #mapa do
        for col = 1, #mapa[1] do
            if isValidCell(row, col) then
                local node = row * indexMultiplier + col  -- Usando uma notação única para cada célula
                graph[node] = {}
                
                for _, dir in pairs(directions) do
                    local newRow, newCol = row + dir[1], col + dir[2]
                    if isValidCell(newRow, newCol) then
                        local neighbor = newRow * indexMultiplier + newCol
                        -- Use o valor da célula como peso da aresta
                        local weight = mapa[newRow][newCol]
                        graph[node][neighbor] = weight
                    end
                end
            end
        end
    end

    return graph
end