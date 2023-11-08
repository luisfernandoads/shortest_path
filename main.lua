-- Importar modulos
require("map_functions")
require("graph_functions")
require("pathfinding_functions")
require("print_functions")


-- Tamanho da matriz de adjacencia que representa o tabuleiro
-- Numero de linhas (arg1)
rows = arg[1] or 8
-- Numero de colunas (arg2)
cols = arg[2] or 8

-- Coordenadas de início e final, representadas como pares de valores (linha, coluna)
-- coordenada x do inicio (arg3)
linha_inicio = arg[3] or 1
-- coordenada y do inicio (arg4)
coluna_inicio = arg[4] or 1
inicio = {linha = linha_inicio, coluna = coluna_inicio}  -- Por exemplo, início na coordenada (1, 1)
-- coordenada x do final (arg5)
linha_final = arg[5] or rows
-- coordenada y do final (arg6)
coluna_final = arg[6] or cols
final = {linha = linha_final, coluna = coluna_final}  -- Por exemplo, final na coordenada (8, 8)



print("Matriz de adjacência: " .. rows .. "x" .. cols)
print("inicio: x=" .. inicio.linha .. ",y=" .. inicio.coluna)
print("final: x=" .. final.linha .. ",y=" .. final.coluna)

-- ------------------------------------
-- Valor dos obstaculos
obstacle = 0
-- Um multiplicador utilizado para indexar células em uma grade ou matriz
-- Calcular um índice exclusivo para cada célula em uma grade ou matriz bidimensional.
indexMultiplier = 10 ^ math.ceil(math.log10(rows * cols))

-- -------------------------

-- repita a criacao do mapa caso os caminhos nao sejam possiveis
repeat
  -- Gere um mapa aleatório
  mapa = generateRandomMap(rows, cols, inicio, final)
  -- Gera grafo ponderado
  grafo = createWeightedGraph(mapa)
  -- Calcula o caminho mais curto com dijkstra
  path_dijkstra = dijkstra(grafo, inicio, final)
  -- Calcula o caminho com busca em profundidade (Depth-First Search - DFS) 
  path_dfs = depthFirstSearch(grafo, inicio, final)
until path_dijkstra and path_dfs

print("Mapa")
printMap(mapa)
print("Grafo ponderado")
printGraphAsLuaTable(grafo)
print("dijkstra")
printPathAsLuaTable(path_dijkstra)
print("dfs" )
printPathAsLuaTable(path_dfs)
print("salvando arquivo em formato dot do grafo dijkstra")
saveGraphAsDotWithSubgraph(grafo, path_dijkstra, "dijkstra")
print("salvando arquivo em formato dot do grafo dfs")
saveGraphAsDotWithSubgraph(grafo, path_dfs, "dfs")