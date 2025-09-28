package com.xworkz.cafe.repository;

import com.xworkz.cafe.entity.BookingEntity;

import javax.persistence.*;
import java.util.List;

public class BookingRepositoryImpl implements BookingRepository {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("CafePU"); // Your persistence-unit name

    @Override
    public boolean save(BookingEntity booking) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(booking);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public BookingEntity findById(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(BookingEntity.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<BookingEntity> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT b FROM BookingEntity b", BookingEntity.class).getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean update(BookingEntity booking) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(booking);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean delete(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            BookingEntity booking = em.find(BookingEntity.class, id);
            if (booking != null) {
                tx.begin();
                em.remove(booking);
                tx.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }
}
