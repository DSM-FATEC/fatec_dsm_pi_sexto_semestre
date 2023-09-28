from dataclasses import dataclass
from datetime import datetime
from uuid import UUID, uuid4


@dataclass
class Evento:
    id: UUID
    artefato: dict
    corpo: dict
    criado_em: datetime


@dataclass
class EventoInputModel:
    artefato: dict
    corpo: dict
