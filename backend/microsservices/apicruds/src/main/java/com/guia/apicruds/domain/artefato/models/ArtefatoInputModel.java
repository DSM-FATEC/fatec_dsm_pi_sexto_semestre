package com.guia.apicruds.domain.artefato.models;

import lombok.Data;

@Data
public class ArtefatoInputModel {
    private Boolean ativo;
    private String descricao;
    private Integer idTipo;
}
