from abc import ABC, abstractmethod
from datetime import datetime
from uuid import uuid4

from google.cloud.firestore import Client

from consumidor.src.domain.evento.models import EventoInputModel, Evento


class IEventoRepository(ABC):
    '''
    Interface para repositórios de Eventos concretos
    '''

    @abstractmethod
    def salvar(evento_input: EventoInputModel) -> Evento:
        '''
        Persiste um novo Evento na base de dados a partir de um
        EventoInputModel
        '''
        pass


class FirestoreEventoRepository(IEventoRepository):
    '''
    Repositório de Eventos que perpetua os dados no Google Cloud Firestore
    '''

    def __init__(self, firestore_client: Client,
                 firestore_collection: str = 'eventos') -> None:
        self.firestore_client = firestore_client
        self.firestore_collection = firestore_collection

    def salvar(self, evento_input: EventoInputModel) -> Evento:
        evento = Evento(id=uuid4,
                        artefato=evento_input.artefato,
                        corpo=evento_input.corpo,
                        criado_em=datetime.now())

        self.firestore_client.collection(self.firestore_collection) \
                             .add(document_data=dict(evento),
                                  document_id=str(evento.id),
                                  timeout=10)

        return evento
