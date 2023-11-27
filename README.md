# CAMINHO MAIS CURTO - SHORTEST PATH

Este projeto foi desenvolvido por:
* ***Luis Fernando Alves da Silva***
* ***Matheus Otero Romano***
* ***Pedro Ramires da Silva Amalfi Costa***

Como requisito parcial de entrega de atividade final da disciplina de Otimização e complexidade de Algoritmos pelo professor Dr. e Coordenador do curso Rodrigo Brandão Mansilha do curso de Mestrado em Engenharia de Software pela Universidade Federal dos Pampas (UNIPAMPA) no ano de 2023.

## SHORTEST PATH
Um caminho mais curto é aquele que, entre dois nós, possui menos arestas caso o custo da viagem ao longo de cada aresta seja o mesmo.

Nesta aplicação, é possível definir o tamanho do mapa (quantidade de linhas e colunas) bem como o ponto inícial e final do seu percurso.

Em cada pedaço do trajeto (arestas) é adicionado de forma aleatória um custo para a travessía por aquele ponto, fazendo com que o Algoritmo tenha de encontrar não só o menor caminho, mas também, o caminho que menos será custoso entre os pontos de início e final.

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

lua54 .\main.lua 10 10 3 4 7 9 3

```

Este comando executa as bibliotecas LUA instaladas e configuradas em seu computador (no caso lua54) em seguida é passado o nome do arquivo principal da aplicação (.\main.lua) e é passado os parâmetros para a criação do mapa com 6 números sendo os dois primeiros pares a quantidade de linhas e colunas que seu mapa possuirá (10 10), seguido da posição da linha e coluna que iniciará seu caminho (3 4), a posição da linha e coluna onde será finalizado seu caminho (7 9) e por último a quantidade de vezes que deseja repetir (no caso 3).


***Saída Gerada pelo comando***

Este comando irá executar a ferramenta 3 vezes e criará uma matriz de 10 linhas por 10 colunas sendo o ponto inicial a posição da linha 3 e coluna 4 e como ponto final a posição da linha 7 e coluna 9, em seguida será gerado o mapa e o Grafo Ponderado onde pode ser observado o custo de cada caminho (arestas), por ultimo um arquivo chamado execution(resto_do_nome).csv será criado com os resultados das execuções para entender como foi encontrado aquele caminho com um menor custo entre todos os caminhos possívels, com uma saida como a de baixo:

(OBS: Esta é uma das 3 respostas gerada pelo comando!)

```bash

Matriz de adjacencia
Tamanho: 10x10      
Inicio: x=3, y=4    
Final: x=7, y=9     


Mapa
0 2 5 0 6 8 0 0 5 4
1 5 2 5 0 5 4 1 0 1
0 4 2 9 7 0 6 2 1 9
5 0 9 9 8 0 9 6 8 8
1 0 5 0 8 6 0 9 2 0
0 1 6 6 0 6 6 1 8 8
0 7 8 0 0 0 5 6 2 8
1 4 5 0 5 4 2 0 6 1
0 0 1 0 4 7 1 3 0 3
3 3 6 0 4 2 7 9 9 3


