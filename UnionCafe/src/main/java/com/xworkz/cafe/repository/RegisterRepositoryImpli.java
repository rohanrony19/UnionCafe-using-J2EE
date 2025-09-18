package com.xworkz.cafe.repository;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.entity.RegisterEntity;

import javax.persistence.*;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class RegisterRepositoryImpli implements RegisterRepository {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Cafe");
    @Override
    public void save(RegisterDTO dto) {
        System.out.println("in save");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            RegisterEntity entity = new RegisterEntity();
            entity.setFullName(dto.getFullName());
            entity.setPhoneNumber(dto.getPhoneNumber());
            entity.setEmail(dto.getEmail());
            entity.setPassword(dto.getPassword());
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e){
            if(em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }e.printStackTrace();
        }finally {
            em.close();
        }

    }

    @Override
    public boolean checkMail(String mail) {
        System.out.println("mail in repo" + mail);
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createNamedQuery("findByEmail");
            query.setParameter("email", mail);
            RegisterEntity entity = (RegisterEntity) query.getSingleResult(); // get entity
            return entity != null;
        }catch (NoResultException e){
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public String getPassword(String mail) {
        EntityManager em = emf.createEntityManager();
        try {
            Query query = em.createNamedQuery("findPasswordByEmail");
            query.setParameter("email",mail);
            List<String> result = query.getResultList();
            return result.isEmpty()?"":result.get(0);
        }finally {
            em.close();
        }
    }

    @Override
    public boolean updatePassword(String mail, String userPassword) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Query query = em.createNamedQuery("updatePasswordByEmail");
            query.setParameter("email", mail);
            query.setParameter("password", userPassword);
            int result = query.executeUpdate();  // capture number of affected rows
            em.getTransaction().commit();
            return result > 0;  // return true if at least one row updated
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }


    @Override
    public RegisterDTO displayAllDataFromEmail(String email) {
        EntityManager em = emf.createEntityManager();
        RegisterDTO dto = null;
        try {
            Query query = em.createNamedQuery("RegisterEntity.findByEmail");
            query.setParameter("email", email);

            Object singleResult = query.getResultStream().findFirst().orElse(null);

            if (singleResult != null && singleResult instanceof RegisterEntity) {
                RegisterEntity entity = (RegisterEntity) singleResult;
                dto = new RegisterDTO();
                dto.setFullName(entity.getFullName());
                dto.setPhoneNumber(String.valueOf(entity.getPhoneNumber()));
                dto.setPassword(entity.getPassword());
                dto.setEmail(entity.getEmail());
            }
        } finally {
            em.close();
        }
        return dto;
    }

    @Override
    public void saveResetToken(String email, String token) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            RegisterEntity user = em.createNamedQuery("findByEmail", RegisterEntity.class)
                    .setParameter("email", email)
                    .getSingleResult();

            user.setResetPasswordToken(token);
            user.setResetTokenExpiry(Instant.now().plus(1, ChronoUnit.HOURS));

            em.merge(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }


}