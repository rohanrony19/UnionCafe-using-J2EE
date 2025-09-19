package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.AdminLoginDTO;
import com.xworkz.cafe.entity.AdminLoginEntity;

public interface AdminService {
    LoginStatus validateLogin(AdminLoginDTO dto);
}
