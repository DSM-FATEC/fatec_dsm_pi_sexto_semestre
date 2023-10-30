package com.guia.apicruds.domain.tipo_entidade.models;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.antlr.v4.runtime.misc.NotNull;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TipoEntidadeInputModel {
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long id;

    @NotBlank
    @Size(max = 255)
    private String descricao;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private LocalDate criadoEm;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private LocalDate atualizadoEm;
}
