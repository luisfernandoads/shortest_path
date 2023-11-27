# CAMINHO MAIS CURTO - SHORTEST PATH

Este projeto foi desenvolvido por:
* ***Luis Fernando Alves da Silva***
* ***Matheus Otero Romano***
* ***Pedro Ramires da Silva Amalfi Costa***

Como requisito parcial de entrega de atividade final da disciplina de Otimização e complexidade de Algoritmos pelo professor Dr. e Coordenador do curso Rodrigo Brandão Mansilha do curso de Mestrado em Engenharia de Software pela Universidade Federal dos Pampas (UNIPAMPA) no ano de 2023.

## SHORTEST PATH
## PROBLEMA

Shortest Path - Encontre o caminho mais curto de s a t em G. Sendo assim, tem-se como premissa calcular o caminho mais curto para um personagem de jogo digital com movimentação baseada na grade de um tabuleiro com obstáculos.
## JUSTIFICATIVA
Grande parte dos jogos envolve a movimentação de personagens, em alguns destes o jogador seleciona um destino e o personagem se movimenta até este ponto evitando obstáculos pelo caminho. O ideal é que o personagem percorra o caminho mais curto possível, além disso este caminho deve ser computado em tempo hábil para que o jogo apresente uma movimentação suave e convincente.

## INTRODUÇÃO

O problema do caminho mais curto é um dos problemas fundamentais em teoria dos grafos e otimização. Ele se refere à busca pelo caminho de menor custo entre dois vértices em um grafo ponderado, onde cada aresta possui um peso associado. O custo total de um caminho é a soma dos pesos das arestas ao longo desse caminho. É especialmente utilizado na movimentação de personagens em jogos digitais. Dentre os algoritmos que tratam esse assunto tem-se em uso neste trabalho: Dijkstra e A*. Onde, o algoritmo de Dijkstra é uma técnica clássica em teoria dos grafos para encontrar o caminho mais curto entre um vértice de origem e todos os outros vértices em um grafo ponderado não direcionado ou direcionado. Proposto por Edsger Dijkstra em 1956, o algoritmo mantém um conjunto de vértices cujas distâncias mais curtas da origem são conhecidas e atualiza iterativamente essas distâncias, garantindo uma solução ótima. Já o algoritmo A* é uma heurística de busca informada frequentemente aplicada para encontrar o caminho mais curto entre dois pontos em um grafo. Desenvolvido por Peter Hart, Nils Nilsson e Bertram Raphael em 1968, o A* combina os benefícios da busca em largura (ou profundidade) com uma heurística que guia a exploração para direções mais promissoras.

## ALGORITMOS
O algoritmo de Dijkstra é uma técnica amplamente utilizada para encontrar o caminho mais curto em um grafo direcionado ponderado, partindo de um nó de origem e alcançando todos os outros nós do grafo. Sua abordagem é baseada em um processo guloso (greedy), o que significa que ele escolhe sempre o nó mais próximo da origem que ainda não foi visitado. Inicialmente, as estimativas de distância para todos os nós são definidas como infinito, exceto para o nó de origem, que é definido como zero. À medida que o algoritmo avança, ele atualiza essas estimativas de distância, reduzindo-as sempre que encontrar um caminho mais curto. O algoritmo continua iterativamente, visitando os nós vizinhos e atualizando suas estimativas de distância. O mesmo para quando todos os nós tenham sido visitados ou quando o nó de destino seja alcançado. O resultado é um conjunto de distâncias mínimas entre o nó de origem e todos os outros nós do grafo.
## Análise Assintótica:
O algoritmo de Dijkstra é conhecido por ter uma complexidade de tempo de O((V + E) * log(V)), onde V é o número de nós (vértices) e E é o número de arestas no grafo. Essa complexidade é devido ao uso de uma fila de prioridade que requer operações de inserção e remoção com eficiência logarítmica.

O algoritmo A* é um algoritmo de busca em grafos que encontra o caminho mais curto entre um vértice inicial e um vértice objetivo. O algoritmo A* utiliza uma heurística para estimar a distância entre um vértice e o vértice objetivo. As heurísticas são estratégias ou métodos aproximados que são utilizados para resolver problemas e encontrar soluções quando as abordagens exatas são impraticáveis ou muito demoradas. Em algoritmos determinísticos geralmente assumem a forma de regras ou estratégias que orientam o processo de busca ou otimização. Elas são frequentemente aplicadas em algoritmos que exigem uma exploração extensiva de um espaço de solução ou em problemas para os quais não existe uma solução algorítmica eficiente conhecida. Vale ressaltar que, enquanto uma heurística pode acelerar o processo de busca, ela não oferece garantias de encontrar a solução ótima em todos os casos. Em vez disso, as heurísticas buscam encontrar soluções suficientemente boas em um tempo viável.
Assim é eficiente para problemas complexos de busca de caminho, se a heurística utilizada for precisa. A escolha da heurística adequada depende do contexto da aplicação. Neste projeto utilizou-se A* com heurística de Manhattan que possui complexidade temporal de O(E + V * log(V)), onde V é o número de vértices do grafo e E é o número de arestas do grafo e também por ser mais fiel ao problema específico do cenário de um jogo. Assim, faz-se por buscar a melhor eficiência. Existe também a heurística euclidiana onde possuem comportamentos diferentes. 
Euclidiana: Favorece movimentos diagonais, já que a distância euclidiana é minimizada quando se segue uma trajetória em linha reta. É especialmente útil em ambientes contínuos ou quando os movimentos diagonais têm o mesmo custo que os movimentos horizontais e verticais.
Manhattan: Tende a priorizar movimentos em linha reta na grade, pois é mais precisa em ambientes nos quais os movimentos diagonais são mais caros do que os movimentos horizontais ou verticais.

## DIFERENÇA

A principal diferença entre os algoritmos de Dijkstra e A* com a heurística de Manhattan é que, Dijkstra encontra o caminho mais curto de um ponto de origem para todos os outros pontos no grafo. Enquanto A* com a heurística de Manhattan encontra o caminho mais curto de um ponto de origem para um ponto de destino específico.



## :pushpin: Dependências da Aplicação

Para conseguir executar a aplicação sem problema nenhum é necessário:

* ***Instalação dos pacotes LUA***
* ***Manter as dll na pasta C:\lua***
* ***Adicionar C:\luz como variável de ambiente***
* ***python***
* ***matplotlib==3.4.3***
(Não esqueça de rodar o terminal como Administrador!)

