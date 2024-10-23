#########################################
#                                       #
# SISTEMA VEICULAR - CALCULO DE IPVA    #
# - MOISES                              #
# - MARK                                #
# - JOÃO BAARTZ                         #
#                                       #
#########################################

#Class para definir Veículo:
class Veiculo:
    def __init__(self, marca, modelo, ano, valor):
        self._marca = marca
        self._modelo = modelo
        self._ano = ano
        self._valor = valor

    def calcular_ipva(self):
        pass

    def __str__(self):
        return f"{self._marca} {self._modelo} ({self._ano}) - R${self._valor:.2f}"

#Class dos veículos junto da definição de valor do IPVA:
class Carro(Veiculo):
    def calcular_ipva(self):
        return self._valor * 0.04

class Moto(Veiculo):
    def calcular_ipva(self):
        return self._valor * 0.02

class Caminhao(Veiculo):
    def calcular_ipva(self):
        return self._valor * 0.01

class SistemaVeicular:
    def __init__(self):
        self.veiculos = []

#Input das informações do veículo:
    def cadastrar_veiculo(self):
        tipo = input("Digite o tipo do veículo (Carro/Moto/Caminhão): ").strip().lower()
        marca = input("Digite a marca do veículo: ")
        modelo = input("Digite o modelo do veículo: ")
        ano = int(input("Digite o ano do veículo: "))
        valor = float(input("Digite o valor do veículo: "))

        if tipo == 'carro':
            veiculo = Carro(marca, modelo, ano, valor)
        elif tipo == 'moto':
            veiculo = Moto(marca, modelo, ano, valor)
        elif tipo == 'caminhão':
            veiculo = Caminhao(marca, modelo, ano, valor)
        else:
            print("Tipo de veículo inválido.")
            return
        self.veiculos.append(veiculo)
        print("Veículo cadastrado com sucesso!")

#Vizualiza os veículos cadastrados:
    def consultar_veiculo(self):
        if not self.veiculos:
            print("Nenhum veículo cadastrado.")
            return
        for i, veiculo in enumerate(self.veiculos, start=1):
            print(f"{i}. {veiculo}")
            
#Calcula o IPVA dos veiculos cadastrados:
    def calcular_ipva(self):
        if not self.veiculos:
            print("Nenhum veículo cadastrado.")
            return
        for i, veiculo in enumerate(self.veiculos, start=1):
            ipva = veiculo.calcular_ipva()
            print(f"IPVA do veículo {veiculo}: R${ipva:.2f}")

#Menu de escolha:
    def menu(self):
        while True:
            print("\nEscolha uma opção:")
            print("1: Cadastrar Veículo")
            print("2: Consultar Veículo")
            print("3: Calcular IPVA")
            print("4: Sair")

            escolha = input("Digite sua escolha: ")
            if escolha == '1':
                self.cadastrar_veiculo()
            elif escolha == '2':
                self.consultar_veiculo()
            elif escolha == '3':
                self.calcular_ipva()
            elif escolha == '4':
                print("Saindo do sistema.")
                break
            else:
                print("Escolha inválida.")
                
#Executando o sistema:
sistema = SistemaVeicular()
sistema.menu()