import logging as logger
from abc import ABC, abstractmethod
from json import loads

from pika.channel import Channel
from pika.spec import Basic
from pika.spec import BasicProperties

from consumidor.src.domain.evento.repositories import IEventoRepository
from consumidor.src.domain.evento.models import EventoInputModel


class IEventoMessageConsumer(ABC):
    '''
    Interface para consumidor de mensagens de Eventos concretos
    '''

    @abstractmethod
    def processa_mensagem(self, mensagem: str|bytes) -> None:
        '''
        Processa a mensagem contendo os dados do Evento
        '''
        pass

    @abstractmethod
    def consome_mensagens(self) -> None:
        '''
        Consome as mensagens disponíveis, chamando o método "processa_mensagem"
        para cada uma
        '''
        pass


class RabbitMQEventoMessageConsumer(IEventoMessageConsumer):
    '''
    Consumidor de mensagens de Eventos para RabbitMQ
    '''

    def __init__(self, evento_repository: IEventoRepository,
                 canal: Channel, fila: str = 'eventos') -> None:
        self.evento_repository = evento_repository
        self.canal = canal
        self.fila = fila

    def obtem_evento_input_model_pela_mensagem(self, mensagem: str | bytes | bytearray) -> EventoInputModel:
        '''
        Processa a mensagem, convertendo ela de texto ou binário para
        um objeto EventoInputModel
        '''

        if isinstance(mensagem, (bytes, bytearray)):
            mensagem = mensagem.decode('utf-8')

        mensagem_dict = loads(mensagem)

        return EventoInputModel(artefato=mensagem_dict['artefato'],
                                corpo=mensagem_dict['corpo'])

    def processa_mensagem(self, mensagem: str | bytes | bytearray) -> None:
        evento_input = self.obtem_evento_input_model_pela_mensagem(mensagem)

        self.evento_repository.salvar(evento_input)

    def consome_mensagens(self) -> None:
        def callback_mensagem(canal: Channel, metodo: Basic.Deliver,
                              properties: BasicProperties, mensagem: bytes):
            try:
                self.processa_mensagem(mensagem)
            except Exception as e:
                logger.error(e)

        try:
            self.canal.basic_consume(queue=self.fila,
                                     on_message_callback=callback_mensagem,
                                     auto_ack=True)
        except Exception as e:
            logger.error(e)

            raise e
        finally:
            self.canal.stop_consuming()