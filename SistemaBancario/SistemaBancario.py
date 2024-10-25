########################################################
###                                                  ###
### SISTEMA BANCARIO PARA INTEGRAÇÃO GERAL EM PYTHON ###
### DESENVOLVIDO POR MOISES JOÃO FERREIRA - 2024     ###
### SISTEMA EM CONSTRUÇÃO AINDA... EM BREVE COMMITS  ###
###                                                  ###
########################################################

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
        self._limite = -1000
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
        #ATUALIZA O SALDO
        conta_destino._saldo += valor
        conta_destino._transacoes.append((valor, conta_destino._saldo, ContaCorrente._data_hora(), f'Transferência recebida de {self._nome}'))
        #MENSAGEM QUE CONFIRMA TRANSFERÊNCIA
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