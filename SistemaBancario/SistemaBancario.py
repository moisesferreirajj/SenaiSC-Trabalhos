########################################################
###                                                  ###
### SISTEMA BANCARIO PARA INTEGRAÇÃO GERAL EM PYTHON ###
###
###
###
##############################

from datetime import datetime
import pytz
from random import randint

class ContaCorrente:
    @staticmethod
    def _data_hora():
        """Retorna a data e hora atual no fuso horário de Brasília."""
        fuso_BR = pytz.timezone('Brazil/East')
        horario_BR = datetime.now(fuso_BR)
        return horario_BR.strftime('%d/%m/%Y %H:%M:%S')

    def __init__(self, nome, cpf, agencia, num_conta):
        """Inicializa uma nova conta corrente."""        
        self._nome = nome
        self._cpf = cpf
        self._saldo = 0
        self._limite = -1000  # Limite padrão
        self._agencia = agencia
        self._num_conta = num_conta
        self._transacoes = []
        self._cartoes = []

    def consultar_saldo(self):
        """Exibe o saldo atual da conta."""        
        print('O saldo atual da conta de {} é de: R${:,.2f}'.format(self._nome, self._saldo))

    def depositar_dinheiro(self, valor):
        """Deposita um valor na conta."""        
        self._saldo += valor
        self._transacoes.append((valor, self._saldo, ContaCorrente._data_hora(), 'Depósito'))

    def limite_conta(self):
        """Retorna o limite da conta."""        
        return self._limite

    def sacar_dinheiro(self, valor):
        """Saca um valor da conta."""        
        if self._saldo - valor < self._limite:
            print('A conta de {} tentou sacar o valor de: R${:,.2f} '.format(self._nome, valor))
            print('A conta de {} não tem saldo suficiente para sacar este valor!\n'.format(self._nome))
            self.consultar_saldo()
        else:
            self._saldo -= valor
            self._transacoes.append((-valor, self._saldo, ContaCorrente._data_hora(), 'Saque'))

    def consultar_historico_transacoes(self):
        """Exibe o histórico de transações da conta."""        
        for transacao in self._transacoes:
            print(transacao)

    def transferir(self, valor, conta_destino):
        """Realiza a transferência de um valor para outra conta."""        
        if self._saldo < valor:
            print("Saldo insuficiente para a transferência.")
            return
        self._saldo -= valor
        self._transacoes.append((-valor, self._saldo, ContaCorrente._data_hora(), f'Transferência para {conta_destino._nome}'))
        
        # Atualiza o saldo da conta de destino e registra a transação
        conta_destino._saldo += valor
        conta_destino._transacoes.append((valor, conta_destino._saldo, ContaCorrente._data_hora(), f'Transferência recebida de {self._nome}'))
        
        # Mensagem de confirmação da transferência
        print(f'Transferência efetuada no valor de: R${valor:.2f} para conta de {conta_destino._nome}')

class CartaoCredito:
    @staticmethod
    def _data_hora():
        """Retorna a data e hora atual no fuso horário de Brasília."""        
        fuso_BR = pytz.timezone('Brazil/East')
        horario_BR = datetime.now(fuso_BR)
        return horario_BR

    def __init__(self, titular, conta_corrente):
        """Inicializa um cartão de crédito."""        
        self.numero = randint(1000000000000000, 9999999999999999)
        self.titular = titular
        self.validade = ('{}/{}'.format(CartaoCredito._data_hora().month, CartaoCredito._data_hora().year + 4))
        self.cod_seguranca = '{}{}{}'.format(randint(0, 9), randint(0, 9), randint(0, 9))
        self.limite = 1000
        self.conta_corrente = conta_corrente
        conta_corrente._cartoes.append(self)

    def __str__(self):
        return (f'({self.numero}, {self.titular}, {self.validade}, {self.limite:.2f})')

# Criação das contas
conta_lira = ContaCorrente("Lira", "111.222.333.45", "Bradesco", "1120")
conta_maelira = ContaCorrente("Beth", "222.333.444-55", "Santander", "656565")

# Operações na conta de Lira
conta_lira.depositar_dinheiro(10000)  # Lira deposita 10.000
conta_lira.consultar_saldo()  # Consulta o saldo

# Tentativa de saque
conta_lira.sacar_dinheiro(11001)  # Tentativa de saque acima do saldo

# Transferência de 1.000 de Lira para Beth
conta_lira.transferir(1000, conta_maelira)

# Exibindo saldos após a transferência
print("\nSaldos após movimentações:")
conta_lira.consultar_saldo()  # Saldo de Lira

# Consultando histórico de transações
print("\nHistórico de Transações de Lira:")
conta_lira.consultar_historico_transacoes()

print("\nHistórico de Transações de Beth:")
conta_maelira.consultar_historico_transacoes()

# Cartão de crédito
cartao_lira = CartaoCredito("Lira", conta_lira)

# Acesso correto ao atributo _cartoes
# Cartão de crédito
cartao_lira = CartaoCredito("Lira", conta_lira)

# Acesso correto ao atributo _cartoes
print('\nNúmero da conta de Lira:', conta_lira._num_conta)
print("Cartões associados à conta de Lira:")
#Exibindo informações do cartão
print(cartao_lira)