Grafo ponderado
{
  [102] = {
    [103] = 5,
    [202] = 5,
  },
  [103] = {
    [102] = 2,
    [203] = 2,
  },
  [105] = {
    [106] = 8,
  },
  [106] = {
    [105] = 6,
    [206] = 5,
  },
  [109] = {
    [110] = 4,
  },
  [110] = {
    [109] = 5,
    [210] = 1,
  },
  [201] = {
    [202] = 5,
  },
  [202] = {
    [102] = 2,
    [201] = 1,
    [203] = 2,
    [302] = 4,
  },
  [203] = {
    [103] = 5,
    [202] = 5,
    [204] = 5,
    [303] = 2,
  },
  [204] = {
    [203] = 2,
    [304] = 9,
  },
  [206] = {
    [106] = 8,
    [207] = 4,
  },
  [207] = {
    [206] = 5,
    [208] = 1,
    [307] = 6,
  },
  [208] = {
    [207] = 4,
    [308] = 2,
  },
  [210] = {
    [110] = 4,
    [310] = 9,
  },
  [302] = {
    [202] = 5,
    [303] = 2,
  },
  [303] = {
    [203] = 2,
    [302] = 4,
    [304] = 9,
    [403] = 9,
  },
  [304] = {
    [204] = 5,
    [303] = 2,
    [305] = 7,
    [404] = 9,
  },
  [305] = {
    [304] = 9,
    [405] = 8,
  },
  [307] = {
    [207] = 4,
    [308] = 2,
    [407] = 9,
  },
  [308] = {
    [208] = 1,
    [307] = 6,
    [309] = 1,
    [408] = 6,
  },
  [309] = {
    [308] = 2,
    [310] = 9,
    [409] = 8,
  },
  [310] = {
    [210] = 1,
    [309] = 1,
    [410] = 8,
  },
  [401] = {
    [501] = 1,
  },
  [403] = {
    [303] = 2,
    [404] = 9,
    [503] = 5,
  },
  [404] = {
    [304] = 9,
    [403] = 9,
    [405] = 8,
  },
  [405] = {
    [305] = 7,
    [404] = 9,
    [505] = 8,
  },
  [407] = {
    [307] = 6,
    [408] = 6,
  },
  [408] = {
    [308] = 2,
    [407] = 9,
    [409] = 8,
    [508] = 9,
  },
  [409] = {
    [309] = 1,
    [408] = 6,
    [410] = 8,
    [509] = 2,
  },
  [410] = {
    [310] = 9,
    [409] = 8,
  },
  [501] = {
    [401] = 5,
  },
  [503] = {
    [403] = 9,
    [603] = 6,
  },
  [505] = {
    [405] = 8,
    [506] = 6,
  },
  [506] = {
    [505] = 8,
    [606] = 6,
  },
  [508] = {
    [408] = 6,
    [509] = 2,
    [608] = 1,
  },
  [509] = {
    [409] = 8,
    [508] = 9,
    [609] = 8,
  },
  [602] = {
    [603] = 6,
    [702] = 7,
  },
  [603] = {
    [503] = 5,
    [602] = 1,
    [604] = 6,
    [703] = 8,
  },
  [604] = {
    [603] = 6,
  },
  [606] = {
    [506] = 6,
    [607] = 6,
  },
  [607] = {
    [606] = 6,
    [608] = 1,
    [707] = 5,
  },
  [608] = {
    [508] = 9,
    [607] = 6,
    [609] = 8,
    [708] = 6,
  },
  [609] = {
    [509] = 2,
    [608] = 1,
    [610] = 8,
    [709] = 2,
  },
  [610] = {
    [609] = 8,
    [710] = 8,
  },
  [702] = {
    [602] = 1,
    [703] = 8,
    [802] = 4,
  },
  [703] = {
    [603] = 6,
    [702] = 7,
    [803] = 5,
  },
  [707] = {
    [607] = 6,
    [708] = 6,
    [807] = 2,
  },
  [708] = {
    [608] = 1,
    [707] = 5,
    [709] = 2,
  },
  [709] = {
    [609] = 8,
    [708] = 6,
    [710] = 8,
    [809] = 6,
  },
  [710] = {
    [610] = 8,
    [709] = 2,
    [810] = 1,
  },
  [801] = {
    [802] = 4,
  },
  [802] = {
    [702] = 7,
    [801] = 1,
    [803] = 5,
  },
  [803] = {
    [703] = 8,
    [802] = 4,
    [903] = 1,
  },
  [805] = {
    [806] = 4,
    [905] = 4,
  },
  [806] = {
    [805] = 5,
    [807] = 2,
    [906] = 7,
  },
  [807] = {
    [707] = 5,
    [806] = 4,
    [907] = 1,
  },
  [809] = {
    [709] = 2,
    [810] = 1,
  },
  [810] = {
    [710] = 8,
    [809] = 6,
    [910] = 3,
  },
  [903] = {
    [803] = 5,
    [1003] = 6,
  },
  [905] = {
    [805] = 5,
    [906] = 7,
    [1005] = 4,
  },
  [906] = {
    [806] = 4,
    [905] = 4,
    [907] = 1,
    [1006] = 2,
  },
  [907] = {
    [807] = 2,
    [906] = 7,
    [908] = 3,
    [1007] = 7,
  },
  [908] = {
    [907] = 1,
    [1008] = 9,
  },
  [910] = {
    [810] = 1,
    [1010] = 3,
  },
  [1001] = {
    [1002] = 3,
  },
  [1002] = {
    [1001] = 3,
    [1003] = 6,
  },
  [1003] = {
    [903] = 1,
    [1002] = 3,
  },
  [1005] = {
    [905] = 4,
    [1006] = 2,
  },
  [1006] = {
    [906] = 7,
    [1005] = 4,
    [1007] = 7,
  },
  [1007] = {
    [907] = 1,
    [1006] = 2,
    [1008] = 9,
  },
  [1008] = {
    [908] = 3,
    [1007] = 7,
    [1009] = 9,
  },
  [1009] = {
    [1008] = 9,
    [1010] = 3,
  },
  [1010] = {
    [910] = 3,
    [1009] = 9,
  },
}

```
Finalmente é informado o menor caminho para o Algoritmo de Dijkstra e A* com heuristicas de distancia de Manhattan, conforme abaixo, bem como gerado dois arquivos para uma visualização dos caminhos encontrados.

```bash

