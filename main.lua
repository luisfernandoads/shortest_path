-- Importar módulos
require("utils_functions")
require("map_functions")
require("graph_functions")
require("pathfinding_functions")
require("print_functions")
require("export_functions")
require("mst")

-- Obter os valores dos argumentos ou usar valores padrão

-- Tamanho da matriz de adjacência que representa o tabuleiro
-- Número de linhas (arg1)
local rows = arg[1] or 8
-- Número de colunas (arg2)
local cols = arg[2] or 8

-- Coordenadas de início e final, representadas como pares de valores (linha, coluna)
-- Coordenada x de início (arg3)
local row_start = arg[3] or 1
-- Coordenada y de início (arg4)
local col_start = arg[4] or 1
local start = {row = row_start, col = col_start}  -- Por exemplo, início na coordenada (1, 1)
-- Coordenada x do final (arg5)
local row_goal = arg[5] or rows
-- Coordenada y do final (arg6)
local col_goal = arg[6] or cols
local goal = {row = row_goal, col = col_goal}  -- Por exemplo, meta na coordenada (8, 8)
-- Configurar o número de execuções
local executions = tonumber(arg[7]) or 1
-- Configurar o modo silencioso (arg8)
local silent = arg[8] or false

-- Variáveis do programa
-- Valor dos obstáculos
obstacle = 0
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
    map = generateRandomMap(rows, cols, start, goal)
    -- Modifica o mapa aleatório com com a Minimum Spanning Tree
    local positions = {
      {start.row, start.col},
      {2, 5},
      {3, 7},
      {4, 3},
      {6, 4},
      {7, 7},
      {goal.row, goal.col}
  }
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
    map = minimumSpanningTree(map, mapa)
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

  -- Modo silencioso, executa saidas somente se silent for false
  if not silent then
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
  end
    -- Contador de execuções
    count = count + 1
end

-- Chame a função para gerar o arquivo CSV
generateCSV(exportData)
