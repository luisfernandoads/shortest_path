-- Importar módulos
require("utils_functions")
require("map_functions")
require("graph_functions")
require("pathfinding_functions")
require("position_functions")
require("print_functions")
require("export_functions")
require("mst")

-- Obter os valores dos argumentos ou usar valores padrão

-- Tamanho da matriz de adjacência que representa o tabuleiro
-- Número de linhas (arg1)
local rows = arg[1] or 8
-- Número de colunas (arg2)
local cols = arg[2] or 8
-- Parametros que define se início e final sao aleatorios (arg3)
local random_positions = arg[3] or false
-- Pesos variaveis (arg4)
local node_weigh = arg[4] or false
-- Presenca de obstaculos (arg5)
local obstacle_path = arg[5] or false
-- Configurar o número de execuções (arg6)
local executions = tonumber(arg[6]) or 4
-- Tamanho da matriz para aumento de complexidade
local matrix_size = {}
matrix_size.x = rows
matrix_size.y = cols

-- Variáveis do programa

-- Coordenadas
local start, goal = generateCoordinates(rows, cols, random_positions)
-- Contador de execuções
local count = 1
-- Tabela para armazenar os dados das execuções a serem exportados
local exportData = {}
-- Um multiplicador usado para indexar células em uma grade ou matriz
-- Calcula um índice exclusivo para cada célula em uma grade ou matriz bidimensional.
indexMultiplier = 10 ^ math.ceil(math.log10(rows * cols))

while count <= executions do
  -- Tabela para armazenar os dados das execuções
  local executionData = {}
  -- Obtém a contagem da execução atual
  executionData.executionCount = count
  -- Obtém a data e hora local
  executionData.currentDate = os.date("%Y-%m-%d")
  executionData.currentTime = os.date("%H-%M-%S")
  executionData.info = "size=" .. rows .. "x" .. cols .. ", start=[" .. start.row .. "," .. start.col .. "], goal=[" .. goal.row .. "," .. goal.col.. "]"
  executionData.option = "random=" .. random_positions .. ", weigh=" .. node_weigh .. ", obstacle=" .. obstacle_path
  -- Tabelas de cada algoritmo
  -- As tabelas devem estar dentro do loop como variaveis locais
  -- Para registrar os valores corretamente
  -- Tabela do algoritmo de Dijkstra
  local dijkstra = {}
  dijkstra.name = "dijkstra"
  dijkstra.file = generateFilename(executionData, dijkstra)
  -- Tabela do algoritmo aStar (A*) com heuristica de distancia distância de Manhattan
  local aStarManhattan = {}
  aStarManhattan.name = "astar_manhattan"
  aStarManhattan.file = generateFilename(executionData, aStarManhattan)

  -- Cria mapa
  -- Repete a criação do mapa caso os caminhos não sejam possíveis
  repeat
    -- Gere um mapa aleatório
    map = generateRandomMap(rows, cols, start, goal, node_weigh, obstacle_path)

    -- Gera um grafo ponderado
    grafo = createWeightedGraph(map)

    -- Calcula o caminho mais curto com Dijkstra e seu tempo de execução
    dijkstra.time = measureExecutionTime(function()
      dijkstra.path = pathDijkstra(grafo, start, goal)  -- Chamada à função dijkstra
    end)
    -- Quantidade de arestas no caminho com Dijkstra
    dijkstra.edges = #dijkstra.path
    -- Tamanho do caminho com Dijkstra
    dijkstra.weight = calculatePathWeight(grafo, dijkstra.path)

    -- Calcula o caminho mais curto com aStar (A*) e seu tempo de execução
    -- Com heuristica de distancia distância de Manhattan
    aStarManhattan.time = measureExecutionTime(function()
      aStarManhattan.path = pathAStar(grafo, start, goal, heuristicManhattan)  -- Chamada à função aStar
    end)
    -- Quantidade de arestas no caminho com aStar (A*)
    -- Com heuristica de distancia distância de Manhattan
    aStarManhattan.edges = #aStarManhattan.path
    -- Tamanho do caminho com Dijkstra
    -- Com heuristica de distancia distância de Manhattan
    aStarManhattan.weight = calculatePathWeight(grafo, aStarManhattan.path)
    
  until dijkstra.edges > 1 and aStarManhattan.edges > 1

  -- Adiciona o resultado dos algoritmos a tabela para armazenar os dados das execuções
  executionData.dijkstra = dijkstra
  executionData.aStarManhattan = aStarManhattan
  -- Adicione os dados da execução à tabela de dados de execuções
  table.insert(exportData, executionData)

  -- Saídas no terminal
  print("Matriz de adjacencia")
  print("Tamanho: " .. rows .. "x" .. cols)
  print("Inicio: x=" .. start.row .. ", y=" .. start.col)
  print("Final: x=" .. goal.row .. ", y=" .. goal.col)
  print("\n")
  print("Mapa")
  printMap(map)
  print("\n")
  print("Grafo ponderado")
  printGraphAsLuaTable(grafo)
  print("\n")
  -- Dijkstra
  print("Caminho com Dijkstra")
  printPathAsLuaTable(dijkstra.path)
  print("Tempo com Dijkstra " .. dijkstra.time)
  print("Arestas do caminho com Dijkstra " .. dijkstra.edges)
  print("Peso do caminho com Dijkstra " .. dijkstra.weight)
  print("\n")
  -- aStarManhattan
  print("aStarManhattan (A*) com heuristica de distância de Manhattan")
  print("Caminho com aStarManhattan (A*)")
  printPathAsLuaTable(aStarManhattan.path)
  print("Tempo com aStarManhattan (A*) " .. aStarManhattan.time)
  print("Arestas do caminho com aStarManhattan (A*) " .. aStarManhattan.edges)
  print("Peso do caminho com aStarManhattan (A*) " .. aStarManhattan.weight)
  print("\n")
  -- Exportando
  print("Exportando grafos")
  exportGraphAsDotWithSubgraph(grafo, dijkstra.path, dijkstra.name, dijkstra.file)
  exportGraphAsDotWithSubgraph(grafo, aStarManhattan.path, aStarManhattan.name, aStarManhattan.file)
  print("\n")
  print("Convertendo dot para svg com Graphviz")
  generateSVGFromDotFile(dijkstra.file)
  generateSVGFromDotFile(aStarManhattan.file)

  -- Contador de execuções
  count = count + 1
  -- Aumentar  complexidade
  rows = rows + matrix_size.x
  cols = cols + matrix_size.y
  -- Gerar novas coordenada
  start, goal = generateCoordinates(rows, cols, random_positions)
end

-- Chame a função para gerar o arquivo CSV
generateCSV(exportData)
