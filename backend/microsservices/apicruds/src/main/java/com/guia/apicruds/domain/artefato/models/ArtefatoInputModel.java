package com.guia.apicruds.domain.artefato.models;

import java.util.Map;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Data
public class ArtefatoInputModel {
    @NotNull
    private Boolean ativo;

    @NotBlank
    @Size(max = 255)
    private String descricao;

    @NotBlank
    @Size(max = 255)
    private String wifi;

    @NotNull
    private Map<String, Object> comportamentos;

    @NotNull
    @JsonProperty("tipo")
    private Integer tipoId;
}