Caminho com Dijkstra
{304, 305, 405, 505, 506, 606, 607, 608, 708, 709}
Tempo com Dijkstra 0.001
Arestas do caminho com Dijkstra 10
Peso do caminho com Dijkstra 50


aStarManhattan (A*) com heuristica de distancia de Manhattan
Caminho com aStarManhattan (A*)
{304, 305, 405, 505, 506, 606, 607, 608, 708, 709}
Tempo com aStarManhattan (A*) 0.0
Arestas do caminho com aStarManhattan (A*) 10
Peso do caminho com aStarManhattan (A*) 50


Exportando grafos
Grafo exportado como 2_graph_dijkstra_2023-11-16_14-04-36.dot
Grafo exportado como 2_graph_astar_manhattan_2023-11-16_14-04-36.dot


Convertendo dot para svg com Graphviz
Exportado para svg como 2_graph_dijkstra_2023-11-16_14-04-36.svg
Exportado para svg como 2_graph_astar_manhattan_2023-11-16_14-04-36.svg


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
  101 -> 102 [label="4"];
  101 -> 201 [label="1"];
  102;
  102 -> 101 [label="7"];
  102 -> 103 [label="1"];
  102 -> 202 [label="2"];
  103;
  103 -> 102 [label="4"];
  103 -> 104 [label="4"];
  103 -> 203 [label="1"];
  104;
  104 -> 103 [label="1"];
  104 -> 105 [label="6"];
  104 -> 204 [label="3"];
  105;
  105 -> 104 [label="4"];
  105 -> 106 [label="3"];
  105 -> 205 [label="1"];
  106;
  106 -> 105 [label="6"];
  109;
  109 -> 110 [label="8"];
  109 -> 209 [label="7"];
  110;
  110 -> 109 [label="4"];
  110 -> 210 [label="2"];
  201;
  201 -> 101 [label="7"];
  201 -> 202 [label="2"];
  201 -> 301 [label="9"];
  202;
  202 -> 102 [label="4"];
  202 -> 201 [label="1"];
  202 -> 203 [label="1"];
  202 -> 302 [label="6"];
  203;
  203 -> 103 [label="1"];
  203 -> 202 [label="2"];
  203 -> 204 [label="3"];
  203 -> 303 [label="3"];
  204;
  204 -> 104 [label="4"];
  204 -> 203 [label="1"];
  204 -> 205 [label="1"];
  204 -> 304 [label="7"];
  205;
  205 -> 105 [label="6"];
  205 -> 204 [label="3"];
  205 -> 305 [label="6"];
  207;
  207 -> 307 [label="2"];
  209;
  209 -> 109 [label="4"];
  209 -> 210 [label="2"];
  209 -> 309 [label="9"];
  210;
  210 -> 110 [label="8"];
  210 -> 209 [label="7"];
  301;
  301 -> 201 [label="1"];
  301 -> 302 [label="6"];
  301 -> 401 [label="3"];
  302;
  302 -> 202 [label="2"];
  302 -> 301 [label="9"];
  302 -> 303 [label="3"];
  302 -> 402 [label="2"];
  303;
  303 -> 203 [label="1"];
  303 -> 302 [label="6"];
  303 -> 304 [label="7"];
  303 -> 403 [label="9"];
  304;
  304 -> 204 [label="3"];
  304 -> 303 [label="3"];
  304 -> 305 [label="6"];
  304 -> 404 [label="7"];
  305;
  305 -> 205 [label="1"];
  305 -> 304 [label="7"];
  305 -> 306 [label="2"];
  306;
  306 -> 305 [label="6"];
  306 -> 307 [label="2"];
  306 -> 406 [label="6"];
  307;
  307 -> 207 [label="9"];
  307 -> 306 [label="2"];
  307 -> 308 [label="3"];
  308;
  308 -> 307 [label="2"];
  308 -> 309 [label="9"];
  308 -> 408 [label="3"];
  309;
  309 -> 209 [label="7"];
  309 -> 308 [label="3"];
  309 -> 409 [label="3"];
  401;
  401 -> 301 [label="9"];
  401 -> 402 [label="2"];
  401 -> 501 [label="3"];
  402;
  402 -> 302 [label="6"];
  402 -> 401 [label="3"];
  402 -> 403 [label="9"];
  403;
  403 -> 303 [label="3"];
  403 -> 402 [label="2"];
  403 -> 404 [label="7"];
  403 -> 503 [label="6"];
  404;
  404 -> 304 [label="7"];
  404 -> 403 [label="9"];
  406;
  406 -> 306 [label="2"];
  406 -> 506 [label="7"];
  408;
  408 -> 308 [label="3"];
  408 -> 409 [label="3"];
  408 -> 508 [label="7"];
  409;
  409 -> 309 [label="9"];
  409 -> 408 [label="3"];
  409 -> 509 [label="1"];
  501;
  501 -> 401 [label="3"];
  501 -> 601 [label="9"];
  503;
  503 -> 403 [label="9"];
  503 -> 603 [label="7"];
  505;
  505 -> 506 [label="7"];
  505 -> 605 [label="1"];
  506;
  506 -> 406 [label="6"];
  506 -> 505 [label="4"];
  506 -> 507 [label="5"];
  507;
  507 -> 506 [label="7"];
  507 -> 508 [label="7"];
  507 -> 607 [label="7"];
  508;
  508 -> 408 [label="3"];
  508 -> 507 [label="5"];
  508 -> 509 [label="1"];
  508 -> 608 [label="8"];
  509;
  509 -> 409 [label="3"];
  509 -> 508 [label="7"];
  601;
  601 -> 501 [label="3"];
  601 -> 602 [label="4"];
  601 -> 701 [label="2"];
  602;
  602 -> 601 [label="9"];
  602 -> 603 [label="7"];
  602 -> 702 [label="8"];
  603;
  603 -> 503 [label="6"];
  603 -> 602 [label="4"];
  603 -> 604 [label="8"];
  603 -> 703 [label="9"];
  604;
  604 -> 603 [label="7"];
  604 -> 605 [label="1"];
  604 -> 704 [label="5"];
  605;
  605 -> 505 [label="4"];
  605 -> 604 [label="8"];
  605 -> 705 [label="1"];
  607;
  607 -> 507 [label="5"];
  607 -> 608 [label="8"];
  608;
  608 -> 508 [label="7"];
  608 -> 607 [label="7"];
  608 -> 708 [label="8"];
  610;
  610 -> 710 [label="9"];
  701;
  701 -> 601 [label="9"];
  701 -> 702 [label="8"];
  702;
  702 -> 602 [label="4"];
  702 -> 701 [label="2"];
  702 -> 703 [label="9"];
  703;
  703 -> 603 [label="7"];
  703 -> 702 [label="8"];
  703 -> 704 [label="5"];
  703 -> 803 [label="3"];
  704;
  704 -> 604 [label="8"];
  704 -> 703 [label="9"];
  704 -> 705 [label="1"];
  705;
  705 -> 605 [label="1"];
  705 -> 704 [label="5"];
  705 -> 706 [label="7"];
  705 -> 805 [label="8"];
  706;
  706 -> 705 [label="1"];
  708;
  708 -> 608 [label="8"];
  708 -> 709 [label="3"];
  708 -> 808 [label="2"];
  709;
  709 -> 708 [label="8"];
  709 -> 710 [label="9"];
  709 -> 809 [label="8"];
  710;
  710 -> 610 [label="8"];
  710 -> 709 [label="3"];
  803;
  803 -> 703 [label="9"];
  803 -> 903 [label="3"];
  805;
  805 -> 705 [label="1"];
  805 -> 905 [label="5"];
  807;
  807 -> 808 [label="2"];
  807 -> 907 [label="7"];
  808;
  808 -> 708 [label="8"];
  808 -> 807 [label="6"];
  808 -> 809 [label="8"];
  808 -> 908 [label="2"];
  809;
  809 -> 709 [label="3"];
  809 -> 808 [label="2"];
  809 -> 909 [label="7"];
  901;
  901 -> 902 [label="7"];
  902;
  902 -> 901 [label="5"];
  902 -> 903 [label="3"];
  902 -> 1002 [label="1"];
  903;
  903 -> 803 [label="3"];
  903 -> 902 [label="7"];
  903 -> 1003 [label="1"];
  905;
  905 -> 805 [label="8"];
  907;
  907 -> 807 [label="6"];
  907 -> 908 [label="2"];
  908;
  908 -> 808 [label="2"];
  908 -> 907 [label="7"];
  908 -> 909 [label="7"];
  909;
  909 -> 809 [label="8"];
  909 -> 908 [label="2"];
  909 -> 910 [label="3"];
  909 -> 1009 [label="4"];
  910;
  910 -> 909 [label="7"];
  910 -> 1010 [label="2"];
  1002;
  1002 -> 902 [label="7"];
  1002 -> 1003 [label="1"];
  1003;
  1003 -> 903 [label="3"];
  1003 -> 1002 [label="1"];
  1003 -> 1004 [label="8"];
  1004;
  1004 -> 1003 [label="1"];
  1006;
  1009;
  1009 -> 909 [label="7"];
  1009 -> 1010 [label="2"];
  1010;
  1010 -> 910 [label="3"];
  1010 -> 1009 [label="4"];
  subgraph path {
    rank = same;
    304 [style=filled, fillcolor=yellow];
    305 [style=filled, fillcolor=yellow];
    306 [style=filled, fillcolor=yellow];
    307 [style=filled, fillcolor=yellow];
    308 [style=filled, fillcolor=yellow];
    408 [style=filled, fillcolor=yellow];
    508 [style=filled, fillcolor=yellow];
    608 [style=filled, fillcolor=yellow];
    708 [style=filled, fillcolor=yellow];
    709 [style=filled, fillcolor=yellow];
    304 -> 305 [color=red];
    305 -> 306 [color=red];
    306 -> 307 [color=red];
    307 -> 308 [color=red];
    308 -> 408 [color=red];
    408 -> 508 [color=red];
    508 -> 608 [color=red];
    608 -> 708 [color=red];
    708 -> 709 [color=red];
  }
}

