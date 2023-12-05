package com.guia.apicruds.domain.artefato.entities;

import java.time.Instant;

import com.guia.apicruds.domain.tipo_artefato.entities.TipoArtefato;

import io.hypersistence.utils.hibernate.type.json.JsonType;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

import java.util.Map;

@Data
@Entity
public class Artefato {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Boolean ativo;
    private String descricao;
    private String wifi;
    private Instant criadoEm;
    private Instant atualizadoEm;

    @Type(JsonType.class)
    @Column(columnDefinition = "JSONB")
    private Map<String, Object> comportamentos;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "tipo")
    private TipoArtefato tipo;
}
