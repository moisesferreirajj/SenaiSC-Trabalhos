#########################################
#                                       #
# SISTEMA VEICULAR - CALCULO DE IPVA    #
# - MOISES                              #
# - MARK                                #
# - JOÃO BAARTZ                         #
#                                       #
#########################################

#Classe para definir veículo:
class Veiculo:
    def __init__(self, marca, modelo, ano, valor, cilindradas=0, carga=0, portas=0):
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
        self.cilindradas = cilindradas
        self.carga = carga
        self.portas = portas

    def calcular_ipva(self):
        pass

    def imprimir(self):
        return f"{self.marca} {self.modelo} ({self.ano}) | R${self.valor:.2f}"

#Classes dos veículos e definição do IPVA:
class Carro(Veiculo):
    def calcular_ipva(self):
        return self.valor * 0.04

    def imprimir(self):
        return super().imprimir() + f" | Portas: {self.portas}"

class Moto(Veiculo):
    def calcular_ipva(self):
        return self.valor * 0.02

    def imprimir(self):
        return super().imprimir() + f" | Cilindradas: {self.cilindradas}"

class Caminhao(Veiculo):
    def calcular_ipva(self):
        return self.valor * 0.01

    def imprimir(self):
        return super().imprimir() + f" | Carga: {self.carga}"

class SistemaVeicular:
    def __init__(self):
        self.veiculos = []

    #Método para cadastrar veículo:
    def cadastrar_veiculo(self):
        tipo = input("Digite o tipo do veículo (Carro/Moto/Caminhão): ").strip().lower()
        marca = input("Digite a marca do veículo: ")
        modelo = input("Digite o modelo do veículo: ")
        ano = int(input("Digite o ano do veículo: "))
        valor = float(input("Digite o valor do veículo: "))

        if tipo == 'carro':
            portas = input("Digite o número de portas: ")
            veiculo = Carro(marca, modelo, ano, valor, portas=portas)
        elif tipo == 'moto':
            cilindradas = input("Digite o número de cilindradas: ")
            veiculo = Moto(marca, modelo, ano, valor, cilindradas=cilindradas)
        elif tipo == 'caminhao':
            carga = input("Digite a capacidade de carga: ")
            veiculo = Caminhao(marca, modelo, ano, valor, carga=carga)
        else:
            print("Tipo de veículo inválido.")
            return
        
        self.veiculos.append(veiculo)
        print("Veículo cadastrado com sucesso!")

    #Método para consultar veículos cadastrados:
    def consultar_veiculo(self):
        if not self.veiculos:
            print("Nenhum veículo cadastrado.")
            return
        for i in range(len(self.veiculos)):
            veiculo = self.veiculos[i]
            print(f"{i + 1}. {veiculo.imprimir()}")
            
    #Método para calcular o IPVA dos veículos cadastrados:
    def calcular_ipva(self):
        if not self.veiculos:
            print("Nenhum veículo cadastrado.")
            return
        for veiculo in self.veiculos:
            ipva = veiculo.calcular_ipva()
            print(f"IPVA DE: R${ipva:.2f} DO VEÍCULO: [{veiculo.imprimir()}]")

    #Método para o menu:
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
