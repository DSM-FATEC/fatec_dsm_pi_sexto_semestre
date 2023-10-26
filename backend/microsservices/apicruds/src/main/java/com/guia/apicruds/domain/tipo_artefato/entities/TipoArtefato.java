package com.guia.apicruds.domain.tipo_artefato.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Data;
import java.time.Instant;
import java.util.Collection;

import com.guia.apicruds.domain.artefato.entities.Artefato;

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

    @OneToMany(mappedBy = "tipo")
    private Collection<Artefato> artefatos;
}
