function generateRandomMap(rows, cols, start, goal)
    math.randomseed(os.time()) -- Inicialize a semente de números aleatórios com o tempo atual

    local map = {}

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
            map[r] = {}  -- Inicialize a row se necessário
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
                    map[row] = {}  -- Inicialize a row se necessário
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

    -- Inicialize o map com valores aleatórios
    for r = 1, rows do
        map[r] = {}
        for c = 1, cols do
            local value
            -- Gere obstáculos aleatórios com base na probabilidade
            if math.random() < 0.2 then
                value = 0
            else
                repeat
                    value = math.random(9)
                until isValid(value, r, c)
            end
            map[r][c] = value
        end
    end

    return map
end