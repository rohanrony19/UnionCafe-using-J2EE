package com.xworkz.cafe.repository;

import com.xworkz.cafe.entity.AdminLoginEntity;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

public class AdminRepoImpl implements AdminRepo {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Cafe");

    @Override
    public AdminLoginEntity findByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction entityTransaction =em.getTransaction();
        AdminLoginEntity adminLoginEntity =null;
        try {
            entityTransaction.begin();
            Query query = em.createNamedQuery("checkEmail");
            query.setParameter("email",email);
            adminLoginEntity = (AdminLoginEntity) query.getSingleResult();
            if (adminLoginEntity == null){
                return null;
            }
            entityTransaction.commit();

        } catch (Exception e) {
            return null; // email not found
        } finally {
            em.close();
        }
        return adminLoginEntity;
    }

    @Override
    public void updateLoginSuccess(AdminLoginEntity entity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            entity.setLoginAttempt(0);
            entity.setLocalDateTime(LocalDateTime.now());
            em.merge(entity);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void updateLoginFail(AdminLoginEntity entity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            entity.setLoginAttempt(entity.getLoginAttempt() + 1);
            entity.setLocalDateTime(LocalDateTime.now());
            em.merge(entity);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void updateLockTime(AdminLoginEntity entity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            entity.setLocalDateTime(LocalDateTime.now());
            em.merge(entity);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
