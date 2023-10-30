package com.guia.apicruds.rest.controllers;

import com.guia.apicruds.domain.entidade.models.EntidadeInputModel;
import com.guia.apicruds.services.EntidadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/entidades")
public class EntidadeController {
    
    private EntidadeService entidadeService;

    @Autowired
    public EntidadeController(EntidadeService entidadeService) {
        this.entidadeService = entidadeService;
    }

    @GetMapping("/")
    public List<Entidade> listar() {
        return entidadeService.listar();
    }

    @GetMapping("/{id}")
    public Entidade obter(@PathVariable Long id) {
        return entidadeService.buscarPorId(id);
    }

    @PostMapping("/")
    public ResponseEntity<Entidade> criar(@RequestBody EntidadeInputModel inputModel) {
        Entidade entidadeCriada = entidadeService.criarEntidade(inputModel);
        return ResponseEntity.status(HttpStatus.CREATED).body(entidadeCriada);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Entidade> atualizarEntidade(@PathVariable Long id, @RequestBody EntidadeInputModel inputModel) {
        Entidade entidadeAtualizada = entidadeService.atualizarEntidade(id, inputModel);
        return ResponseEntity.ok(entidadeAtualizada);
    }

    @DeleteMapping("/{id}")
    public void excluir(@PathVariable Long id) {
        entidadeService.excluir(id);
    }
}
