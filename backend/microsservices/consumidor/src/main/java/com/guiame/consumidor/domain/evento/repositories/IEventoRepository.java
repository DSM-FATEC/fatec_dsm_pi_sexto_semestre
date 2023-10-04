package com.guiame.consumidor.domain.evento.repositories;

import com.guiame.consumidor.domain.evento.models.EventoInputModel;

public interface IEventoRepository {
    /**
     * Cria um novo Evento a partir de um EventoInputModel
     *
     * @param input Os dados de input para a criação do evento
    */
    void criar(EventoInputModel input);
}
