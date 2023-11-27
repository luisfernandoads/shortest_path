-- Função para gerar as coordenadas fixas no inicio e final do mapa
function fixedCoordinates(rows, cols)
    -- Coordenadas de início e final, representadas como pares de valores (linha, coluna)
    -- Coordenada x de início
    local row_start = 1
    -- Coordenada y de início
    local col_start = 1
    local start = {row = row_start, col = col_start}  -- Por exemplo, início na coordenada (1, 1)
    -- Coordenada x do final
    local row_goal = rows
    -- Coordenada y do final
    local col_goal = cols
    local goal = {row = row_goal, col = col_goal}  -- Por exemplo, meta na coordenada (8, 8)
    return start, goal
end

-- Função para gerar coordenadas aleatórias de início e final
function randomCoordinates(rows, cols)
    math.randomseed(os.time()) -- Inicializa a semente de números aleatórios com o tempo atual

    -- Coordenadas de início e final, representadas como pares de valores (linha, coluna)
    local start = {}  -- Variável para armazenar as coordenadas de início
    local goal = {}   -- Variável para armazenar as coordenadas de fim

    -- Coordenada x de início
    local row_start = math.random(rows)
    -- Coordenada y de início
    local col_start = math.random(cols)
    start = {row = row_start, col = col_start}  -- Define as coordenadas de início

    repeat
        -- Coordenada x do final
        local row_goal = math.random(rows)
        -- Coordenada y do final
        local col_goal = math.random(cols)
        goal = {row = row_goal, col = col_goal}  -- Define as coordenadas de fim

        -- Compara se as coordenadas de início e fim são iguais
        local same_coordinates = compareTables(start, goal)
    until not same_coordinates  -- Repete até as coordenadas de início e fim serem diferentes

    return start, goal  -- Retorna as coordenadas de início e fim
end

-- Função para gerar coordenadas de acordo com o escolhido
function generateCoordinates(rows, cols, type)
    local start, goal
    -- define o tipo de coordenadas usadas (fixas ou aleatorias)
    if type == "true" then
        start, goal = randomCoordinates(rows, cols)
    else
        start, goal = fixedCoordinates(rows, cols)
    end
    return start, goal
end
