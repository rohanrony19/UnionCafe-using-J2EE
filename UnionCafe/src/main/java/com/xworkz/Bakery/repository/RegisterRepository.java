package com.xworkz.Bakery.repository;

import com.xworkz.Bakery.dto.RegisterDTO;

public interface RegisterRepository {
    void save(RegisterDTO dto);
    boolean checkMail(String mail);
    String getPassword(String mail);
    void updatePassword(String mail,String password);
    RegisterDTO displayAllDataFromEmail(String email );
}
