package com.guiame.consumidor.repositories;

import java.time.Instant;
import java.util.UUID;

import com.google.cloud.firestore.Firestore;
import com.guiame.consumidor.domain.evento.entities.Evento;
import com.guiame.consumidor.domain.evento.models.EventoInputModel;
import com.guiame.consumidor.domain.evento.repositories.IEventoRepository;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
public class FirestoreEventoRepository implements IEventoRepository {
    private Firestore db;
    private String collectionName = "eventos";

    @Override
    public void criar(EventoInputModel input) {
        UUID id = UUID.randomUUID();
        Instant agora = Instant.now();
        Evento evento = new Evento(id, input.getArtefato(), input.getCorpo(), agora);

        this.db.collection(this.collectionName)
                .document(evento.getId().toString())
                .set(evento);

        log.info("Evento {} enviado para a collection {}", evento.getId().toString(), this.collectionName);
    }
}
