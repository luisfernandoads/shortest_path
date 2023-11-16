import glob
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

# Encontrar o arquivo .csv no diretório atual
file_list = glob.glob('*.csv')

if len(file_list) == 0:
    print("Nenhum arquivo CSV encontrado no diretório atual.")
    exit()

file_path = file_list[0]  # Seleciona o primeiro arquivo encontrado
file_name = os.path.splitext(file_path)[0]  # Obtém o nome do arquivo sem a extensão

# Carregar o arquivo CSV
data = pd.read_csv(file_path)

# Criar um array de índices para as barras
ind = np.arange(len(data))

# Configurações do gráfico
width = 0.25

# Gerar gráfico para o tempo de execução e salvar em SVG
plt.figure(figsize=(10, 6))
plt.bar(ind, data['dijkstra_time'], width, label='Dijkstra')
plt.bar(ind + width, data['aStarEuclidean_time'], width, label='A* (Euclidean)')
plt.bar(ind + 2 * width, data['aStarManhattan_time'], width, label='A* (Manhattan)')
plt.xlabel('Execução')
plt.ylabel('Tempo de Execução')
plt.title('Tempo de Execução dos Algoritmos')
plt.xticks(ind + width, data['execution'])
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(f'{file_name}_tempo_execucao_barras.svg', format='svg')
plt.show()

# Gerar gráfico para o peso do caminho e salvar em SVG
plt.figure(figsize=(10, 6))
plt.bar(ind, data['dijkstra_weight'], width, label='Dijkstra')
plt.bar(ind + width, data['aStarEuclidean_weight'], width, label='A* (Euclidean)')
plt.bar(ind + 2 * width, data['aStarManhattan_weight'], width, label='A* (Manhattan)')
plt.xlabel('Execução')
plt.ylabel('Peso do Caminho')
plt.title('Peso do Caminho dos Algoritmos')
plt.xticks(ind + width, data['execution'])
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(f'{file_name}_peso_caminho_barras.svg', format='svg')
plt.show()

# Gerar gráfico para o número de arestas e salvar em SVG
plt.figure(figsize=(10, 6))
plt.bar(ind, data['dijkstra_edges'], width, label='Dijkstra')
plt.bar(ind + width, data['aStarEuclidean_edges'], width, label='A* (Euclidean)')
plt.bar(ind + 2 * width, data['aStarManhattan_edges'], width, label='A* (Manhattan)')
plt.xlabel('Execução')
plt.ylabel('Número de Arestas')
plt.title('Número de Arestas dos Algoritmos')
plt.xticks(ind + width, data['execution'])
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(f'{file_name}_num_arestas_barras.svg', format='svg')
plt.show()
