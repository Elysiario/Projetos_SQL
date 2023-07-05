#!/usr/bin/env python
# coding: utf-8

# ## Demonstração Prática 4 - Criação de Pipeline de Extração, Limpeza, Transformação e Enriquecimento de Dados  Versão 1

# In[ ]:


#Imports
import sqlite3
import csv


# In[ ]:


# Cria um novo banco de dados
conn = sqlite3.connect('dsadb.db')


# In[ ]:


#Cria uma tabela para armazenar os dados de produção de alimentos
conn.execute('''CREATE TABLE producao (
produto TEXT, quantidade INTEGER, preco_medio REAL, receita_total REAL)''')


# In[ ]:


#Grava e fecha a conexão

conn.commit()
conn.close()


# In[ ]:


#Abre arquivo csv com os dados de produção de alimentos 
with open('producao_alimentos.csv', 'r') as file:
    #Cria um leitor de csv para ler o arquivo
    reader = csv.reader(file)
    #Conecta ao banco de dados
    conn = sqlite3.connect('dsabd.db')
    #pula a primeira linha, que contém os cabeçalhos das colunas 
    next(reader)
    #Insere cada linha do arquivo na tabela de banco de dados
    for row in reader:
        conn.execute('INSERT INTO producao (produto, quantidade, preco_medio, receita_total) VALUES (?,?,?,?)', row)
                     
    conn.commit()
    conn.close
print("Job Concluído com Sucesso")


# In[ ]:




