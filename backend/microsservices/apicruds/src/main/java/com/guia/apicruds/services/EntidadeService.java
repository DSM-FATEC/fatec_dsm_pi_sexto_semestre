package com.guia.apicruds.services;

import com.guia.apicruds.domain.entidade.entities.Entidade;
import com.guia.apicruds.domain.entidade.models.EntidadeInputModel;
import com.guia.apicruds.domain.entidade.repositories.EntidadeRepository;
import com.guia.apicruds.exceptions.EntidadeNaoEncontradaException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@Service
public class EntidadeService {
    private EntidadeRepository entidadeRepository;
    
    @Autowired
    public EntidadeService(EntidadeRepository entidadeRepository) {
        this.entidadeRepository = entidadeRepository;
    }

    public List<Entidade> listar() {
        List<Entidade> entidades = entidadeRepository.findAll();

        return entidades;
    }

    public Entidade buscarPorId(Long id) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);
        if (!entidadeOptional.isPresent()) {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }
        
        Entidade entidadeEncontrada = entidadeOptional.get();
        return entidadeEncontrada;
    }

    public Entidade criarEntidade(EntidadeInputModel inputModel) {
        Entidade novaEntidade = new Entidade(
                null,
                inputModel.getTipo(),
                inputModel.getDescricao(),
                inputModel.getCep(),
                inputModel.getComplemento(),
                inputModel.getEndereco(),
                inputModel.getBairro(),
                inputModel.getCidade(),
                inputModel.getEstado(),
                Instant.now(),
                null
        );

        Entidade entidadeSalva = entidadeRepository.save(novaEntidade);

        return entidadeSalva;
    }

    public Entidade atualizarEntidade(Long id, EntidadeInputModel inputModel) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);
        if (entidadeOptional.isPresent()) {
            Entidade entidade = entidadeOptional.get();

            entidade.setTipo(inputModel.getTipo());
            entidade.setDescricao(inputModel.getDescricao());
            entidade.setCep(inputModel.getCep());
            entidade.setComplemento(inputModel.getComplemento());
            entidade.setEndereco(inputModel.getEndereco());
            entidade.setBairro(inputModel.getBairro());
            entidade.setCidade(inputModel.getCidade());
            entidade.setEstado(inputModel.getEstado());

            entidade.setAtualizadoEm(Instant.now());

            return entidadeRepository.save(entidade);
        } else {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }
    }

    public void excluir(Long id) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);
        if (entidadeOptional.isPresent()) {
            entidadeRepository.deleteById(id);
        } else {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }
    }
}
