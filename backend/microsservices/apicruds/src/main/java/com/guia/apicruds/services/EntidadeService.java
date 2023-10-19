package com.guia.apicruds.services;

import com.guia.apicruds.domain.entidade.entities.Entidade;
import com.guia.apicruds.domain.entidade.models.EntidadeInputModel;
import com.guia.apicruds.domain.entidade.repositories.EntidadeRepository;
import com.guia.apicruds.exceptions.EntidadeNaoEncontradaException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class EntidadeService {
    private EntidadeRepository entidadeRepository;
    
    @Autowired
    public EntidadeService(EntidadeRepository entidadeRepository) {
        this.entidadeRepository = entidadeRepository;
    }

    public List<EntidadeInputModel> listar() {
        List<Entidade> entidades = entidadeRepository.findAll();

        List<EntidadeInputModel> entidadeInputModels = entidades.stream()
                .map(EntidadeInputModel::toObj)
                .collect(Collectors.toList());

        return entidadeInputModels;
    }

    public EntidadeInputModel buscarPorId(Long id) {
        Optional<Entidade> entidadeOptional = entidadeRepository.findById(id);
        if (entidadeOptional.isPresent()) {
            Entidade entidadeEncontrada = entidadeOptional.get();
            return EntidadeInputModel.toObj(entidadeEncontrada);
        } else {
            throw new EntidadeNaoEncontradaException("Entidade com ID " + id + " não encontrada");
        }
    }

    public EntidadeInputModel criarEntidade(EntidadeInputModel inputModel) {
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
                LocalDate.now(),
                null
        );

        Entidade entidadeSalva = entidadeRepository.save(novaEntidade);

        return EntidadeInputModel.toObj(entidadeSalva);
    }

    public EntidadeInputModel atualizarEntidade(Long id, EntidadeInputModel inputModel) {
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

            entidade.setAtualizadoEm(LocalDate.now());

            Entidade entidadeAtualizada = entidadeRepository.save(entidade);

            return EntidadeInputModel.toObj(entidadeAtualizada);
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