```bash

python -m pip install -U pip
python -m pip install -U matplotlib

```
* ***pandas==1.3.3***
```bash

python -m pip install -U pandas

```
* ***numpy==1.21.2***
``bash

python -m pip install -U pandas

```
* ***OPCIONAL:Graphviz***
``bash

https://graphviz.org/download/

```

## :gear: Testando a aplicação:
***Primeiramente Clone o Diretório:***
```bash

git clone https://github.com/luisfernandoads/shortest_path.git

```
Este comando irá clonar o repositório no GITHUB para dentro do diretório atual 

***Entre dentro do diretório iozone:***
```bash

cd shortest_path

```
Este comando irá mudar seu diretório atual para dentro do diretório shortest_path

***Inicie a criação do mapa e seleção do caminho***
```bash

lua54 .\main.lua 10 10 false false true 10

```

Este comando executa as bibliotecas LUA instaladas e configuradas em seu computador (no caso lua54) em seguida é passado o nome do arquivo principal da aplicação (.\main.lua) e é passado os parâmetros para a criação do mapa com 6 parâmetros sendo os dois primeiros pares a quantidade de linhas e colunas que seu mapa possuirá (10 10), seguido por indicando se possui pontos de início e final fixos ou não (neste caso o false informa que não serão gerados valores aleatórios para início e fim do percurso), após isso é informado se será implementado pesos pelas arestas entre o caminho de origem e destino (pesos variam de 1 a 9) ou se serão todas com o mesmo peso (padrão 1), neste caso não será inserido pesos no caminho (false), logo em seguida é informado se o usuário deseja que o caminho seja construído com ou sem obstáculos (no exemplo mencionado será adicionado obstáculos no trajeto - true) e por último, é informado a quantidade de vezes que deseja repetir a execução do projeto (no caso 10 vezes) - vale lembrar que o sistema cresce de forma linear, com base no valor inicial da matriz, então neste exemplo será uma matriz 10x10, depois 20x20, 30x30, 40x40, e assim por diante até atingir a quantidade de vezes que foi especificado pelo usuário na hora dos parâmetros, no caso 10, finalizando com uma matriz 100x100.



***Saída Gerada pelo comando***

Este comando irá executar a ferramenta 10 vezes e criará uma matriz de 10 linhas por 10 colunas sendo o ponto inicial a posição da linha 1 e coluna 1 e como ponto final a posição da linha 10 e coluna 10 (lembrando que o ponto final muda a cada execução, já que ele cresce de forma linear), em seguida será gerado o mapa e o Grafo Ponderado onde pode ser observado o custo de cada caminho (arestas), por ultimo um arquivo chamado execution(resto_do_nome).csv será criado com os resultados das execuções para entender como foi encontrado aquele caminho com um menor custo entre todos os caminhos possívels, com uma saida como a de baixo:

(OBS: Esta é uma das 10 respostas gerada pelo comando!)

