package com.salesianos.triana.ComiendoPorTriana.user.service;


import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.bar.model.dto.BarDto;
import com.salesianos.triana.ComiendoPorTriana.comment.dto.CommentResponseDto;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import com.salesianos.triana.ComiendoPorTriana.user.model.UserRole;
import com.salesianos.triana.ComiendoPorTriana.user.model.dto.CreateUserRequest;
import com.salesianos.triana.ComiendoPorTriana.user.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public User createUser(CreateUserRequest createUserRequest, EnumSet<UserRole> roles) {
        User user =  User.builder()
                .username(createUserRequest.getUsername())
                .password(passwordEncoder.encode(createUserRequest.getPassword()))
                .fullName(createUserRequest.getFullName())
                .roles(roles)
                .build();

        return userRepository.save(user);
    }

    public User createUserWithUserRole(CreateUserRequest createUserRequest) {
        return createUser(createUserRequest, EnumSet.of(UserRole.CLIENT));
    }

    public User createUserWithBarmanRole(CreateUserRequest createUserRequest){
        return createUser(createUserRequest, EnumSet.of(UserRole.BARMAN));
    }

    public User createUserWithAdminRole(CreateUserRequest createUserRequest) {
        return createUser(createUserRequest, EnumSet.of(UserRole.ADMIN));
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public Optional<User> findById(UUID id) {
        return userRepository.findById(id);
    }

    public Optional<User> findByUsername(String username) {
        Optional<User> opt = userRepository.findFirstByUsername(username);
        if(opt.isEmpty()){
            throw new UsernameNotFoundException("Usuario no encontrado por nombre de usuario");
        }

        return opt;
    }

    public Optional<User> edit(User user) {

        return userRepository.findById(user.getId())
                .map(u -> {
                    u.setFullName(user.getFullName());
                    return userRepository.save(u);
                }).or(() -> Optional.empty());
    }

    public Optional<User> editPassword(UUID userId, String newPassword) {
        return userRepository.findById(userId)
                .map(u -> {
                    u.setPassword(passwordEncoder.encode(newPassword));
                    return userRepository.save(u);
                }).or(() -> Optional.empty());
    }

    public void delete(User user) {
        deleteById(user.getId());
    }

    public void deleteById(UUID id) {
        if (userRepository.existsById(id))
            userRepository.deleteById(id);
    }

    public boolean passwordMatch(User user, String clearPassword) {
        return passwordEncoder.matches(clearPassword, user.getPassword());
    }


    public List<Bar> getFavourites(UUID id){
        Optional<User> opt = userRepository.findById(id);

        if(opt.isEmpty())
            throw new RuntimeException();

        User user = opt.get();

        List<Bar> bares = user.getFavList();
        return bares;
    }

//    public boolean checkCommentOwner(Comment comment, UUID id){
//        return userRepository.findFirstById(id)
//                .map(user -> {
//                   boolean isAuthor = user.getComments().stream().anyMatch(c -> c.equals(comment));
//                   if (!isAuthor)
//                       throw new NotOwnerException("El usuario no es el autor.");
//                   return isAuthor;
//                }).orElseThrow(() -> new NotOwnerException("usuario sin acceso."));
//    }


}
