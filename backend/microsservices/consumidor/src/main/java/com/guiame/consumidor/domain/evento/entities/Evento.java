package com.guiame.consumidor.domain.evento.entities;

import java.time.Instant;
import java.util.Map;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Evento {
    private UUID id;
    private Artefato artefato;
    private Map<String, Object> corpo;
    private Instant criadoEm;
}
