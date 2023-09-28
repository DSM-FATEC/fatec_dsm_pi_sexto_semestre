from pika import PlainCredentials, ConnectionParameters, BlockingConnection
from pika.channel import Channel

from consumidor.src.configs.rabbitmq import IRabbitMQConfig


class RabbitMqConector:
    '''
    Abre conexão com a mensageria RabbitMQ
    '''

    def __init__(self, config: IRabbitMQConfig):
        self.config = config

    def abre_canal_mqtt(self, exchange: str, fila: str) -> Channel:
        '''
        Abre um canal na mensageria para a exchange e fila passados
        '''

        credenciais = PlainCredentials(username=self.config.usuario(),
                                       password=self.config.senha())
        parametros = ConnectionParameters(host=self.config.host(),
                                          port=self.config.porta(),
                                          virtual_host=self.config.virtual_host(),
                                          credentials=credenciais)
        conexao = BlockingConnection(parametros)  # Abre uma conexão
        canal = conexao.channel()  # Abre um canal

        # Declara a exchange, para que a mesma seja criada caso não
        # exista
        canal.exchange_declare(exchange=exchange,
                               exchange_type='fanout')

        # Declara a fila, para que a mesma seja criada caso não exista
        fila_declarada = canal.queue_declare(queue=fila,
                                             durable=True)

        # Obtém o nome "real" da fila declarada
        nome_fila_declarada = fila_declarada.method.queue

        # Conecta no exchange amq.topic, usado pelo MQTT
        canal.exchange_bind(destination=exchange,
                            source='amq.topic')

        # Conecta a fila na exchange
        canal.queue_bind(exchange=exchange, queue=nome_fila_declarada)

        return canal, nome_fila_declarada