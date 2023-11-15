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
-- Configurar exportação (arg7)
local export = arg[7] or true

-- Variáveis do programa
-- Valor dos obstáculos
obstacle = 0
-- Um multiplicador usado para indexar células em uma grade ou matriz
-- Calcula um índice exclusivo para cada célula em uma grade ou matriz bidimensional.
indexMultiplier = 10 ^ math.ceil(math.log10(rows * cols))

-- Criar mapa

-- Repete a criação do mapa caso os caminhos não sejam possíveis
repeat
  -- Gere um mapa aleatório
  map = generateRandomMap(rows, cols, start, goal)
  -- Gera um grafo ponderado
  grafo = createWeightedGraph(map)
  -- Calcula o caminho mais curto com Dijkstra e seu tempo de execução
  time_dijkstra = measureExecutionTime(function()
    path_dijkstra = dijkstra(grafo, start, goal)  -- Chamada à função dijkstra
  end)
  -- Calcula o caminho mais curto com aStar (A*) e seu tempo de execução
  time_aStar = measureExecutionTime(function()
    path_aStar = aStar(grafo, start, goal)  -- Chamada à função aStar
  end)
until #path_dijkstra > 1 and #path_aStar > 1

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
printPathAsLuaTable(path_dijkstra)
weight_dijkstra = calculatePathWeight(grafo, path_dijkstra)
print("Tempo com Dijkstra " .. time_dijkstra)
print("Arestas do caminho com Dijkstra " .. #path_dijkstra)
print("Peso do caminho com Dijkstra " .. weight_dijkstra)
print("\n")
print("Caminho com aStar (A*)")
printPathAsLuaTable(path_aStar)
weight_aStar = calculatePathWeight(grafo, path_aStar)
print("Tempo com aStar (A*) " .. time_aStar)
print("Arestas do caminho com aStar (A*) " .. #path_aStar)
print("Peso do caminho com aStar (A*) " .. weight_aStar)
-- Não exporta caso o parâmetro export seja "false"
if export ~= "false" then
  print("\n")
  print("Exportando grafos")
  local file_dijkstra = exportGraphAsDotWithSubgraph(grafo, path_dijkstra, "dijkstra")
  local file_aStar = exportGraphAsDotWithSubgraph(grafo, path_aStar, "aStar")
  print("\n")
  print("Convertendo dot para svg com Graphviz")
  generateSVGFromDotFile(file_dijkstra)
  generateSVGFromDotFile(file_aStar)
end
