package com.guia.apicruds.domain.artefato.entities;

import java.time.Instant;

import com.guia.apicruds.domain.tipo_artefato.entities.TipoArtefato;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Data
@Entity
public class Artefato {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Boolean ativo;
    private String descricao;
    private Instant criadoEm;
    private Instant atualizadoEm;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "tipo")
    private TipoArtefato tipo;
}
