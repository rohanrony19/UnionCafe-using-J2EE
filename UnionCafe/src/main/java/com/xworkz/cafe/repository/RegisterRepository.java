package com.xworkz.cafe.repository;

import com.xworkz.cafe.dto.RegisterDTO;

public interface RegisterRepository {
    void save(RegisterDTO dto);
    boolean checkMail(String mail);
    String getPassword(String mail);
    void updatePassword(String mail,String password);
    RegisterDTO displayAllDataFromEmail(String email );
}
