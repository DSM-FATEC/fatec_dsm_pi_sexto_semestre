import requests


API_HOST = 'https://guia-me-apicruds-ol5sqokdfa-ue.a.run.app/api'
API_AUTH = ('admin', 'admin')


def seed(endpoint='', dados=[]):
    for dado in dados:
        res = requests.post(endpoint, json=dado, auth=API_AUTH)

        if res.ok:
            print(f'{endpoint} - OK')
        else:
            print(f'{endpoint} - NOT OK - {res.status_code}')


def seed_tipo_entidade():
    seed(endpoint=f'{API_HOST}/tipo_entidade',
         dados=[
             {
                 'descricao': 'Prefeitura',
             },
             {
                 'descricao': 'Shopping',
             },
             {
                 'descricao': 'Galeria',
             },
             {
                 'descricao': 'Loja',
             },
         ])


def seed_entidade():
    seed(endpoint=f'{API_HOST}/entidade',
         dados=[
             {
                 'descricao': 'Prefeitura de teste',
                 'tipo': 1,
                 'cep': '13610-509',
                 'endereco': 'Rua de teste',
                 'complemento': '',
                 'bairro': 'Bairro de teste',
                 'cidade': 'Cidade de teste',
                 'estado': 'SP'
             },
         ])


def seed_tipo_artefato():
    seed(endpoint=f'{API_HOST}/tipo_artefato',
         dados=[
             {
                 'descricao': 'Semaforo',
                 'produtor': True
             },
             {
                 'descricao': 'Termostato',
                 'produtor': True
             },
             {
                 'descricao': 'Comercial',
                 'produtor': True
             },
             {
                 'descricao': 'Propaganda',
                 'produtor': True
             },
         ])


def seed_artefato():
    seed(endpoint=f'{API_HOST}/artefato',
         dados=[
            {
                'tipo': 2,
                'entidade': 1,
                'descricao': 'Semaforo',
                'ativo': True,
                'comportamentos': {
                    'open_duration': 5,
                    'closed_duration': 5
                },
                'wifi': 'https://guia-me-apicruds-ol5sqokdfa-ue.a.run.app'
            },
         ])


seed_tipo_entidade()
seed_entidade()
seed_tipo_artefato()
seed_artefato()