import glob
import pandas as pd
import matplotlib.pyplot as plt

# Encontrar o arquivo .csv no diretório atual
file_list = glob.glob('*.csv')

if len(file_list) == 0:
    print("Nenhum arquivo CSV encontrado no diretório atual.")
    exit()

file_path = file_list[0]  # Seleciona o primeiro arquivo encontrado

# Carregar o arquivo CSV
data = pd.read_csv(file_path)

# Gerar gráfico para o tempo de execução e salvar em SVG
plt.figure(figsize=(10, 6))
plt.plot(data['execution'], data['dijkstra_time'], marker='o', label='Dijkstra')
plt.plot(data['execution'], data['aStarEuclidean_time'], marker='o', label='A* (Euclidean)')
plt.plot(data['execution'], data['aStarManhattan_time'], marker='o', label='A* (Manhattan)')
plt.xlabel('Execução')
plt.ylabel('Tempo de Execução')
plt.title('Tempo de Execução dos Algoritmos')
plt.legend()
plt.grid(True)
plt.savefig('tempo_execucao.svg', format='svg')
plt.show()

# Gerar gráfico para o peso do caminho e salvar em SVG
plt.figure(figsize=(10, 6))
plt.plot(data['execution'], data['dijkstra_weight'], marker='o', label='Dijkstra')
plt.plot(data['execution'], data['aStarEuclidean_weight'], marker='o', label='A* (Euclidean)')
plt.plot(data['execution'], data['aStarManhattan_weight'], marker='o', label='A* (Manhattan)')
plt.xlabel('Execução')
plt.ylabel('Peso do Caminho')
plt.title('Peso do Caminho dos Algoritmos')
plt.legend()
plt.grid(True)
plt.savefig('peso_caminho.svg', format='svg')
plt.show()

# Gerar gráfico para o número de arestas e salvar em SVG
plt.figure(figsize=(10, 6))
plt.plot(data['execution'], data['dijkstra_edges'], marker='o', label='Dijkstra')
plt.plot(data['execution'], data['aStarEuclidean_edges'], marker='o', label='A* (Euclidean)')
plt.plot(data['execution'], data['aStarManhattan_edges'], marker='o', label='A* (Manhattan)')
plt.xlabel('Execução')
plt.ylabel('Número de Arestas')
plt.title('Número de Arestas dos Algoritmos')
plt.legend()
plt.grid(True)
plt.savefig('num_arestas.svg', format='svg')
plt.show()
