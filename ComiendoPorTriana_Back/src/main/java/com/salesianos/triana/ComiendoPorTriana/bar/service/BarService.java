package com.salesianos.triana.ComiendoPorTriana.bar.service;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.bar.model.dto.BarDto;
import com.salesianos.triana.ComiendoPorTriana.bar.model.dto.CreateBarDto;
import com.salesianos.triana.ComiendoPorTriana.bar.model.dto.EditBarDto;
import com.salesianos.triana.ComiendoPorTriana.bar.repo.BarRepository;
import com.salesianos.triana.ComiendoPorTriana.comment.Comment;
import com.salesianos.triana.ComiendoPorTriana.comment.dto.CommentRequestDto;
import com.salesianos.triana.ComiendoPorTriana.comment.dto.CommentResponseDto;
import com.salesianos.triana.ComiendoPorTriana.comment.pk.CommentPk;
import com.salesianos.triana.ComiendoPorTriana.comment.repo.CommentRepository;
import com.salesianos.triana.ComiendoPorTriana.exception.BarNotFoundException;
import com.salesianos.triana.ComiendoPorTriana.exception.CommentNotFoundException;
import com.salesianos.triana.ComiendoPorTriana.files.service.StorageService;
import com.salesianos.triana.ComiendoPorTriana.search.spec.GenericSpecificationBuilder;
import com.salesianos.triana.ComiendoPorTriana.search.util.SearchCriteria;
import com.salesianos.triana.ComiendoPorTriana.search.util.SearchCriteriaExtractor;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import com.salesianos.triana.ComiendoPorTriana.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.jaxb.SpringDataJaxb;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BarService {

    private final BarRepository repo;

    private final CommentRepository commentRepo;


    private final StorageService storageService;

    public BarDto findById(UUID id) {
        Optional<Bar> opt = repo.findById(id);

        if(opt.isEmpty())
            throw new BarNotFoundException("El Bar solicitado no ha sido encontrado.");

        return BarDto.of(opt.get());
    }

    public Page<BarDto> findAll(String search, Pageable pageable) {
        List<SearchCriteria> params = SearchCriteriaExtractor.extractSearchCriteriaList(search);

        GenericSpecificationBuilder<Bar> specificationBuilder = new GenericSpecificationBuilder<>(params, Bar.class);
        Specification<Bar> spec =  specificationBuilder.build();

        Page<BarDto> bares = repo.findAll(spec, pageable).map(b -> BarDto.of(b));

        if(bares.isEmpty())
            throw new BarNotFoundException("No se encuentra ningún listado de bares.");

        return bares;
    }
    @Transactional
    public Bar add(CreateBarDto dto, final User logged, MultipartFile file) {
        String filename = storageService.store(file);
        String image = filename;

        Bar result = Bar.builder()
                .name(dto.getName())
                .description(dto.getDescription())
                .address(dto.getAddress())
                .owner(logged)
                .image(image)
                .build();

        return repo.save(result);
    }

    public Bar edit(UUID id, EditBarDto dto, final User logged, MultipartFile file) {
        String filename = storageService.store(file);
        String image = filename;


        return repo.findById(id)
                .map(b -> {
                    //userService.checkOwner(b, logged.getId());
                    b.setName(dto.getName());
                    b.setDescription(dto.getDescription());
                    b.setAddress(dto.getAddress());
                    b.setImage(image);
                    return repo.save(b);
                })
                .orElseThrow(() -> new BarNotFoundException("El Bar no existe"));
    }

    public void delete(UUID id, final User logged){
        if(repo.existsById(id)){
            repo.findById(id)
                    .map(bar -> {
                        repo.delete(bar);
                        return "";
                    });
        }
    }

    public List<CommentResponseDto> getComments(UUID id) {
        Optional<Bar> opt = repo.findById(id);

        if(opt.isEmpty())
            throw new BarNotFoundException("El Bar solicitado no ha sido encontrado.");

        Bar bar = opt.get();

        List<CommentResponseDto> lista = new ArrayList<>();
        bar.getComments().stream().map(c -> {
           return lista.add(CommentResponseDto.of(c));
        });

        return lista;
    }

    public Bar createComment(UUID id, CommentRequestDto requestDto, User author) {
        return repo.findById(id).map(b -> {
           CommentPk pk = new CommentPk(author.getId(), b.getId());
           Comment com = Comment.builder()
                   .pk(pk)
                   .author(author)
                   .title(requestDto.getTitle())
                   .body(requestDto.getBody())
                   .build();
           com.addBar(b);
           commentRepo.save(com);
           repo.save(b);
           return b;
        }).orElseThrow(() -> new EntityNotFoundException());
    }

    @Transactional
    public Bar deleteComment(UUID id, User author) {
        Optional<Comment> comOpt = commentRepo.findById(new CommentPk(author.getId(), id));
        if(comOpt.isEmpty())
            throw new EntityNotFoundException();
        Comment c = comOpt.get();
        return repo.findById(id).map(b -> {
            b.getComments().remove(c);
            commentRepo.deleteById(c.getPk());
            return repo.save(b);
        }).orElseThrow(() -> new EntityNotFoundException());
    }

    public Bar editComment(UUID id, CommentRequestDto requestDto, User author) {
        Optional<Comment> comOpt = commentRepo.findById(new CommentPk(author.getId(), id));
        if(comOpt.isEmpty())
            throw new EntityNotFoundException();
        Comment c = comOpt.get();
        return repo.findById(id).map(b -> {
            c.setTitle(requestDto.getTitle());
            c.setBody(requestDto.getBody());
            b.getComments().remove(c);
            b.getComments().add(c);
            commentRepo.save(c);
            return repo.save(b);
        }).orElseThrow(() -> new EntityNotFoundException());
    }


}
