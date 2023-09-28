from unittest.mock import patch

from pika.channel import Channel

from consumidor.src.domain.evento.consumers import RabbitMQEventoMessageConsumer
from consumidor.src.domain.evento.models import EventoInputModel
from consumidor.src.domain.evento.repositories import IEventoRepository


class TestRabbitMQEventoMessageConsumer:
    @patch('consumidor.src.domain.evento.repositories.IEventoRepository')
    @patch('pika.channel.Channel')
    def test_obtem_evento_input_model_pela_mensagem(self, evento_repository_mockado: IEventoRepository,
                                                    canal_mockado: Channel):
        rabbit_mq_evento_message_consumer_mockado = RabbitMQEventoMessageConsumer(evento_repository=evento_repository_mockado,
                                                                                  canal=canal_mockado)
        mensagem_mockada = bytes('''
            {
                "artefato": {
                    "nome": "foo"
                },
                "corpo": {
                    "mensagem": "bar"
                }
            }
        ''', 'utf-8')

        evento_input_model_esperado = EventoInputModel(artefato={'nome': 'foo'},
                                                       corpo={'mensagem': 'bar'})
        evento_input_model_atual = rabbit_mq_evento_message_consumer_mockado.obtem_evento_input_model_pela_mensagem(mensagem_mockada)

        assert isinstance(evento_input_model_atual, EventoInputModel)
        assert evento_input_model_atual.artefato == evento_input_model_esperado.artefato
        assert evento_input_model_atual.corpo == evento_input_model_esperado.corpo
