package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.AdminLoginDTO;
import com.xworkz.cafe.entity.AdminLoginEntity;
import com.xworkz.cafe.repository.AdminRepo;
import com.xworkz.cafe.repository.AdminRepoImpl;

public class AdminServiceImpl implements AdminService {

    private AdminRepo repo = new AdminRepoImpl();

    @Override
    public LoginStatus validateLogin(AdminLoginDTO dto) {
        AdminLoginEntity entity = repo.findByEmail(dto.getEmail());
        if (entity == null) {
            return LoginStatus.INVALID_CREDENTIALS;
        }

// Check if account is locked
        if (entity.getLoginAttempt() >= 3) {
            return LoginStatus.ACCOUNT_LOCKED;
        }

// Check password
        if (entity.getPassword().equals(dto.getPassword())) {
            repo.updateLoginSuccess(entity);
            return LoginStatus.SUCCESS;
        } else {
            repo.updateLoginFail(entity);
            return LoginStatus.INVALID_CREDENTIALS;
        }
    }
    }