```bash

Mapa com Minimum Spanning Tree:
0 0 0 0 0 0 0 0 
7 0 0 0 0 0 0 0
3 9 8 1 5 6 9 0
0 0 0 0 0 0 5 0
0 0 1 0 0 0 4 0
0 0 1 2 0 0 8 0
0 0 0 2 4 5 9 0
7 2 7 2 3 1 6 0 
Matriz de adjacencia
Tamanho: 10x10
Inicio: x=1, y=1
Final: x=10, y=10


Mapa
1 1 0 1 0 1 1 1 0 1
1 1 1 1 1 1 0 0 1 0
1 1 1 1 1 1 0 1 0 0
1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 0 1
0 1 1 0 1 1 0 1 1 1
0 1 1 1 1 0 1 1 0 1
1 1 1 0 1 0 1 1 0 0
1 0 1 1 1 1 0 1 1 1
0 1 1 1 1 1 1 1 0 1


Grafo ponderado
{
  [101] = {
    [102] = 1,
    [201] = 1,
  },
  [102] = {
    [101] = 1,
    [202] = 1,
  },
  [104] = {
    [204] = 1,
  },
  [106] = {
    [107] = 1,
    [206] = 1,
  },
  [107] = {
    [106] = 1,
    [108] = 1,
  },
  [108] = {
    [107] = 1,
  },
  [110] = {
  },
  [201] = {
    [101] = 1,
    [202] = 1,
    [301] = 1,
  },
  [202] = {
    [102] = 1,
    [201] = 1,
    [203] = 1,
    [302] = 1,
  },
  [203] = {
    [202] = 1,
    [204] = 1,
    [303] = 1,
  },
  [204] = {
    [104] = 1,
    [203] = 1,
    [205] = 1,
    [304] = 1,
  },
  [205] = {
    [204] = 1,
    [206] = 1,
    [305] = 1,
  },
  [206] = {
    [106] = 1,
    [205] = 1,
    [306] = 1,
  },
  [209] = {
  },
  [301] = {
    [201] = 1,
    [302] = 1,
    [401] = 1,
  },
  [302] = {
    [202] = 1,
    [301] = 1,
    [303] = 1,
    [402] = 1,
  },
  [303] = {
    [203] = 1,
    [302] = 1,
    [304] = 1,
    [403] = 1,
  },
  [304] = {
    [204] = 1,
    [303] = 1,
    [305] = 1,
    [404] = 1,
  },
  [305] = {
    [205] = 1,
    [304] = 1,
    [306] = 1,
    [405] = 1,
  },
  [306] = {
    [206] = 1,
    [305] = 1,
    [406] = 1,
  },
  [308] = {
    [408] = 1,
  },
  [401] = {
    [301] = 1,
    [402] = 1,
    [501] = 1,
  },
  [402] = {
    [302] = 1,
    [401] = 1,
    [403] = 1,
    [502] = 1,
  },
  [403] = {
    [303] = 1,
    [402] = 1,
    [404] = 1,
    [503] = 1,
  },
  [404] = {
    [304] = 1,
    [403] = 1,
    [405] = 1,
    [504] = 1,
  },
  [405] = {
    [305] = 1,
    [404] = 1,
    [406] = 1,
    [505] = 1,
  },
  [406] = {
    [306] = 1,
    [405] = 1,
    [407] = 1,
    [506] = 1,
  },
  [407] = {
    [406] = 1,
    [408] = 1,
    [507] = 1,
  },
  [408] = {
    [308] = 1,
    [407] = 1,
    [409] = 1,
    [508] = 1,
  },
  [409] = {
    [408] = 1,
    [410] = 1,
  },
  [410] = {
    [409] = 1,
    [510] = 1,
  },
  [501] = {
    [401] = 1,
    [502] = 1,
  },
  [502] = {
    [402] = 1,
    [501] = 1,
    [503] = 1,
    [602] = 1,
  },
  [503] = {
    [403] = 1,
    [502] = 1,
    [504] = 1,
    [603] = 1,
  },
  [504] = {
    [404] = 1,
    [503] = 1,
    [505] = 1,
  },
  [505] = {
    [405] = 1,
    [504] = 1,
    [506] = 1,
    [605] = 1,
  },
  [506] = {
    [406] = 1,
    [505] = 1,
    [507] = 1,
    [606] = 1,
  },
  [507] = {
    [407] = 1,
    [506] = 1,
    [508] = 1,
  },
  [508] = {
    [408] = 1,
    [507] = 1,
    [608] = 1,
  },
  [510] = {
    [410] = 1,
    [610] = 1,
  },
  [602] = {
    [502] = 1,
    [603] = 1,
    [702] = 1,
  },
  [603] = {
    [503] = 1,
    [602] = 1,
    [703] = 1,
  },
  [605] = {
    [505] = 1,
    [606] = 1,
    [705] = 1,
  },
  [606] = {
    [506] = 1,
    [605] = 1,
  },
  [608] = {
    [508] = 1,
    [609] = 1,
    [708] = 1,
  },
  [609] = {
    [608] = 1,
    [610] = 1,
  },
  [610] = {
    [510] = 1,
    [609] = 1,
    [710] = 1,
  },
  [702] = {
    [602] = 1,
    [703] = 1,
    [802] = 1,
  },
  [703] = {
    [603] = 1,
    [702] = 1,
    [704] = 1,
    [803] = 1,
  },
  [704] = {
    [703] = 1,
    [705] = 1,
  },
  [705] = {
    [605] = 1,
    [704] = 1,
    [805] = 1,
  },
  [707] = {
    [708] = 1,
    [807] = 1,
  },
  [708] = {
    [608] = 1,
    [707] = 1,
    [808] = 1,
  },
  [710] = {
    [610] = 1,
  },
  [801] = {
    [802] = 1,
    [901] = 1,
  },
  [802] = {
    [702] = 1,
    [801] = 1,
    [803] = 1,
  },
  [803] = {
    [703] = 1,
    [802] = 1,
    [903] = 1,
  },
  [805] = {
    [705] = 1,
    [905] = 1,
  },
  [807] = {
    [707] = 1,
    [808] = 1,
  },
  [808] = {
    [708] = 1,
    [807] = 1,
    [908] = 1,
  },
  [901] = {
    [801] = 1,
  },
  [903] = {
    [803] = 1,
    [904] = 1,
    [1003] = 1,
  },
  [904] = {
    [903] = 1,
    [905] = 1,
    [1004] = 1,
  },
  [905] = {
    [805] = 1,
    [904] = 1,
    [906] = 1,
    [1005] = 1,
  },
  [906] = {
    [905] = 1,
    [1006] = 1,
  },
  [908] = {
    [808] = 1,
    [909] = 1,
    [1008] = 1,
  },
  [909] = {
    [908] = 1,
    [910] = 1,
  },
  [910] = {
    [909] = 1,
    [1010] = 1,
  },
  [1002] = {
    [1003] = 1,
  },
  [1003] = {
    [903] = 1,
    [1002] = 1,
    [1004] = 1,
  },
  [1004] = {
    [904] = 1,
    [1003] = 1,
    [1005] = 1,
  },
  [1005] = {
    [905] = 1,
    [1004] = 1,
    [1006] = 1,
  },
  [1006] = {
    [906] = 1,
    [1005] = 1,
    [1007] = 1,
  },
  [1007] = {
    [1006] = 1,
    [1008] = 1,
  },
  [1008] = {
    [908] = 1,
    [1007] = 1,
  },
  [1010] = {
    [910] = 1,
  },
}

```
Finalmente é informado o menor caminho para o Algoritmo de Dijkstra e A* com heuristicas de distancia de Manhattan, conforme abaixo, bem como gerado dois arquivos para uma visualização dos caminhos encontrados.

```bash

Caminho com Dijkstra
{101, 201, 301, 401, 402, 403, 404, 405, 406, 407, 408, 508, 608, 708, 808, 908, 909, 910, 1010}
Tempo com Dijkstra 0.0
Arestas do caminho com Dijkstra 19
Peso do caminho com Dijkstra 18


aStarManhattan (A*) com heuristica de dist├óncia de Manhattan
Caminho com aStarManhattan (A*)
{101, 201, 301, 401, 402, 403, 404, 405, 406, 407, 408, 508, 608, 708, 808, 908, 909, 910, 1010}
Tempo com aStarManhattan (A*) 0.0
Arestas do caminho com aStarManhattan (A*) 19
Peso do caminho com aStarManhattan (A*) 18


Exportando grafos
Grafo exportado como 1_graph_dijkstra_2023-11-27_16-15-51.dot
Grafo exportado como 1_graph_astar_manhattan_2023-11-27_16-15-51.dot


Convertendo dot para svg com Graphviz
Exportado para svg como 1_graph_dijkstra_2023-11-27_16-15-51.svg
Exportado para svg como 1_graph_astar_manhattan_2023-11-27_16-15-51.svg
Arquivo CSV gerado com sucesso: execution_data_2023-11-27_16-15-52.csv


```


## :keyboard: Visualizando o caminho e mapa gerado:

