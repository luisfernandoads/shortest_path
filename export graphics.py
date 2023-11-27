import glob
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

def gerar_grafico_barras(data, file_name, y_data1, y_data2, ylabel, title, legend_labels, save_filename, execution_option):
    ind = np.arange(len(data))
    width = 0.25

    plt.figure(figsize=(10, 6))
    plt.bar(ind, data[y_data1], width, label=legend_labels[0])
    plt.bar(ind + width, data[y_data2], width, label=legend_labels[1])
    plt.xlabel(f"Número da Execução \n \n Opções de execução: {execution_option}")
    plt.ylabel(ylabel)
    plt.title(title)
    plt.xticks(ind + width, data['execution'])
    plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(save_filename, format='svg')
    #plt.show()

file_list = glob.glob('*.csv')

if len(file_list) == 0:
    print("Nenhum arquivo CSV encontrado no diretório atual.")
    exit()

for file_path in file_list:
    file_name = os.path.splitext(file_path)[0]
    data = pd.read_csv(file_path)

    execution_option = data['execution_option'].iloc[0]  # Obtendo a primeira ocorrência de 'execution_option'

    gerar_grafico_barras(data, file_name, 'dijkstra_time', 'aStarManhattan_time', 'Tempo de Execução (ms)',
                         'Tempo de Execução dos Algoritmos \n', ['Dijkstra', 'A* (Manhattan)'],
                         f'{file_name}_tempo_execucao_barras.svg', execution_option)

    gerar_grafico_barras(data, file_name, 'dijkstra_weight', 'aStarManhattan_weight', 'Peso do Caminho',
                         'Peso do Caminho dos Algoritmos \n', ['Dijkstra', 'A* (Manhattan)'],
                         f'{file_name}_peso_caminho_barras.svg', execution_option)

    gerar_grafico_barras(data, file_name, 'dijkstra_edges', 'aStarManhattan_edges', 'Número de Arestas',
                         'Número de Arestas dos Algoritmos \n', ['Dijkstra', 'A* (Manhattan)'],
                         f'{file_name}_num_arestas_barras.svg', execution_option)
