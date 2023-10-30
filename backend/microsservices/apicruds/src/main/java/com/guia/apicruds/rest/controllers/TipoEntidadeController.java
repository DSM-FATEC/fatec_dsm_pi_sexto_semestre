package com.guia.apicruds.rest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.guia.apicruds.domain.tipo_entidade.entities.TipoEntidade;
import com.guia.apicruds.domain.tipo_entidade.models.TipoEntidadeInputModel;
import com.guia.apicruds.services.TipoEntidadeService;

import java.util.List;

@RestController
@RequestMapping("/api/tipos_entidades")
public class TipoEntidadeController {
    private TipoEntidadeService tipoEntidadeService;

    @Autowired
    public TipoEntidadeController(TipoEntidadeService tipoEntidadeService) {
        this.tipoEntidadeService = tipoEntidadeService;
    }

    @GetMapping("/")
    public List<TipoEntidade> listar() {
        return tipoEntidadeService.listar();
    }

    @GetMapping("/{id}")
    public TipoEntidade obter(@PathVariable Long id) {
        return tipoEntidadeService.buscarPorId(id);
    }

    @PostMapping("/")
    public ResponseEntity<TipoEntidade> criar(@RequestBody TipoEntidadeInputModel inputModel) {
        TipoEntidade tipoEntidadeCriada = tipoEntidadeService.criarTipoEntidade(inputModel);
        return ResponseEntity.status(HttpStatus.CREATED).body(tipoEntidadeCriada);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<TipoEntidade> atualizarEntidade(@PathVariable Long id, @RequestBody TipoEntidadeInputModel inputModel) {
        TipoEntidade tipoEntidadeAtualizada = tipoEntidadeService.atualizarTipoEntidade(id, inputModel);
        return ResponseEntity.ok(tipoEntidadeAtualizada);
    }

    @DeleteMapping("/{id}")
    public void excluir(@PathVariable Long id) {
        tipoEntidadeService.excluir(id);
    }
}