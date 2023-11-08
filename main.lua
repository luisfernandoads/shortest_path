-- Importar modulos
require("map_functions")
require("graph_functions")
require("pathfinding_functions")
require("print_functions")

-- Obtem os valores dos args ou utiliza valorez padrao

-- Tamanho da matriz de adjacencia que representa o tabuleiro
-- Numero de rows (arg1)
rows = arg[1] or 8
-- Numero de cols (arg2)
cols = arg[2] or 8

-- Coordenadas de início e final, representadas como pares de valores (row, col)
-- coordenada x do inicio (arg3)
row_start = arg[3] or 1
-- coordenada y do inicio (arg4)
col_start = arg[4] or 1
start = {row = row_start, col = col_start}  -- Por exemplo, início na coordenada (1, 1)
-- coordenada x do final (arg5)
row_goal = arg[5] or rows
-- coordenada y do final (arg6)
col_goal = arg[6] or cols
goal = {row = row_goal, col = col_goal}  -- Por exemplo, goal na coordenada (8, 8)

-- variaveis do programa
-- Valor dos obstaculos
obstacle = 0
-- Um multiplicador utilizado para indexar células em uma grade ou matriz
-- Calcular um índice exclusivo para cada célula em uma grade ou matriz bidimensional.
indexMultiplier = 10 ^ math.ceil(math.log10(rows * cols))

-- criar mapa

-- repita a criacao do map caso os caminhos nao sejam possiveis
repeat
  -- Gere um map aleatório
  map = generateRandomMap(rows, cols, start, goal)
  -- Gera grafo ponderado
  grafo = createWeightedGraph(map)
  -- Calcula o caminho mais curto com dijkstra
  path_dijkstra = dijkstra(grafo, start, goal)
  -- Calcula o caminho com busca em profundidade (Depth-First Search - DFS) 
  path_dfs = depthFirstSearch(grafo, start, goal)
until path_dijkstra and path_dfs

-- Saidas no terminal
print("Matriz de adjacencia")
print("tamanho: " .. rows .. "x" .. cols)
print("inicio: x=" .. start.row .. ",y=" .. start.col)
print("final: x=" .. goal.row .. ",y=" .. goal.col)
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
print("Caminho com Depth-First Search" )
printPathAsLuaTable(path_dfs)
print("\n")
print("Exportando grafos" )
saveGraphAsDotWithSubgraph(grafo, path_dijkstra, "dijkstra")
saveGraphAsDotWithSubgraph(grafo, path_dfs, "dfs")