import random
from faker import Faker

faker = Faker("pt_BR")

CONTAS = ["Água", "Luz", "Telefone", "Internet", "Gás"]
NOMES = ["Fabio", "Maria", "Jose", "Pedro", "Lucas", "Tiago", "Andre"]

def gerar_conta():
    return random.choice(CONTAS)

def gerar_nome():
    return random.choice(NOMES)

def gerar_valor():
    inteiro = random.randint(0, 999)
    centavos = random.randint(0, 99)
    return f"{inteiro}.{centavos:02d}"