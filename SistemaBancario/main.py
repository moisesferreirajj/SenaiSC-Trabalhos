########################################################
###                                                  ###
### SISTEMA BANCARIO PARA INTEGRAÇÃO GERAL EM PYTHON ###
### DESENVOLVIDO POR MOISES JOÃO FERREIRA - 2024     ###
### SISTEMA EM CONSTRUÇÃO AINDA... EM BREVE COMMITS  ###
###                                                  ###
########################################################
from SistemaBancario import *
from Agencia import *

#################### BIBLIOTECA SISTEMA BANCARIO: ####################
print("\nBIBLIOTECA SISTEMA BANCARIO EXEMPLOS:\n")

#CONTAS DO BANCO
conta_lira = ContaCorrente("Lira", "111.222.333.45", "Bradesco", "1120")
conta_maelira = ContaCorrente("Beth", "222.333.444-55", "Santander", "656565")

conta_lira.depositar_dinheiro(10000)
conta_lira.consultar_saldo()
conta_lira.sacar_dinheiro(11001)
conta_lira.transferir(1000, conta_maelira)

#EXIBINDO SALDOS APÓS TUDO
print("\nSaldos após movimentações:")
conta_lira.consultar_saldo()

#HISTÓRICO DE LIRA
print("\nHistórico de Transações de Lira:")
conta_lira.consultar_historico_transacoes()

#HISTÓRICO DA BETH
print("\nHistórico de Transações de Beth:")
conta_maelira.consultar_historico_transacoes()

#CARTÃO DE CRÉDITO
cartao_lira = CartaoCredito("Lira", conta_lira)
print('\nNúmero da conta de Lira:', conta_lira._num_conta)
print("Cartões associados à conta de Lira:")
print(cartao_lira)

#################### BIBLIOTECA AGENCIA: ####################
print("\nBIBLIOTECA AGÊNCIA EXEMPLOS:\n")

#AGENCIA 1
agencia1 = Agencia(22223333, 200000000, 4568)
agencia1.caixa = 1000000
print(agencia1.__dict__)
agencia1.emprestar_dinheiro(10, 11122233344, 0.1)
#Parametro para ver o maninho Lira  
agencia1.adicionar_clientes('Lira', 11122233344, 10000)
print('Clientes da agência: ',agencia1.clientes)

#AGENCIA VIRTUAL:
agencia_virtual = AgenciaVirtual('www.agenciamoises.com.br', 22224444, 1520000000, 1000)
agencia_virtual.verificar_caixa()
print("\nAgência Virtual:")
print(agencia_virtual.__dict__)
agencia_virtual.adicionar_clientes('Lira',111111111111,1000000)
print('Clientes da agência: ',agencia_virtual.clientes)

#PAYPAL AGENCIA VIRTUAL
agencia_virtual.depositar_paypal(20000)
print("Caixa do Paypal: R${},00" .format(agencia_virtual.caixa_paypal))

#AGENCIA COMUM:
agencia_comum = AgenciaComum(33334444, 222000000000)
print("\nAgência Comum:")
print(agencia_comum.__dict__)
agencia_comum.adicionar_clientes('Lira',111111111111,1000000)
print('Clientes da agência: ',agencia_comum.clientes)

#AGENCIA PREMIUM:
agencia_premium = AgenciaPremium(33333333, 30000000000)
print("\nAgência Premium:")
print(agencia_premium.__dict__)
agencia_premium.adicionar_clientes('Lira',111111111111,1000000)
print('Clientes da agência: ',agencia_premium.clientes)

print("\nPROGRAMA ENCERRADO!")