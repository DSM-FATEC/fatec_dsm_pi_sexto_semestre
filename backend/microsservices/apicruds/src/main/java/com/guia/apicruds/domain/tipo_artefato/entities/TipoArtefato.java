package com.guia.apicruds.domain.tipo_artefato.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import java.time.Instant;

@Data
@Entity
public class TipoArtefato {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String descricao;
    private Boolean produtor;
    private Instant criadoEm;
    private Instant atualizadoEm;
}