Para uma visualização do mapa gerado pela aplicação, bem como o seu menor caminho, é necessário que acesse o [link](https://dreampuf.github.io/GraphvizOnline/ ) e em seguida copie e cole os comandos dos arquivos gerados com extensão .dot conforme abaixo:


```bash

digraph G {
graph [
layout = neato
label = "DIJKSTRA"
fontsize= "40pt"
]
  101;
  101 -> 102 [label="1"];
  101 -> 201 [label="1"];
  102;
  102 -> 101 [label="1"];
  102 -> 103 [label="1"];
  103;
  103 -> 102 [label="1"];
  103 -> 104 [label="1"];
  103 -> 203 [label="1"];
  104;
  104 -> 103 [label="1"];
  104 -> 105 [label="1"];
  104 -> 204 [label="1"];
  105;
  105 -> 104 [label="1"];
  105 -> 205 [label="1"];
  107;
  107 -> 108 [label="1"];
  107 -> 207 [label="1"];
  108;
  108 -> 107 [label="1"];
  108 -> 109 [label="1"];
  108 -> 208 [label="1"];
  109;
  109 -> 108 [label="1"];
  109 -> 110 [label="1"];
  109 -> 209 [label="1"];
  110;
  110 -> 109 [label="1"];
  110 -> 210 [label="1"];
  201;
  201 -> 101 [label="1"];
  201 -> 301 [label="1"];
  203;
  203 -> 103 [label="1"];
  203 -> 204 [label="1"];
  203 -> 303 [label="1"];
  204;
  204 -> 104 [label="1"];
  204 -> 203 [label="1"];
  204 -> 205 [label="1"];
  205;
  205 -> 105 [label="1"];
  205 -> 204 [label="1"];
  205 -> 206 [label="1"];
  205 -> 305 [label="1"];
  206;
  206 -> 205 [label="1"];
  206 -> 207 [label="1"];
  206 -> 306 [label="1"];
  207;
  207 -> 107 [label="1"];
  207 -> 206 [label="1"];
  207 -> 208 [label="1"];
  207 -> 307 [label="1"];
  208;
  208 -> 108 [label="1"];
  208 -> 207 [label="1"];
  208 -> 209 [label="1"];
  208 -> 308 [label="1"];
  209;
  209 -> 109 [label="1"];
  209 -> 208 [label="1"];
  209 -> 210 [label="1"];
  209 -> 309 [label="1"];
  210;
  210 -> 110 [label="1"];
  210 -> 209 [label="1"];
  210 -> 310 [label="1"];
  301;
  301 -> 201 [label="1"];
  301 -> 302 [label="1"];
  302;
  302 -> 301 [label="1"];
  302 -> 303 [label="1"];
  302 -> 402 [label="1"];
  303;
  303 -> 203 [label="1"];
  303 -> 302 [label="1"];
  303 -> 403 [label="1"];
  305;
  305 -> 205 [label="1"];
  305 -> 306 [label="1"];
  305 -> 405 [label="1"];
  306;
  306 -> 206 [label="1"];
  306 -> 305 [label="1"];
  306 -> 307 [label="1"];
  307;
  307 -> 207 [label="1"];
  307 -> 306 [label="1"];
  307 -> 308 [label="1"];
  307 -> 407 [label="1"];
  308;
  308 -> 208 [label="1"];
  308 -> 307 [label="1"];
  308 -> 309 [label="1"];
  309;
  309 -> 209 [label="1"];
  309 -> 308 [label="1"];
  309 -> 310 [label="1"];
  310;
  310 -> 210 [label="1"];
  310 -> 309 [label="1"];
  310 -> 410 [label="1"];
  402;
  402 -> 302 [label="1"];
  402 -> 403 [label="1"];
  402 -> 502 [label="1"];
  403;
  403 -> 303 [label="1"];
  403 -> 402 [label="1"];
  403 -> 404 [label="1"];
  403 -> 503 [label="1"];
  404;
  404 -> 403 [label="1"];
  404 -> 405 [label="1"];
  404 -> 504 [label="1"];
  405;
  405 -> 305 [label="1"];
  405 -> 404 [label="1"];
  405 -> 505 [label="1"];
  407;
  407 -> 307 [label="1"];
  407 -> 507 [label="1"];
  410;
  410 -> 310 [label="1"];
  410 -> 510 [label="1"];
  501;
  501 -> 502 [label="1"];
  501 -> 601 [label="1"];
  502;
  502 -> 402 [label="1"];
  502 -> 501 [label="1"];
  502 -> 503 [label="1"];
  502 -> 602 [label="1"];
  503;
  503 -> 403 [label="1"];
  503 -> 502 [label="1"];
  503 -> 504 [label="1"];
  504;
  504 -> 404 [label="1"];
  504 -> 503 [label="1"];
  504 -> 505 [label="1"];
  504 -> 604 [label="1"];
  505;
  505 -> 405 [label="1"];
  505 -> 504 [label="1"];
  505 -> 506 [label="1"];
  506;
  506 -> 505 [label="1"];
  506 -> 507 [label="1"];
  506 -> 606 [label="1"];
  507;
  507 -> 407 [label="1"];
  507 -> 506 [label="1"];
  507 -> 607 [label="1"];
  509;
  509 -> 510 [label="1"];
  509 -> 609 [label="1"];
  510;
  510 -> 410 [label="1"];
  510 -> 509 [label="1"];
  601;
  601 -> 501 [label="1"];
  601 -> 602 [label="1"];
  602;
  602 -> 502 [label="1"];
  602 -> 601 [label="1"];
  602 -> 702 [label="1"];
  604;
  604 -> 504 [label="1"];
  604 -> 704 [label="1"];
  606;
  606 -> 506 [label="1"];
  606 -> 607 [label="1"];
  606 -> 706 [label="1"];
  607;
  607 -> 507 [label="1"];
  607 -> 606 [label="1"];
  607 -> 608 [label="1"];
  607 -> 707 [label="1"];
  608;
  608 -> 607 [label="1"];
  608 -> 609 [label="1"];
  608 -> 708 [label="1"];
  609;
  609 -> 509 [label="1"];
  609 -> 608 [label="1"];
  609 -> 709 [label="1"];
  702;
  702 -> 602 [label="1"];
  702 -> 703 [label="1"];
  703;
  703 -> 702 [label="1"];
  703 -> 704 [label="1"];
  703 -> 803 [label="1"];
  704;
  704 -> 604 [label="1"];
  704 -> 703 [label="1"];
  704 -> 705 [label="1"];
  704 -> 804 [label="1"];
  705;
  705 -> 704 [label="1"];
  705 -> 706 [label="1"];
  705 -> 805 [label="1"];
  706;
  706 -> 606 [label="1"];
  706 -> 705 [label="1"];
  706 -> 707 [label="1"];
  706 -> 806 [label="1"];
  707;
  707 -> 607 [label="1"];
  707 -> 706 [label="1"];
  707 -> 708 [label="1"];
  707 -> 807 [label="1"];
  708;
  708 -> 608 [label="1"];
  708 -> 707 [label="1"];
  708 -> 709 [label="1"];
  708 -> 808 [label="1"];
  709;
  709 -> 609 [label="1"];
  709 -> 708 [label="1"];
  801;
  801 -> 901 [label="1"];
  803;
  803 -> 703 [label="1"];
  803 -> 804 [label="1"];
  803 -> 903 [label="1"];
  804;
  804 -> 704 [label="1"];
  804 -> 803 [label="1"];
  804 -> 805 [label="1"];
  804 -> 904 [label="1"];
  805;
  805 -> 705 [label="1"];
  805 -> 804 [label="1"];
  805 -> 806 [label="1"];
  805 -> 905 [label="1"];
  806;
  806 -> 706 [label="1"];
  806 -> 805 [label="1"];
  806 -> 807 [label="1"];
  806 -> 906 [label="1"];
  807;
  807 -> 707 [label="1"];
  807 -> 806 [label="1"];
  807 -> 808 [label="1"];
  807 -> 907 [label="1"];
  808;
  808 -> 708 [label="1"];
  808 -> 807 [label="1"];
  808 -> 908 [label="1"];
  810;
  810 -> 910 [label="1"];
  901;
  901 -> 801 [label="1"];
  901 -> 902 [label="1"];
  901 -> 1001 [label="1"];
  902;
  902 -> 901 [label="1"];
  902 -> 903 [label="1"];
  902 -> 1002 [label="1"];
  903;
  903 -> 803 [label="1"];
  903 -> 902 [label="1"];
  903 -> 904 [label="1"];
  903 -> 1003 [label="1"];
  904;
  904 -> 804 [label="1"];
  904 -> 903 [label="1"];
  904 -> 905 [label="1"];
  904 -> 1004 [label="1"];
  905;
  905 -> 805 [label="1"];
  905 -> 904 [label="1"];
  905 -> 906 [label="1"];
  905 -> 1005 [label="1"];
  906;
  906 -> 806 [label="1"];
  906 -> 905 [label="1"];
  906 -> 907 [label="1"];
  906 -> 1006 [label="1"];
  907;
  907 -> 807 [label="1"];
  907 -> 906 [label="1"];
  907 -> 908 [label="1"];
  907 -> 1007 [label="1"];
  908;
  908 -> 808 [label="1"];
  908 -> 907 [label="1"];
  908 -> 909 [label="1"];
  908 -> 1008 [label="1"];
  909;
  909 -> 908 [label="1"];
  909 -> 910 [label="1"];
  909 -> 1009 [label="1"];
  910;
  910 -> 810 [label="1"];
  910 -> 909 [label="1"];
  910 -> 1010 [label="1"];
  1001;
  1001 -> 901 [label="1"];
  1001 -> 1002 [label="1"];
  1002;
  1002 -> 902 [label="1"];
  1002 -> 1001 [label="1"];
  1002 -> 1003 [label="1"];
  1003;
  1003 -> 903 [label="1"];
  1003 -> 1002 [label="1"];
  1003 -> 1004 [label="1"];
  1004;
  1004 -> 904 [label="1"];
  1004 -> 1003 [label="1"];
  1004 -> 1005 [label="1"];
  1005;
  1005 -> 905 [label="1"];
  1005 -> 1004 [label="1"];
  1005 -> 1006 [label="1"];
  1006;
  1006 -> 906 [label="1"];
  1006 -> 1005 [label="1"];
  1006 -> 1007 [label="1"];
  1007;
  1007 -> 907 [label="1"];
  1007 -> 1006 [label="1"];
  1007 -> 1008 [label="1"];
  1008;
  1008 -> 908 [label="1"];
  1008 -> 1007 [label="1"];
  1008 -> 1009 [label="1"];
  1009;
  1009 -> 909 [label="1"];
  1009 -> 1008 [label="1"];
  1009 -> 1010 [label="1"];
  1010;
  1010 -> 910 [label="1"];
  1010 -> 1009 [label="1"];
  subgraph path {
    rank = same;
    101 [style=filled, fillcolor=yellow];
    201 [style=filled, fillcolor=yellow];
    301 [style=filled, fillcolor=yellow];
    302 [style=filled, fillcolor=yellow];
    402 [style=filled, fillcolor=yellow];
    502 [style=filled, fillcolor=yellow];
    602 [style=filled, fillcolor=yellow];
    702 [style=filled, fillcolor=yellow];
    703 [style=filled, fillcolor=yellow];
    803 [style=filled, fillcolor=yellow];
    903 [style=filled, fillcolor=yellow];
    904 [style=filled, fillcolor=yellow];
    905 [style=filled, fillcolor=yellow];
    906 [style=filled, fillcolor=yellow];
    907 [style=filled, fillcolor=yellow];
    908 [style=filled, fillcolor=yellow];
    909 [style=filled, fillcolor=yellow];
    910 [style=filled, fillcolor=yellow];
    1010 [style=filled, fillcolor=yellow];
    101 -> 201 [color=red];
    201 -> 301 [color=red];
    301 -> 302 [color=red];
    302 -> 402 [color=red];
    402 -> 502 [color=red];
    502 -> 602 [color=red];
    602 -> 702 [color=red];
    702 -> 703 [color=red];
    703 -> 803 [color=red];
    803 -> 903 [color=red];
    903 -> 904 [color=red];
    904 -> 905 [color=red];
    905 -> 906 [color=red];
    906 -> 907 [color=red];
    907 -> 908 [color=red];
    908 -> 909 [color=red];
    909 -> 910 [color=red];
    910 -> 1010 [color=red];
  }
}

```

E Obterá o caminho como pode ser visto neste [link](https://dreampuf.github.io/GraphvizOnline/#digraph%20G%20%7B%0D%0Agraph%20%5B%0D%0Alayout%20%3D%20neato%0D%0Alabel%20%3D%20%22DIJKSTRA%22%0D%0Afontsize%3D%20%2240pt%22%0D%0A%5D%0D%0A%20%20101%3B%0D%0A%20%20101%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20101%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%3B%0D%0A%20%20102%20-%3E%20101%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20103%3B%0D%0A%20%20103%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20103%20-%3E%20104%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20103%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%3B%0D%0A%20%20104%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%20-%3E%20105%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20105%3B%0D%0A%20%20105%20-%3E%20104%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20105%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20107%3B%0D%0A%20%20107%20-%3E%20108%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20107%20-%3E%20207%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20108%3B%0D%0A%20%20108%20-%3E%20107%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20108%20-%3E%20109%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20108%20-%3E%20208%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20109%3B%0D%0A%20%20109%20-%3E%20108%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20109%20-%3E%20110%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20109%20-%3E%20209%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20110%3B%0D%0A%20%20110%20-%3E%20109%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20110%20-%3E%20210%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20201%3B%0D%0A%20%20201%20-%3E%20101%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20201%20-%3E%20301%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%3B%0D%0A%20%20203%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%3B%0D%0A%20%20204%20-%3E%20104%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%3B%0D%0A%20%20205%20-%3E%20105%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%20-%3E%20206%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20206%3B%0D%0A%20%20206%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20206%20-%3E%20207%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20206%20-%3E%20306%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20207%3B%0D%0A%20%20207%20-%3E%20107%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20207%20-%3E%20206%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20207%20-%3E%20208%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20207%20-%3E%20307%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20208%3B%0D%0A%20%20208%20-%3E%20108%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20208%20-%3E%20207%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20208%20-%3E%20209%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20208%20-%3E%20308%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20209%3B%0D%0A%20%20209%20-%3E%20109%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20209%20-%3E%20208%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20209%20-%3E%20210%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20209%20-%3E%20309%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20210%3B%0D%0A%20%20210%20-%3E%20110%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20210%20-%3E%20209%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20210%20-%3E%20310%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20301%3B%0D%0A%20%20301%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20301%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%3B%0D%0A%20%20302%20-%3E%20301%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%3B%0D%0A%20%20303%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%3B%0D%0A%20%20305%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20306%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20306%3B%0D%0A%20%20306%20-%3E%20206%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20306%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20306%20-%3E%20307%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20307%3B%0D%0A%20%20307%20-%3E%20207%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20307%20-%3E%20306%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20307%20-%3E%20308%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20307%20-%3E%20407%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20308%3B%0D%0A%20%20308%20-%3E%20208%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20308%20-%3E%20307%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20308%20-%3E%20309%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20309%3B%0D%0A%20%20309%20-%3E%20209%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20309%20-%3E%20308%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20309%20-%3E%20310%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20310%3B%0D%0A%20%20310%20-%3E%20210%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20310%20-%3E%20309%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20310%20-%3E%20410%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%3B%0D%0A%20%20402%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%3B%0D%0A%20%20403%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%3B%0D%0A%20%20404%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%3B%0D%0A%20%20405%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20407%3B%0D%0A%20%20407%20-%3E%20307%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20407%20-%3E%20507%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20410%3B%0D%0A%20%20410%20-%3E%20310%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20410%20-%3E%20510%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20501%3B%0D%0A%20%20501%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20501%20-%3E%20601%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%3B%0D%0A%20%20502%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%20-%3E%20501%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%3B%0D%0A%20%20503%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%3B%0D%0A%20%20504%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%20-%3E%20604%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%3B%0D%0A%20%20505%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%3B%0D%0A%20%20506%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%20-%3E%20507%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%20-%3E%20606%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20507%3B%0D%0A%20%20507%20-%3E%20407%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20507%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20507%20-%3E%20607%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20509%3B%0D%0A%20%20509%20-%3E%20510%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20509%20-%3E%20609%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20510%3B%0D%0A%20%20510%20-%3E%20410%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20510%20-%3E%20509%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20601%3B%0D%0A%20%20601%20-%3E%20501%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20601%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20602%3B%0D%0A%20%20602%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20602%20-%3E%20601%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20602%20-%3E%20702%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20604%3B%0D%0A%20%20604%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20604%20-%3E%20704%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20606%3B%0D%0A%20%20606%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20606%20-%3E%20607%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20606%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20607%3B%0D%0A%20%20607%20-%3E%20507%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20607%20-%3E%20606%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20607%20-%3E%20608%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20607%20-%3E%20707%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20608%3B%0D%0A%20%20608%20-%3E%20607%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20608%20-%3E%20609%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20608%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20609%3B%0D%0A%20%20609%20-%3E%20509%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20609%20-%3E%20608%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20609%20-%3E%20709%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20702%3B%0D%0A%20%20702%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20702%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%3B%0D%0A%20%20703%20-%3E%20702%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%20-%3E%20704%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%20-%3E%20803%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20704%3B%0D%0A%20%20704%20-%3E%20604%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20704%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20704%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20704%20-%3E%20804%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%3B%0D%0A%20%20705%20-%3E%20704%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%20-%3E%20805%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20706%3B%0D%0A%20%20706%20-%3E%20606%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20706%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20706%20-%3E%20707%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20706%20-%3E%20806%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%3B%0D%0A%20%20707%20-%3E%20607%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%20-%3E%20807%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%3B%0D%0A%20%20708%20-%3E%20608%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%20-%3E%20707%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%20-%3E%20709%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%20-%3E%20808%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20709%3B%0D%0A%20%20709%20-%3E%20609%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20709%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20801%3B%0D%0A%20%20801%20-%3E%20901%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20803%3B%0D%0A%20%20803%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20803%20-%3E%20804%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20803%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20804%3B%0D%0A%20%20804%20-%3E%20704%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20804%20-%3E%20803%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20804%20-%3E%20805%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20804%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%3B%0D%0A%20%20805%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%20-%3E%20804%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%20-%3E%20806%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20806%3B%0D%0A%20%20806%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20806%20-%3E%20805%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20806%20-%3E%20807%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20806%20-%3E%20906%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20807%3B%0D%0A%20%20807%20-%3E%20707%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20807%20-%3E%20806%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20807%20-%3E%20808%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20807%20-%3E%20907%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20808%3B%0D%0A%20%20808%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20808%20-%3E%20807%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20808%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20810%3B%0D%0A%20%20810%20-%3E%20910%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20901%3B%0D%0A%20%20901%20-%3E%20801%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20901%20-%3E%20902%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20901%20-%3E%201001%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20902%3B%0D%0A%20%20902%20-%3E%20901%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20902%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20902%20-%3E%201002%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%3B%0D%0A%20%20903%20-%3E%20803%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%20-%3E%20902%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%3B%0D%0A%20%20904%20-%3E%20804%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%20-%3E%201004%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%3B%0D%0A%20%20905%20-%3E%20805%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%20-%3E%20906%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%20-%3E%201005%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20906%3B%0D%0A%20%20906%20-%3E%20806%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20906%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20906%20-%3E%20907%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20906%20-%3E%201006%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20907%3B%0D%0A%20%20907%20-%3E%20807%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20907%20-%3E%20906%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20907%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20907%20-%3E%201007%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%3B%0D%0A%20%20908%20-%3E%20808%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%20-%3E%20907%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%20-%3E%20909%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%20-%3E%201008%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20909%3B%0D%0A%20%20909%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20909%20-%3E%20910%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20909%20-%3E%201009%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20910%3B%0D%0A%20%20910%20-%3E%20810%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20910%20-%3E%20909%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20910%20-%3E%201010%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201001%3B%0D%0A%20%201001%20-%3E%20901%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201001%20-%3E%201002%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201002%3B%0D%0A%20%201002%20-%3E%20902%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201002%20-%3E%201001%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201002%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%3B%0D%0A%20%201003%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%20-%3E%201002%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%20-%3E%201004%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201004%3B%0D%0A%20%201004%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201004%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201004%20-%3E%201005%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201005%3B%0D%0A%20%201005%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201005%20-%3E%201004%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201005%20-%3E%201006%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%3B%0D%0A%20%201006%20-%3E%20906%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%20-%3E%201005%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%20-%3E%201007%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201007%3B%0D%0A%20%201007%20-%3E%20907%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201007%20-%3E%201006%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201007%20-%3E%201008%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201008%3B%0D%0A%20%201008%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201008%20-%3E%201007%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201008%20-%3E%201009%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201009%3B%0D%0A%20%201009%20-%3E%20909%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201009%20-%3E%201008%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201009%20-%3E%201010%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201010%3B%0D%0A%20%201010%20-%3E%20910%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201010%20-%3E%201009%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20subgraph%20path%20%7B%0D%0A%20%20%20%20rank%20%3D%20same%3B%0D%0A%20%20%20%20101%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20201%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20301%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20302%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20402%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20502%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20602%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20702%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20703%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20803%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20903%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20904%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20905%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20906%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20907%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20908%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20909%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20910%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%201010%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20101%20-%3E%20201%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20201%20-%3E%20301%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20301%20-%3E%20302%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20302%20-%3E%20402%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20402%20-%3E%20502%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20502%20-%3E%20602%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20602%20-%3E%20702%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20702%20-%3E%20703%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20703%20-%3E%20803%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20803%20-%3E%20903%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20903%20-%3E%20904%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20904%20-%3E%20905%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20905%20-%3E%20906%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20906%20-%3E%20907%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20907%20-%3E%20908%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20908%20-%3E%20909%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20909%20-%3E%20910%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20910%20-%3E%201010%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%7D%0D%0A%7D ) 

É possível observar que o caminho é iniciado no 101 (sendo o 0 o separador entre linha e coluna - 1 1) e termina, seguindo as linhas vermelhas no 1010 (original 10 10).

Vale ressaltar que caso seja executado outra vez o mesmo comando com os mesmos valores ou outros valores, existe a possibilidade de o layout do mapa ser completamente diferente do apresentado na figura acima, uma vez que ele é gerado randomicamente para só depois ser localizado o menor caminho conforme exemplo abaixo onde foi utilizado o mesmo comando (lua54 .\main.lua) porém obtendo resultados diferentes (lua54 .\main.lua 10 10 false false true 1):

[link](https://dreampuf.github.io/GraphvizOnline/#digraph%20G%20%7B%0D%0Agraph%20%5B%0D%0Alayout%20%3D%20neato%0D%0Alabel%20%3D%20%22DIJKSTRA%22%0D%0Afontsize%3D%20%2240pt%22%0D%0A%5D%0D%0A%20%20101%3B%0D%0A%20%20101%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20101%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%3B%0D%0A%20%20102%20-%3E%20101%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%20-%3E%20202%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%3B%0D%0A%20%20104%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20106%3B%0D%0A%20%20106%20-%3E%20107%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20106%20-%3E%20206%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20107%3B%0D%0A%20%20107%20-%3E%20106%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20107%20-%3E%20108%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20108%3B%0D%0A%20%20108%20-%3E%20107%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20110%3B%0D%0A%20%20201%3B%0D%0A%20%20201%20-%3E%20101%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20201%20-%3E%20202%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20201%20-%3E%20301%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%3B%0D%0A%20%20202%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%3B%0D%0A%20%20203%20-%3E%20202%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%3B%0D%0A%20%20204%20-%3E%20104%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%3B%0D%0A%20%20205%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%20-%3E%20206%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20205%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20206%3B%0D%0A%20%20206%20-%3E%20106%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20206%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20206%20-%3E%20306%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20209%3B%0D%0A%20%20301%3B%0D%0A%20%20301%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20301%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20301%20-%3E%20401%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%3B%0D%0A%20%20302%20-%3E%20202%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%20-%3E%20301%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%3B%0D%0A%20%20303%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20304%3B%0D%0A%20%20304%20-%3E%20204%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20304%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20304%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20304%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%3B%0D%0A%20%20305%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20306%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20306%3B%0D%0A%20%20306%20-%3E%20206%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20306%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20306%20-%3E%20406%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20308%3B%0D%0A%20%20308%20-%3E%20408%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20401%3B%0D%0A%20%20401%20-%3E%20301%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20401%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20401%20-%3E%20501%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%3B%0D%0A%20%20402%20-%3E%20302%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%20-%3E%20401%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20402%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%3B%0D%0A%20%20403%20-%3E%20303%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20403%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%3B%0D%0A%20%20404%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%3B%0D%0A%20%20405%20-%3E%20305%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%20-%3E%20406%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20405%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20406%3B%0D%0A%20%20406%20-%3E%20306%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20406%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20406%20-%3E%20407%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20406%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20407%3B%0D%0A%20%20407%20-%3E%20406%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20407%20-%3E%20408%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20407%20-%3E%20507%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20408%3B%0D%0A%20%20408%20-%3E%20308%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20408%20-%3E%20407%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20408%20-%3E%20409%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20408%20-%3E%20508%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20409%3B%0D%0A%20%20409%20-%3E%20408%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20409%20-%3E%20410%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20410%3B%0D%0A%20%20410%20-%3E%20409%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20410%20-%3E%20510%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20501%3B%0D%0A%20%20501%20-%3E%20401%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20501%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%3B%0D%0A%20%20502%20-%3E%20402%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%20-%3E%20501%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20502%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%3B%0D%0A%20%20503%20-%3E%20403%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%20-%3E%20603%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%3B%0D%0A%20%20504%20-%3E%20404%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20504%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%3B%0D%0A%20%20505%20-%3E%20405%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%20-%3E%20504%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20505%20-%3E%20605%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%3B%0D%0A%20%20506%20-%3E%20406%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%20-%3E%20507%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%20-%3E%20606%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20507%3B%0D%0A%20%20507%20-%3E%20407%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20507%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20507%20-%3E%20508%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20508%3B%0D%0A%20%20508%20-%3E%20408%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20508%20-%3E%20507%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20508%20-%3E%20608%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20510%3B%0D%0A%20%20510%20-%3E%20410%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20510%20-%3E%20610%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20602%3B%0D%0A%20%20602%20-%3E%20502%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20602%20-%3E%20603%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20602%20-%3E%20702%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20603%3B%0D%0A%20%20603%20-%3E%20503%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20603%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20603%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20605%3B%0D%0A%20%20605%20-%3E%20505%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20605%20-%3E%20606%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20605%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20606%3B%0D%0A%20%20606%20-%3E%20506%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20606%20-%3E%20605%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20608%3B%0D%0A%20%20608%20-%3E%20508%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20608%20-%3E%20609%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20608%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20609%3B%0D%0A%20%20609%20-%3E%20608%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20609%20-%3E%20610%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20610%3B%0D%0A%20%20610%20-%3E%20510%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20610%20-%3E%20609%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20610%20-%3E%20710%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20702%3B%0D%0A%20%20702%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20702%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20702%20-%3E%20802%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%3B%0D%0A%20%20703%20-%3E%20603%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%20-%3E%20702%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%20-%3E%20704%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20703%20-%3E%20803%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20704%3B%0D%0A%20%20704%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20704%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%3B%0D%0A%20%20705%20-%3E%20605%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%20-%3E%20704%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%20-%3E%20805%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%3B%0D%0A%20%20707%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%20-%3E%20807%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%3B%0D%0A%20%20708%20-%3E%20608%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%20-%3E%20707%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%20-%3E%20808%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20710%3B%0D%0A%20%20710%20-%3E%20610%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20801%3B%0D%0A%20%20801%20-%3E%20802%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20801%20-%3E%20901%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20802%3B%0D%0A%20%20802%20-%3E%20702%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20802%20-%3E%20801%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20802%20-%3E%20803%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20803%3B%0D%0A%20%20803%20-%3E%20703%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20803%20-%3E%20802%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20803%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%3B%0D%0A%20%20805%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20807%3B%0D%0A%20%20807%20-%3E%20707%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20807%20-%3E%20808%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20808%3B%0D%0A%20%20808%20-%3E%20708%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20808%20-%3E%20807%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20808%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20901%3B%0D%0A%20%20901%20-%3E%20801%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%3B%0D%0A%20%20903%20-%3E%20803%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%3B%0D%0A%20%20904%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20904%20-%3E%201004%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%3B%0D%0A%20%20905%20-%3E%20805%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%20-%3E%20906%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%20-%3E%201005%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20906%3B%0D%0A%20%20906%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20906%20-%3E%201006%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%3B%0D%0A%20%20908%20-%3E%20808%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%20-%3E%20909%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20908%20-%3E%201008%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20909%3B%0D%0A%20%20909%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20909%20-%3E%20910%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20910%3B%0D%0A%20%20910%20-%3E%20909%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20910%20-%3E%201010%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201002%3B%0D%0A%20%201002%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%3B%0D%0A%20%201003%20-%3E%20903%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%20-%3E%201002%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%20-%3E%201004%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201004%3B%0D%0A%20%201004%20-%3E%20904%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201004%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201004%20-%3E%201005%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201005%3B%0D%0A%20%201005%20-%3E%20905%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201005%20-%3E%201004%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201005%20-%3E%201006%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%3B%0D%0A%20%201006%20-%3E%20906%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%20-%3E%201005%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%20-%3E%201007%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201007%3B%0D%0A%20%201007%20-%3E%201006%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201007%20-%3E%201008%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201008%3B%0D%0A%20%201008%20-%3E%20908%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201008%20-%3E%201007%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201010%3B%0D%0A%20%201010%20-%3E%20910%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20subgraph%20path%20%7B%0D%0A%20%20%20%20rank%20%3D%20same%3B%0D%0A%20%20%20%20101%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20201%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20301%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20401%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20402%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20403%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20404%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20405%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20406%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20407%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20408%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20508%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20608%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20708%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20808%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20908%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20909%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20910%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%201010%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20101%20-%3E%20201%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20201%20-%3E%20301%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20301%20-%3E%20401%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20401%20-%3E%20402%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20402%20-%3E%20403%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20403%20-%3E%20404%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20404%20-%3E%20405%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20405%20-%3E%20406%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20406%20-%3E%20407%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20407%20-%3E%20408%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20408%20-%3E%20508%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20508%20-%3E%20608%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20608%20-%3E%20708%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20708%20-%3E%20808%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20808%20-%3E%20908%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20908%20-%3E%20909%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20909%20-%3E%20910%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20910%20-%3E%201010%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%7D%0D%0A%7D )


## :memo: Entendendo os Resultados Gerados
Depois de ver os caminhos, é interessante observar o arquivo gerado execution_data_xxxxxx.csv, nele estão os dados medidos na execução dos testes gerados.

Na primeira coluna está informando qual é o teste, na segunda e terceira coluna está informando o tempo de execução (em microssegundos) do algoritmo de Dijkstra e aStarManhattan.

Quarta e Quinta coluna estão sendo informados os preços dos caminhos encontrados e na sexta e sétima colunas as quantidade de arestas percorridas entre o caminho inicial e final.

Caso queira uma explicação mais visual dos dados obtidos, foi implementado uma função que pega esses valores e gera um gráfico para ser visualizado os resultados.

Para isso execute o comando no seu terminal (no diretório do projeto):

```bash

python '.\export graphics.py'

```
Esse comando gerará 3 arquivos chamados execution_data_xxxxx_num_arestas_barras.svg, execution_data_xxxx_peso_caminho_barras.svg e  execution_data_xxxx_peso_caminho_barras.svg contendo os gráficos dos testes executados tornando mais visual e fácil a compreensão de qual algoritmo obteve o melhor desempenho (menor tempo de processamento / caminho com o menor peso / caminho com a menor quantidade de arestras).

(OBS: Se estiver visualizando seus dados no VSCode, instale a extensão SVG Preview para uma melhor experiência)
