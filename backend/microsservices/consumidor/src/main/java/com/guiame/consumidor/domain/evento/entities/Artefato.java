package com.guiame.consumidor.domain.evento.entities;

import java.util.Map;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Artefato {
    private UUID id;
    private String descricao;
    private Boolean ativo;
    private Map<String, Object> comportamentos;

    @JsonProperty("id_tipo")
    private UUID idTipo;

    @JsonProperty("id_entidade")
    private UUID idEntidade;
}
