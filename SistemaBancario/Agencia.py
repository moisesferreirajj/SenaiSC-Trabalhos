class Agencia:   
 def __init__(self, telefone, cnpj, numero):
        self.telefone = telefone
        self.cnpj = cnpj
        self.numero = numero
        self.clientes= []
        self.caixa = 0
        self.emprestimos = []
        
 def verificar_caixa(self):
        if self.caixa < 1000000:
            print('Caixa abaixo do nível recomendado. Caixa Atual: {}' .format(self.caixa))
        else:
            print('O valor do caixa está OK. Caixa Atual: {}' .format(self.caixa))
    
 def emprestar_dinheiro(self, valor, cpf, juros):
        if self.caixa>valor:
            self.emprestimos.append((valor, cpf, juros))
            print("Empréstimo efetuado!")
        else:
            print("Empréstimo recusado!")

agencia1 = Agencia(22223333, 200000000, 4568)
agencia1.caixa = 1000000
print(agencia1.__dict__)
agencia1.verificar_caixa()
agencia1.emprestar_dinheiro(10, 11122233344, 0.1)