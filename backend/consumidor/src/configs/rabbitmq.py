from abc import ABC, abstractmethod

from os import getenv


class IRabbitMQConfig(ABC):
    '''
    Interface de configuração do RabbitMQ
    '''

    @abstractmethod
    def usuario(self) -> str:
        '''
        O Usuário do RabbitMQ
        '''
        pass

    @abstractmethod
    def senha(self) -> str:
        '''
        A senha do RabbitMQ
        '''
        pass

    @abstractmethod
    def host(self) -> str:
        '''
        O host do RabbitMQ
        '''
        pass

    @abstractmethod
    def porta(self) -> int:
        '''
        A porta do RabbitMQ
        '''
        pass

    @abstractmethod
    def virtual_host(self) -> str:
        '''
        O host virtual do RabbitMQ
        '''
        pass


class EnvRabbitMQConfig(IRabbitMQConfig):
    '''
    Configuração do RabbitMQ baseada em variáveis de ambiente
    '''

    def usuario(self) -> str:
        return getenv('RABBITMQ_USUARIO')

    def senha(self) -> str:
        return getenv('RABBITMQ_SENHA')

    def host(self) -> str:
        return getenv('RABBITMQ_HOST')

    def porta(self) -> int:
        porta = getenv('RABBITMQ_PORT')

        if porta is not None:
            return int(porta)

        return None

    def virtual_host(self) -> str:
        return getenv('RABBITMQ_VIRTUAL_HOST')

