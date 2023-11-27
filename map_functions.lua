-- Função para gerar um mapa aleatório
function generateRandomMap(rows, cols, start, goal, weigh, obstacle)
    math.randomseed(os.time()) -- Inicializa a semente de números aleatórios com o tempo atual

    local map = {}  -- Inicializa o mapa vazio

    -- define o peso dos nos do mapa baseado no parametro passado
    if weigh == "true" then
        node_weigh = 9
    else
        node_weigh = 1
    end

    -- define a quantidade de obstaculos no mapa baseado no parametro passado
    if obstacle == "true" then
        obstacle_rate = 0.2
    else
        obstacle_rate = 0
    end

    -- Função para verificar se um valor é válido
    local function isValid(value, r, c)
        -- Verifique se o valor é maior que 0
        if value == 0 then
            return false
        end

        -- Verifique se o valor não bloqueia o caminho do início ao destino
        if (r == start.row and c == start.col) or (r == goal.row and c == goal.col) then
            return true
        end

        -- Verifique se o valor não é um obstáculo para o caminho
        if not map[r] then
            map[r] = {}  -- Inicialize a linha se necessário
        end

        if r == start.row then
            local step = c < start.col and 1 or -1
            for col = start.col, c, step do
                if not map[r][col] then
                    map[r][col] = 1  -- Valor padrão, se não estiver inicializado
                end
                if map[r][col] == 0 then
                    return false
                end
            end
        elseif c == start.col then
            local step = r < start.row and 1 or -1
            for row = start.row, r, step do
                if not map[row] then
                    map[row] = {}  -- Inicialize a linha se necessário
                end
                if not map[row][c] then
                    map[row][c] = 1  -- Valor padrão, se não estiver inicializado
                end
                if map[row][c] == 0 then
                    return false
                end
            end
        end

        return true
    end

    -- Inicialize o mapa com valores aleatórios
    for r = 1, rows do
        map[r] = {}
        for c = 1, cols do
            local value
            -- Gere obstáculos aleatórios com base na probabilidade
            if math.random() < obstacle_rate then -- gera os obstaculos dos nos do mapa
                value = 0
            else
                repeat
                    value = math.random(node_weigh) -- gera os pesos dos nos do mapa
                until isValid(value, r, c)
            end
            map[r][c] = value
        end
    end

    return map  -- Retorna o mapa gerado aleatoriamente
end
