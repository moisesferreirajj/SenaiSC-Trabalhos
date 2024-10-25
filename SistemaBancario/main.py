########################################################
###                                                  ###
### SISTEMA BANCARIO PARA INTEGRAÇÃO GERAL EM PYTHON ###
### DESENVOLVIDO POR MOISES JOÃO FERREIRA - 2024     ###
### SISTEMA EM CONSTRUÇÃO AINDA... EM BREVE COMMITS  ###
###                                                  ###
########################################################

from SistemaBancario import ContaCorrente,CartaoCredito

#PROGRAMA
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