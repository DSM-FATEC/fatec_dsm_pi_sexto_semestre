package com.guia.apicruds.rest.controllers;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

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

import com.guia.apicruds.domain.tipo_artefato.entities.TipoArtefato;
import com.guia.apicruds.domain.tipo_artefato.repositories.TipoArtefatoRepository;

@RestController
@RequestMapping("/api/tipo_artefato")
public class TipoArtefatoControllers {
    @Autowired
    public TipoArtefatoRepository repository;

    @PostMapping
    public ResponseEntity<TipoArtefato> criar(
            @RequestBody TipoArtefato artefato) {
        artefato.setId(null);
        artefato.setCriadoEm(Instant.now());
        artefato.setAtualizadoEm(Instant.now());

        TipoArtefato novoArtefato = this.repository.save(artefato);

        return ResponseEntity.ok(novoArtefato);
    }

    @GetMapping
    public ResponseEntity<List<TipoArtefato>> findAllArtefato() {
        List<TipoArtefato> artefato = this.repository.findAll();

        return ResponseEntity.ok(artefato);
    }

    @GetMapping("/{tipoArtefatoId}")
    public ResponseEntity<TipoArtefato> findArtefatoById(@PathVariable Integer tipoArtefatoId) {
        Optional<TipoArtefato> maybeTipoArtefato = this.repository.findById(tipoArtefatoId);

        if (maybeTipoArtefato.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(maybeTipoArtefato.get());
    }

    @PutMapping("/{tipoArtefatoId}")
    public ResponseEntity<TipoArtefato> updateTipoArtefatoById(
            @PathVariable Integer tipoArtefatoId,
            @RequestBody TipoArtefato tipoArtefatoBody) {
        boolean tipoArtefatoExists = this.repository.existsById(null);

        if (!tipoArtefatoExists) {
            return ResponseEntity.notFound().build();
        }

        tipoArtefatoBody.setId(tipoArtefatoId);
        tipoArtefatoBody.setAtualizadoEm(Instant.now());

        TipoArtefato updatedTipoArtefato = this.repository.save(tipoArtefatoBody);

        return ResponseEntity.ok(updatedTipoArtefato);
    }

    @DeleteMapping("/{tipoArtefatoId}")
    public ResponseEntity<?> deleteTipoArtefatoById(@PathVariable Integer tipoArtefatoId) {
        boolean tipoArtefatoExists = this.repository.existsById(tipoArtefatoId);

        if (!tipoArtefatoExists) {
            return ResponseEntity.notFound().build();
        }

        this.repository.deleteById(tipoArtefatoId);

        return ResponseEntity.noContent().build();
    }
}
