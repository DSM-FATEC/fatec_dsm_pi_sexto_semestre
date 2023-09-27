import diagrams as d
import diagrams.programming.language as pl
import diagrams.programming.framework as pf
import diagrams.onprem.queue as oq
import diagrams.onprem.database as od
import diagrams.gcp.database as gd
import diagrams.gcp.analytics as ga
import diagrams.gcp.compute as gc
import diagrams.firebase.develop as fd
import diagrams.firebase.base as fb


with d.Diagram('Comunicação entre serviços - Linguagens',
                filename='comunicação_entre_serviços_v2',
                graph_attr={'margin': '-1.5, -1.5'},
                show=False):
    api = pf.FastAPI('API CRUDs')
    consumer = pl.Python('Consumidor de mensagens')
    bd = gd.Firestore('BD de CRUDs')
    bd_eventos = gd.Firestore('BD de eventos')
    artefato = pl.Python('Artefato')
    rabbitmq = oq.RabbitMQ('Mensageria')
    aplicativo = pf.Flutter('Aplicativo')
    desktop = pf.Flutter('Desktop')
    web = pl.Javascript('Web')

    api >>  d.Edge(reverse=True) >> [artefato, desktop, bd]
    api >> d.Edge(reverse=True) >> aplicativo
    api >> d.Edge(reverse=True) >> web
    artefato >> rabbitmq >> consumer
    consumer >> bd_eventos >> aplicativo

with d.Diagram('Comunicação entre serviços - Infraestrutura',
                filename='comunicação_entre_serviços_v2_gcp',
                graph_attr={'margin': '-1.5, -1.5'},
                show=False):
    api = gc.Run('API CRUDs')
    consumer = gc.Run('Consumidor de mensagens')
    bd = gd.Firestore('BD de CRUDs')
    bd_eventos = fd.Firestore('BD de eventos')
    artefato = pl.Python('Artefato')
    rabbitmq = oq.RabbitMQ('Mensageria')
    aplicativo = fb.Firebase('Aplicativo')
    desktop = pf.Flutter('Desktop')
    web = gc.Run('Web')

    api >>  d.Edge(reverse=True) >> [artefato, desktop, bd]
    api >> d.Edge(reverse=True) >> aplicativo
    api >> d.Edge(reverse=True) >> web
    artefato >> rabbitmq >> consumer
    consumer >> bd_eventos >> aplicativo