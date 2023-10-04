package com.guiame.consumidor.domain.evento.models;

import java.util.Map;

import com.guiame.consumidor.domain.evento.entities.Artefato;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventoInputModel {
    private Artefato artefato;
    private Map<String, Object> corpo;
}
