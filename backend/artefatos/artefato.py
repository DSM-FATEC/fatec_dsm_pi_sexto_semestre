# Importando as bibliotecas necessárias
import time

import machine
import urequests
import network
from umqtt.simple import MQTTClient


# Dados do artefato
ARTEFATO_ID = 1

# Dados de conexão do wifi
WIFI_SSID = 'WIFI-GUSTAV0'
WIFI_SENHA = '6034860348'

# Dados do access point
ACCESS_POINT_SSID = f'guia_me_artefato_{ARTEFATO_ID}'
ACCESS_POINT_SENHA = '12345678'

# Dados da api
API_USER='user'
API_PASSWORD='5032b1b-ed1b-444c-8a20-a7097dfca922'
API_HOST='https://guia-me-apicruds-ol5sqokdfa-ue.a.run.app'

# Dados do Node MCU
# machine.unique_id() -> Obtém o identificador do Arduino
CLIENT_ID = machine.unique_id()

# Dados tópico MQTT
MQTT_HOST = b'jackal.rmq.cloudamqp.com'
MQTT_PORT = 1883
MQTT_USERNAME = b'zxrpgckd:zxrpgckd'
MQTT_PASSWORD = b'JnLPPDX7SbS7VpWaHvRNf4hg1BBqyA62'
MQTT_TOPIC_ROUTING_KEY = b'eventos'


def conecta_wifi():
    # WLAN(...) -> Instancia um novo cliente de conexão WLAN (wifi)
    # STA_If -> Indica que o Node MCU está conectado no modo wifi e não como Access Point
    sta_if = network.WLAN(network.STA_IF)
    # <cliente sta_if>.active(...) -> Ativa o cliente, permitindo que ele se
    #                               conecte a internet
    sta_if.active(True)

    # <cliente sta_if>.isconnected() -> Verifica se o cliente está conectado
    #                                 com a internet
    if not sta_if.isconnected():
        print('Conectando a', WIFI_SSID, '...')

        # <cliente sta_if>.connect(...) -> Conecta o cliente na internet
        sta_if.connect(WIFI_SSID, WIFI_SENHA)

        # Aguarda até a internet estar conectada e respondendo
        while not sta_if.isconnected():
            print('Conectando a', WIFI_SSID, '...')
            time.sleep(1)

    print('Conectado!')


def abre_access_point():
    # AP_IF -> Indica que o Node MCU está conectado no modo access point
    ap_if = network.WLAN(network.AP_IF)
    ap_if.active(True)

    while not ap_if.active():
        print('Ativando access point', ACCESS_POINT_SSID, '...')
        time.sleep(1)

    ap_if.config(essid=ACCESS_POINT_SSID, password=ACCESS_POINT_SENHA)

    print('Access point ativado!')
    print(ap_if.ifconfig())


def obtem_comportamento():
    res = urequests.get(f'{API_HOST}/artefato/{ARTEFATO_ID}',
                        auth=(API_USER, API_PASSWORD))
    artefato = res.json()

    return artefato['comportamentos']


def executa_comportamento(comportamento, client_mqtt):
    led_vermelho = machine.Pin(4, mode=machine.Pin.OUT)  # GD2
    led_verde = machine.Pin(5, mode=machine.Pin.OUT)     # GD1

    led_vermelho.on()

    msg = '{"artefato": "' + str(ARTEFATO_ID) + '", "corpo": {"estado": "Semáforo fechado"}}'

    client_mqtt.publish(topic=MQTT_TOPIC_ROUTING_KEY,
                        msg=bytes(msg, 'utf-8'))

    time.sleep(int(comportamento['closed_duration']))

    led_vermelho.off()

    led_verde.on()

    msg = '{"artefato": "' + str(ARTEFATO_ID) + '", "corpo": {"estado": "Semáforo aberto"}}'

    client_mqtt.publish(topic=MQTT_TOPIC_ROUTING_KEY,
                        msg=bytes(msg, 'utf-8'))

    time.sleep(int(comportamento['open_duration']))

    led_verde.off()


def connecta_mqtt():
    # MQTTClient(...) -> Instancia um novo cliente de conexão MQTT
    client = MQTTClient(client_id=CLIENT_ID,     # Um identificador único para o publicador
                        server=MQTT_HOST,        # O host da mensageria
                        port=MQTT_PORT,          # A porta da mensageria
                        user=MQTT_USERNAME,      # O usuário da mensageria
                        password=MQTT_PASSWORD)  # A senha da mensageria

    # <cliente mqtt>.connect(...) -> Inicia uma conexão entre o cliente e a
    #                          mensageria, permitindo que ele envie e receba
    #                          mensagens
    client.connect()

    return client


# Verifica se o MicroPython já começou a executar o script, e executa a
# função main
if __name__ == '__main__':
    conecta_wifi()
    abre_access_point()

    comportamentos = obtem_comportamento()
    cliente_mqtt = connecta_mqtt()

    while True:
        executa_comportamento(comportamentos, cliente_mqtt)
