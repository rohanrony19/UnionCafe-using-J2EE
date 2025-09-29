package com.xworkz.cafe.repository;

import com.xworkz.cafe.entity.BookingEntity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

public class BookingRepositoryImpl implements BookingRepository {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Cafe"); // Your persistence-unit

    @Override
    public boolean save(BookingEntity booking) {
        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();

            if (booking.getId() != 0) { // Assuming int id, 0 means new booking
                // Existing booking → update
                em.merge(booking);
            } else {
                // New booking → insert
                em.persist(booking);
            }

            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (em != null) em.close();
        }
    }

//    @Override
//    public List<BookingEntity> findAll() {
//        EntityManager em = null;
//        EntityTransaction tx = null;
//        List<BookingEntity> bookings = null;
//
//        try {
//            em = emf.createEntityManager();
//            tx = em.getTransaction();
//            tx.begin();
//
//            TypedQuery<BookingEntity> query = em.createNamedQuery("findAllBookings", BookingEntity.class);
//            bookings = query.getResultList();
//
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null && tx.isActive()) tx.rollback();
//            e.printStackTrace();
//        } finally {
//            if (em != null) em.close();
//        }
//        return bookings;
//    }

    @Override
    public List<BookingEntity> findByEmail(String email) {
        EntityManager em = null;
        EntityTransaction tx = null;
        List<BookingEntity> bookings = null;

        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();

            TypedQuery<BookingEntity> query = em.createQuery(
                    "SELECT b FROM BookingEntity b WHERE b.email = :email ORDER BY b.checkInDate DESC, b.checkInTime DESC",
                    BookingEntity.class
            );
            query.setParameter("email", email);
            bookings = query.getResultList();

            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            if (em != null) em.close();
        }
        return bookings;
    }

    @Override
    public boolean delete(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = null;
        try {
            tx = em.getTransaction();
            tx.begin();
            BookingEntity booking = em.find(BookingEntity.class, id);
            if (booking != null) {
                em.remove(booking);
                tx.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public boolean existsByEmailAndDate(String email, LocalDate date) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(b) FROM BookingEntity b WHERE b.email = :email AND b.checkInDate = :date", Long.class
            );
            query.setParameter("email", email);
            query.setParameter("date", date);
            Long count = query.getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }

}
