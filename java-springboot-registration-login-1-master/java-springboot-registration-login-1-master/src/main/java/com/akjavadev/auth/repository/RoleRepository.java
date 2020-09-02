package com.akjavadev.auth.repository;

import com.akjavadev.auth.model.Role;
import com.akjavadev.auth.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
    Role findByName(String roleName);

}
