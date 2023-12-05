package com.guia.apicruds.domain.tipo_artefato.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Data;
import java.time.Instant;
import java.util.Collection;
import com.fasterxml.jackson.annotation.JsonIgnore;

import com.guia.apicruds.domain.artefato.entities.Artefato;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
public class TipoArtefato {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    @Size(max = 255)
    private String descricao;

    @NotNull
    private Boolean produtor;

    private Instant criadoEm;
    private Instant atualizadoEm;

    @JsonIgnore
    @OneToMany(mappedBy = "tipo")
    private Collection<Artefato> artefatos;
}
