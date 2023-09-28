from time import sleep

from consumidor.src.domain.evento.repositories import IEventoRepository
from consumidor.src.domain.evento.consumers import IEventoMessageConsumer


class EventoService:
    '''
    Service responsável por orquestrar o uso de repositories e consumidores
    do Evento
    '''

    MAX_TRIES = 5

    def __init__(self, evento_message_consumer: IEventoMessageConsumer) -> None:
        self.evento_message_consumer = evento_message_consumer
        self.tries = 0

    def consome_eventos(self) -> None:
        try:
            self.evento_message_consumer.consome_mensagens()
        except Exception as e:
            if self.tries < self.MAX_TRIES:
                self.tries += 1
            else:
                raise e

            sleep(5)
            self.consome_eventos()
