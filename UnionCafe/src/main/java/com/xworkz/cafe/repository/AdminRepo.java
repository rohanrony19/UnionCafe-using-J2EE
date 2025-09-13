package com.xworkz.cafe.repository;

import com.xworkz.cafe.entity.AdminLoginEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepo {
    AdminLoginEntity findByEmail(String email);
    void updateLoginSuccess(AdminLoginEntity entity);
    void updateLoginFail(AdminLoginEntity entity);
    void updateLockTime(AdminLoginEntity entity);
}
