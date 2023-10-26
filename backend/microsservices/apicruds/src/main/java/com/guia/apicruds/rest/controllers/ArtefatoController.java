package com.guia.apicruds.rest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guia.apicruds.domain.artefato.entities.Artefato;
import com.guia.apicruds.domain.artefato.models.ArtefatoInputModel;
import com.guia.apicruds.exceptions.ArtefatoNaoEncontradoException;
import com.guia.apicruds.exceptions.TipoArtefatoNaoEncontradoException;
import com.guia.apicruds.services.ArtefatoService;

@RestController
@RequestMapping("/api/artefato")
public class ArtefatoController {
    @Autowired
    private ArtefatoService artefatoService;

    @PostMapping
    public ResponseEntity<Artefato> criar(@RequestBody ArtefatoInputModel inputModel) {
        try {
            Artefato artefato = this.artefatoService.criaArtefato(inputModel);

            return ResponseEntity.ok(artefato);
        } catch (TipoArtefatoNaoEncontradoException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/{artefatoId}")
    public ResponseEntity<Artefato> atualizar(@PathVariable Integer artefatoId,
        @RequestBody ArtefatoInputModel inputModel) {
        try {
            Artefato artefato = this.artefatoService.atualizaArtefato(inputModel, artefatoId);

            return ResponseEntity.ok(artefato);
        } catch (TipoArtefatoNaoEncontradoException e) {
            return ResponseEntity.badRequest().build();
        } catch (ArtefatoNaoEncontradoException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/{artefatoId}")
    public ResponseEntity<Artefato> obtem(@PathVariable Integer artefatoId) {
        try {
            Artefato artefato = this.artefatoService.obtemPorId(artefatoId);

            return ResponseEntity.ok(artefato);
        } catch(ArtefatoNaoEncontradoException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping
    public ResponseEntity<List<Artefato>> lista() {
        return ResponseEntity.ok(this.artefatoService.obtemTodos());
    }

    @DeleteMapping("/{artefatoId}")
    public ResponseEntity<?> deleta(@PathVariable Integer artefatoId) {
        try {
            this.artefatoService.deletaPorId(artefatoId);

            return ResponseEntity.noContent().build();
        } catch(ArtefatoNaoEncontradoException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
