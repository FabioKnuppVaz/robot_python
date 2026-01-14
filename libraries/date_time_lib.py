import datetime

def mes_atual():
    meses = {
        1: "Janeiro",
        2: "Fevereiro",
        3: "Março",
        4: "Abril",
        5: "Maio",
        6: "Junho",
        7: "Julho",
        8: "Agosto",
        9: "Setembro",
        10: "Outubro",
        11: "Novembro",
        12: "Dezembro"
    }
    mes_numero = datetime.date.today().month
    return meses[mes_numero]

def data_atual():
    return datetime.date.today().strftime("%d/%m/%Y")

def ano_atual():
    return datetime.date.today().year