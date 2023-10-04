package com.guiame.consumidor.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guiame.consumidor.domain.evento.models.EventoInputModel;
import com.guiame.consumidor.domain.evento.repositories.IEventoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EventoService {
    @Autowired
    private IEventoRepository eventoRepository;

    public void salvar(EventoInputModel input) {
        log.info("Processando input {}", input.toString());

        this.eventoRepository.criar(input);
    }
}
