-- Importar módulos
require("utils_functions")
require("map_functions")
require("graph_functions")
require("pathfinding_functions")
require("print_functions")
require("export_functions")

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
-- Um multiplicador usado para indexar células em uma grade ou matriz
-- Calcula um índice exclusivo para cada célula em uma grade ou matriz bidimensional.
indexMultiplier = 10 ^ math.ceil(math.log10(rows * cols))

-- Tabelas de cada algoritmo
dijkstra = {}
dijkstra.name = "dijkstra"
aStar = {}
aStar.name = "aStar"

while count <= executions do
  -- Cria mapa
  -- Repete a criação do mapa caso os caminhos não sejam possíveis
  repeat
    -- Gere um mapa aleatório
    map = generateRandomMap(rows, cols, start, goal)
    -- Gera um grafo ponderado
    grafo = createWeightedGraph(map)
    -- Calcula o caminho mais curto com Dijkstra e seu tempo de execução
    dijkstra.time = measureExecutionTime(function()
      dijkstra.path = pathDijkstra(grafo, start, goal)  -- Chamada à função dijkstra
    end)
    -- Quantidade de arestas no caminho com Dijkstra
    dijkstra.edges = #dijkstra.path
    -- Calcula o caminho mais curto com aStar (A*) e seu tempo de execução
    aStar.time = measureExecutionTime(function()
      aStar.path = pathAStar(grafo, start, goal)  -- Chamada à função aStar
    end)
    -- Quantidade de arestas no caminho com aStar (A*)
    aStar.edges = #aStar.path
  until dijkstra.edges > 1 and aStar.edges > 1

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
  print("Caminho com Dijkstra")
  printPathAsLuaTable(dijkstra.path)
  dijkstra.weight = calculatePathWeight(grafo, dijkstra.path)
  print("Tempo com Dijkstra " .. dijkstra.time)
  print("Arestas do caminho com Dijkstra " .. dijkstra.edges)
  print("Peso do caminho com Dijkstra " .. dijkstra.weight)
  print("\n")
  print("Caminho com aStar (A*)")
  printPathAsLuaTable(aStar.path)
  aStar.weight = calculatePathWeight(grafo, aStar.path)
  print("Tempo com aStar (A*) " .. aStar.time)
  print("Arestas do caminho com aStar (A*) " .. aStar.edges)
  print("Peso do caminho com aStar (A*) " .. aStar.weight)
  print("\n")
  print("Exportando grafos")
  -- Passar contador de execuções como parâmetro para nao sobrescrever os arquivos
  dijkstra.file = exportGraphAsDotWithSubgraph(grafo, dijkstra.path, dijkstra.name, count)
  aStar.file = exportGraphAsDotWithSubgraph(grafo, aStar.path, aStar.name, count)
  print("\n")
  print("Convertendo dot para svg com Graphviz")
  generateSVGFromDotFile(dijkstra.file)
  generateSVGFromDotFile(aStar.file)
  end
    -- Contador de execuções
    count = count + 1
end
