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
rows = arg[1] or 8
-- Número de colunas (arg2)
cols = arg[2] or 8

-- Coordenadas de início e final, representadas como pares de valores (linha, coluna)
-- Coordenada x de início (arg3)
row_start = arg[3] or 1
-- Coordenada y de início (arg4)
col_start = arg[4] or 1
start = {row = row_start, col = col_start}  -- Por exemplo, início na coordenada (1, 1)
-- Coordenada x do final (arg5)
row_goal = arg[5] or rows
-- Coordenada y do final (arg6)
col_goal = arg[6] or cols
goal = {row = row_goal, col = col_goal}  -- Por exemplo, meta na coordenada (8, 8)
-- Configurar exportação
export = arg[7] or true

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
  -- Calcula o caminho mais curto com Dijkstra
  path_dijkstra = dijkstra(grafo, start, goal)
  -- Calcula o caminho com busca em profundidade (Depth-First Search - DFS)
  path_dfs = depthFirstSearch(grafo, start, goal)
until path_dijkstra and path_dfs

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
print("\n")
print("Caminho com Depth-First Search")
printPathAsLuaTable(path_dfs)
-- Não exporta caso o parâmetro export seja "false"
if export ~= "false" then
  print("\n")
  print("Exportando grafos")
  file_dijkstra = exportGraphAsDotWithSubgraph(grafo, path_dijkstra, "dijkstra")
  file_dfs = exportGraphAsDotWithSubgraph(grafo, path_dfs, "dfs")
  print("\n")
  print("Convertendo dot para svg com Graphviz")
  generateSVGFromDotFile(file_dijkstra)
  generateSVGFromDotFile(file_dfs)
end