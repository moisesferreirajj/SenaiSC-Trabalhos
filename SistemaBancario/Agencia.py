########################################################
###                                                  ###
### SISTEMA BANCARIO PARA INTEGRAÇÃO GERAL EM PYTHON ###
### DESENVOLVIDO POR MOISES JOÃO FERREIRA - 2024     ###
### SISTEMA EM CONSTRUÇÃO AINDA... EM BREVE COMMITS  ###
###                                                  ###
########################################################

from random import randint

class Agencia:   
 def __init__(self, telefone, cnpj, numero):
        self.telefone = telefone
        self.cnpj = cnpj
        self.numero = numero
        self.clientes= []
        self.caixa = 0
        self.emprestimos = []
        
 def verificar_caixa(self):
        if self.caixa >= 1000000:
            print('Caixa abaixo do nível recomendado. Caixa Atual: {}' .format(self.caixa))
            print('O valor do caixa está OK. Caixa Atual: {}' .format(self.caixa))
    
 def emprestar_dinheiro(self, valor, cpf, juros):
        if self.caixa>valor:
            self.emprestimos.append((valor, cpf, juros))
            print("Empréstimo efetuado do valor de: R${},00!" .format(valor))
        else:
            print("Empréstimo recusado!")
            
 def adicionar_clientes(self, nome, cpf, patrimonio):
     self.clientes.append((nome, cpf, patrimonio))

class AgenciaVirtual(Agencia):
 def __init__(self, site, telefone, cnpj, numero):
     self.site = site
     super().__init__(telefone, cnpj, numero)
     self.caixa = 1000000
     self.caixa_paypal = 0
     
 def depositar_paypal(self, valor):
     self.caixa -= valor
     self.caixa_paypal += valor  # Correção aqui

 def sacar_paypal(self, valor):
     if self.caixa_paypal >= valor:
      self.caixa_paypal -= valor
      self.caixa += valor
     else:
      print("Saldo do PayPal insuficiente para saque!")
            
class AgenciaComum(Agencia):
 def __init__(self, telefone, cnpj):
     super().__init__(telefone, cnpj, randint(1001,9999))
     self.caixa = 1000000

class AgenciaPremium(Agencia):
 def __init__(self, telefone, cnpj):
     super().__init__(telefone, cnpj, randint(1001,9999))
     self.caixa = 10000000
     
 def adicionar_clientes(self, nome, cpf, patrimonio):
     if patrimonio>1000000:
         super().adicionar_clientes(nome,cpf,patrimonio)
     else:
        print("Cliente '{}' não é qualificado para esta Agência!" .format(nome))
