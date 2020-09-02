package com.akjavadev.auth.service;


import com.akjavadev.auth.model.Role;
import com.akjavadev.auth.model.User;
import com.akjavadev.auth.repository.RoleRepository;
import com.akjavadev.auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;


@Component
public class InitalDataLoaderService implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {

        System.out.println("Creating role ADMIN");
        Role adminRole = createUserRoles("ADMIN_ROLE");

        System.out.println("Creating role USER");
        createUserRoles("USER_ROLE");

        System.out.println("Creating user Admin");

        User user = new User();
        user.setFirstname("admin");
        user.setLastname("admin");
        user.setPassword(bCryptPasswordEncoder.encode("admin"));
        user.setUsername("admin@test.com");
        user.setRoles(new HashSet<>(Arrays.asList(adminRole)));
        userRepository.save(user);


    }

    @Transactional
    Role createUserRoles(String name){

        Role role = new Role(name);
        roleRepository.save(role);
        return role;

    }

}