```

E Obterá o caminho como pode ser visto neste [link](https://dreampuf.github.io/GraphvizOnline/#digraph%20G%20%7B%0D%0Agraph%20%5B%0D%0Alayout%20%3D%20neato%0D%0Alabel%20%3D%20%22DIJKSTRA%22%0D%0Afontsize%3D%20%2240pt%22%0D%0A%5D%0D%0A%20%20101%3B%0D%0A%20%20101%20-%3E%20102%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20101%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%3B%0D%0A%20%20102%20-%3E%20101%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20102%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%20-%3E%20202%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20103%3B%0D%0A%20%20103%20-%3E%20102%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20103%20-%3E%20104%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20103%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%3B%0D%0A%20%20104%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%20-%3E%20105%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20104%20-%3E%20204%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20105%3B%0D%0A%20%20105%20-%3E%20104%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20105%20-%3E%20106%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20105%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20106%3B%0D%0A%20%20106%20-%3E%20105%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20109%3B%0D%0A%20%20109%20-%3E%20110%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20109%20-%3E%20209%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20110%3B%0D%0A%20%20110%20-%3E%20109%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20110%20-%3E%20210%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20201%3B%0D%0A%20%20201%20-%3E%20101%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20201%20-%3E%20202%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20201%20-%3E%20301%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20202%3B%0D%0A%20%20202%20-%3E%20102%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20202%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20302%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20203%3B%0D%0A%20%20203%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%20-%3E%20202%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20203%20-%3E%20204%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20203%20-%3E%20303%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20204%3B%0D%0A%20%20204%20-%3E%20104%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20204%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20204%20-%3E%20304%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20205%3B%0D%0A%20%20205%20-%3E%20105%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20205%20-%3E%20204%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20205%20-%3E%20305%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20207%3B%0D%0A%20%20207%20-%3E%20307%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20209%3B%0D%0A%20%20209%20-%3E%20109%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20209%20-%3E%20210%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20209%20-%3E%20309%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20210%3B%0D%0A%20%20210%20-%3E%20110%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20210%20-%3E%20209%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20301%3B%0D%0A%20%20301%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20301%20-%3E%20302%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20301%20-%3E%20401%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20302%3B%0D%0A%20%20302%20-%3E%20202%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20302%20-%3E%20301%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20302%20-%3E%20303%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20302%20-%3E%20402%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20303%3B%0D%0A%20%20303%20-%3E%20203%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20302%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20303%20-%3E%20304%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20303%20-%3E%20403%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20304%3B%0D%0A%20%20304%20-%3E%20204%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20304%20-%3E%20303%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20304%20-%3E%20305%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20304%20-%3E%20404%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20305%3B%0D%0A%20%20305%20-%3E%20205%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20304%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20305%20-%3E%20306%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20306%3B%0D%0A%20%20306%20-%3E%20305%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20306%20-%3E%20307%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20306%20-%3E%20406%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20307%3B%0D%0A%20%20307%20-%3E%20207%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20307%20-%3E%20306%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20307%20-%3E%20308%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20308%3B%0D%0A%20%20308%20-%3E%20307%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20308%20-%3E%20309%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20308%20-%3E%20408%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20309%3B%0D%0A%20%20309%20-%3E%20209%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20309%20-%3E%20308%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20309%20-%3E%20409%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20401%3B%0D%0A%20%20401%20-%3E%20301%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20401%20-%3E%20402%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20401%20-%3E%20501%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20402%3B%0D%0A%20%20402%20-%3E%20302%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20402%20-%3E%20401%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20402%20-%3E%20403%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20403%3B%0D%0A%20%20403%20-%3E%20303%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20403%20-%3E%20402%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20403%20-%3E%20404%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20403%20-%3E%20503%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20404%3B%0D%0A%20%20404%20-%3E%20304%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20404%20-%3E%20403%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20406%3B%0D%0A%20%20406%20-%3E%20306%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20406%20-%3E%20506%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20408%3B%0D%0A%20%20408%20-%3E%20308%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20408%20-%3E%20409%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20408%20-%3E%20508%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20409%3B%0D%0A%20%20409%20-%3E%20309%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20409%20-%3E%20408%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20409%20-%3E%20509%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20501%3B%0D%0A%20%20501%20-%3E%20401%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20501%20-%3E%20601%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20503%3B%0D%0A%20%20503%20-%3E%20403%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20503%20-%3E%20603%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20505%3B%0D%0A%20%20505%20-%3E%20506%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20505%20-%3E%20605%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20506%3B%0D%0A%20%20506%20-%3E%20406%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20506%20-%3E%20505%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20506%20-%3E%20507%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20507%3B%0D%0A%20%20507%20-%3E%20506%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20507%20-%3E%20508%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20507%20-%3E%20607%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20508%3B%0D%0A%20%20508%20-%3E%20408%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20508%20-%3E%20507%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20508%20-%3E%20509%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20508%20-%3E%20608%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20509%3B%0D%0A%20%20509%20-%3E%20409%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20509%20-%3E%20508%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20601%3B%0D%0A%20%20601%20-%3E%20501%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20601%20-%3E%20602%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20601%20-%3E%20701%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20602%3B%0D%0A%20%20602%20-%3E%20601%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20602%20-%3E%20603%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20602%20-%3E%20702%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20603%3B%0D%0A%20%20603%20-%3E%20503%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20603%20-%3E%20602%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20603%20-%3E%20604%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20603%20-%3E%20703%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20604%3B%0D%0A%20%20604%20-%3E%20603%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20604%20-%3E%20605%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20604%20-%3E%20704%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20605%3B%0D%0A%20%20605%20-%3E%20505%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20605%20-%3E%20604%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20605%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20607%3B%0D%0A%20%20607%20-%3E%20507%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20607%20-%3E%20608%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20608%3B%0D%0A%20%20608%20-%3E%20508%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20608%20-%3E%20607%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20608%20-%3E%20708%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20610%3B%0D%0A%20%20610%20-%3E%20710%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20701%3B%0D%0A%20%20701%20-%3E%20601%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20701%20-%3E%20702%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20702%3B%0D%0A%20%20702%20-%3E%20602%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20702%20-%3E%20701%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20702%20-%3E%20703%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20703%3B%0D%0A%20%20703%20-%3E%20603%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20703%20-%3E%20702%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20703%20-%3E%20704%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20703%20-%3E%20803%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20704%3B%0D%0A%20%20704%20-%3E%20604%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20704%20-%3E%20703%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20704%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%3B%0D%0A%20%20705%20-%3E%20605%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%20-%3E%20704%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20705%20-%3E%20706%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20705%20-%3E%20805%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20706%3B%0D%0A%20%20706%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20708%3B%0D%0A%20%20708%20-%3E%20608%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20708%20-%3E%20709%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20708%20-%3E%20808%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20709%3B%0D%0A%20%20709%20-%3E%20708%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20709%20-%3E%20710%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20709%20-%3E%20809%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20710%3B%0D%0A%20%20710%20-%3E%20610%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20710%20-%3E%20709%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20803%3B%0D%0A%20%20803%20-%3E%20703%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20803%20-%3E%20903%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20805%3B%0D%0A%20%20805%20-%3E%20705%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20805%20-%3E%20905%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20807%3B%0D%0A%20%20807%20-%3E%20808%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20807%20-%3E%20907%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20808%3B%0D%0A%20%20808%20-%3E%20708%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20808%20-%3E%20807%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20808%20-%3E%20809%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20808%20-%3E%20908%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20809%3B%0D%0A%20%20809%20-%3E%20709%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20809%20-%3E%20808%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20809%20-%3E%20909%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20901%3B%0D%0A%20%20901%20-%3E%20902%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20902%3B%0D%0A%20%20902%20-%3E%20901%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20902%20-%3E%20903%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20902%20-%3E%201002%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20903%3B%0D%0A%20%20903%20-%3E%20803%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20903%20-%3E%20902%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20903%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20905%3B%0D%0A%20%20905%20-%3E%20805%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20907%3B%0D%0A%20%20907%20-%3E%20807%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20907%20-%3E%20908%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20908%3B%0D%0A%20%20908%20-%3E%20808%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20908%20-%3E%20907%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20908%20-%3E%20909%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20909%3B%0D%0A%20%20909%20-%3E%20809%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20909%20-%3E%20908%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20909%20-%3E%20910%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20909%20-%3E%201009%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20910%3B%0D%0A%20%20910%20-%3E%20909%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20910%20-%3E%201010%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%201002%3B%0D%0A%20%201002%20-%3E%20902%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%201002%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%3B%0D%0A%20%201003%20-%3E%20903%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%201003%20-%3E%201002%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201003%20-%3E%201004%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%201004%3B%0D%0A%20%201004%20-%3E%201003%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%201006%3B%0D%0A%20%201009%3B%0D%0A%20%201009%20-%3E%20909%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%201009%20-%3E%201010%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%201010%3B%0D%0A%20%201010%20-%3E%20910%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%201010%20-%3E%201009%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20subgraph%20path%20%7B%0D%0A%20%20%20%20rank%20%3D%20same%3B%0D%0A%20%20%20%20304%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20305%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20306%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20307%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20308%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20408%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20508%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20608%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20708%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20709%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20304%20-%3E%20305%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20305%20-%3E%20306%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20306%20-%3E%20307%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20307%20-%3E%20308%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20308%20-%3E%20408%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20408%20-%3E%20508%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20508%20-%3E%20608%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20608%20-%3E%20708%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20708%20-%3E%20709%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%7D%0D%0A%7D ) 

É possível observar que o caminho é iniciado no 304 (sendo o 0 o separador entre linha e coluna - 3 4) e termina, seguindo as linhas vermelhas no 709 (original 7 9).

Vale ressaltar que caso seja executado outra vez o mesmo comando com os mesmos valores ou outros valores, existe a possibilidade de o layout do mapa ser completamente diferente do apresentado na figura acima, uma vez que ele é gerado randomicamente para só depois ser localizado o menor caminho conforme exemplo abaixo onde foi utilizado o mesmo comando (lua54 .\main.lua) porém com valores iniciais, finais e quantidade de linhas e colunas diferentes (lua54 .\main.lua 8 7 1 3 7 6 1):

[link](https://dreampuf.github.io/GraphvizOnline/#digraph%20G%20%7B%0D%0Agraph%20%5B%0D%0Alayout%20%3D%20neato%0D%0Alabel%20%3D%20%22DIJKSTRA%22%0D%0Afontsize%3D%20%2240pt%22%0D%0A%5D%0D%0A%20%20101%3B%0D%0A%20%20101%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20101%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%3B%0D%0A%20%20102%20-%3E%20101%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20102%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20102%20-%3E%20202%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20103%3B%0D%0A%20%20103%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20103%20-%3E%20104%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20103%20-%3E%20203%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20104%3B%0D%0A%20%20104%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20104%20-%3E%20105%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20105%3B%0D%0A%20%20105%20-%3E%20104%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20105%20-%3E%20106%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20105%20-%3E%20205%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20106%3B%0D%0A%20%20106%20-%3E%20105%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20106%20-%3E%20107%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20107%3B%0D%0A%20%20107%20-%3E%20106%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20107%20-%3E%20207%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20201%3B%0D%0A%20%20201%20-%3E%20101%20%5Blabel%3D%229%22%5D%3B%0D%0A%20%20201%20-%3E%20202%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20202%3B%0D%0A%20%20202%20-%3E%20102%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20201%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20202%20-%3E%20203%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20202%20-%3E%20302%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20203%3B%0D%0A%20%20203%20-%3E%20103%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20203%20-%3E%20202%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20203%20-%3E%20303%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20205%3B%0D%0A%20%20205%20-%3E%20105%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20205%20-%3E%20305%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20207%3B%0D%0A%20%20207%20-%3E%20107%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20302%3B%0D%0A%20%20302%20-%3E%20202%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20302%20-%3E%20303%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20303%3B%0D%0A%20%20303%20-%3E%20203%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20303%20-%3E%20302%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20303%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20303%20-%3E%20403%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20304%3B%0D%0A%20%20304%20-%3E%20303%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20304%20-%3E%20305%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20304%20-%3E%20404%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20305%3B%0D%0A%20%20305%20-%3E%20205%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20305%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20305%20-%3E%20306%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20305%20-%3E%20405%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20306%3B%0D%0A%20%20306%20-%3E%20305%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20306%20-%3E%20406%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20401%3B%0D%0A%20%20401%20-%3E%20501%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20403%3B%0D%0A%20%20403%20-%3E%20303%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20403%20-%3E%20404%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20403%20-%3E%20503%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20404%3B%0D%0A%20%20404%20-%3E%20304%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20404%20-%3E%20403%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20404%20-%3E%20405%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20405%3B%0D%0A%20%20405%20-%3E%20305%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20405%20-%3E%20404%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20405%20-%3E%20406%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20405%20-%3E%20505%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20406%3B%0D%0A%20%20406%20-%3E%20306%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20406%20-%3E%20405%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20406%20-%3E%20407%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20406%20-%3E%20506%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20407%3B%0D%0A%20%20407%20-%3E%20406%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20501%3B%0D%0A%20%20501%20-%3E%20401%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20501%20-%3E%20502%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20501%20-%3E%20601%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20502%3B%0D%0A%20%20502%20-%3E%20501%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20502%20-%3E%20503%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20502%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20503%3B%0D%0A%20%20503%20-%3E%20403%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20503%20-%3E%20502%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20503%20-%3E%20603%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20505%3B%0D%0A%20%20505%20-%3E%20405%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20505%20-%3E%20506%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20505%20-%3E%20605%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20506%3B%0D%0A%20%20506%20-%3E%20406%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20506%20-%3E%20505%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20506%20-%3E%20606%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20601%3B%0D%0A%20%20601%20-%3E%20501%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20601%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20601%20-%3E%20701%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20602%3B%0D%0A%20%20602%20-%3E%20502%20%5Blabel%3D%223%22%5D%3B%0D%0A%20%20602%20-%3E%20601%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20602%20-%3E%20603%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20602%20-%3E%20702%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20603%3B%0D%0A%20%20603%20-%3E%20503%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20603%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20603%20-%3E%20703%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20605%3B%0D%0A%20%20605%20-%3E%20505%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20605%20-%3E%20606%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20605%20-%3E%20705%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20606%3B%0D%0A%20%20606%20-%3E%20506%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20606%20-%3E%20605%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20606%20-%3E%20607%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20606%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20607%3B%0D%0A%20%20607%20-%3E%20606%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20607%20-%3E%20707%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20701%3B%0D%0A%20%20701%20-%3E%20601%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20701%20-%3E%20702%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20701%20-%3E%20801%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20702%3B%0D%0A%20%20702%20-%3E%20602%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20702%20-%3E%20701%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20702%20-%3E%20703%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20702%20-%3E%20802%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20703%3B%0D%0A%20%20703%20-%3E%20603%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20703%20-%3E%20702%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20703%20-%3E%20803%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20705%3B%0D%0A%20%20705%20-%3E%20605%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20705%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20705%20-%3E%20805%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20706%3B%0D%0A%20%20706%20-%3E%20606%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20706%20-%3E%20705%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20706%20-%3E%20707%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20707%3B%0D%0A%20%20707%20-%3E%20607%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20707%20-%3E%20706%20%5Blabel%3D%221%22%5D%3B%0D%0A%20%20801%3B%0D%0A%20%20801%20-%3E%20701%20%5Blabel%3D%225%22%5D%3B%0D%0A%20%20801%20-%3E%20802%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20802%3B%0D%0A%20%20802%20-%3E%20702%20%5Blabel%3D%224%22%5D%3B%0D%0A%20%20802%20-%3E%20801%20%5Blabel%3D%222%22%5D%3B%0D%0A%20%20802%20-%3E%20803%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20803%3B%0D%0A%20%20803%20-%3E%20703%20%5Blabel%3D%228%22%5D%3B%0D%0A%20%20803%20-%3E%20802%20%5Blabel%3D%227%22%5D%3B%0D%0A%20%20805%3B%0D%0A%20%20805%20-%3E%20705%20%5Blabel%3D%226%22%5D%3B%0D%0A%20%20subgraph%20path%20%7B%0D%0A%20%20%20%20rank%20%3D%20same%3B%0D%0A%20%20%20%20103%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20203%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20303%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20304%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20404%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20405%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20406%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20506%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20606%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20706%20%5Bstyle%3Dfilled%2C%20fillcolor%3Dyellow%5D%3B%0D%0A%20%20%20%20103%20-%3E%20203%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20203%20-%3E%20303%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20303%20-%3E%20304%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20304%20-%3E%20404%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20404%20-%3E%20405%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20405%20-%3E%20406%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20406%20-%3E%20506%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20506%20-%3E%20606%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%20%20606%20-%3E%20706%20%5Bcolor%3Dred%5D%3B%0D%0A%20%20%7D%0D%0A%7D )


## :memo: Entendendo os Resultados Gerados
Depois de ver os caminhos, é interessante observar o arquivo gerado execution_data_xxxxxx.csv, nele estão os dados medidos na execução dos testes gerados.

Na primeira coluna está informando qual é o teste, na segunda, terceira e quarta coluna está informando o tempo de execução (em microssegundos) do algoritmo de Dijkstra, e aStarManhattan.

Quinta, sexta e Sétima coluna estão sendo informados os preços dos caminhos encontrados e na oitava, nona e décima colunas as quantidade de arestas percorridas entre o caminho inicial e final.

Caso queira uma explicação mais visual dos dados obtidos, foi implementado uma função que pega esses valores e gera um gráfico para ser visualizado os resultados.

Para isso execute o comando no seu terminal (no diretório do projeto):

```bash

python '.\export graphics.py'

```
Esse comando gerará 3 arquivos chamados execution_data_xxxxx_num_arestas_barras.svg, execution_data_xxxx_peso_caminho_barras.svg e  execution_data_xxxx_peso_caminho_barras.svg contendo os gráficos dos testes executados tornando mais visual e fácil a compreensão de qual algoritmo obteve o melhor desempenho (menor tempo de processamento / caminho com o menor peso / caminho com a menor quantidade de arestras).

(OBS: Se estiver visualizando seus dados no VSCode, instale a extensão SVG Preview para uma melhor experiência)
