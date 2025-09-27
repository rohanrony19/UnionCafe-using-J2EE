package com.xworkz.cafe.repository;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.entity.RegisterEntity;

public interface RegisterRepository {
    boolean save(RegisterEntity entity);
    boolean checkMail(String email);
    RegisterEntity findByEmail(String email);
    boolean updatePassword(String email,String password);
    boolean updateProfile(RegisterEntity entity);
//    RegisterEntity findByEmail(String email);
//    boolean checkMail(String mail);
//    String getPassword(String mail);
//    boolean updatePassword(String mail, String password);
//    RegisterDTO displayAllDataFromEmail(String email );
//    public void saveResetToken(String email, String token);
}
