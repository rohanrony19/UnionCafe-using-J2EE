package com.xworkz.cafe.repository;

import com.xworkz.cafe.dto.OrderDto;
import com.xworkz.cafe.entity.OrderEntity;

import javax.persistence.*;
import java.util.List;

public class OrderRepositoryImpl implements OrderRepository {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("Cafe");

    @Override
    public boolean saveOrder(OrderEntity order) {
        EntityManager em = null;
        EntityTransaction et = null;
        try {
            em = emf.createEntityManager();
            et = em.getTransaction();
            et.begin();

            em.persist(order); // <- This actually stores the order in DB!

            et.commit();
            return true;
        } catch (Exception e) {
            if (et != null && et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        } finally {
            if (em != null) em.close();
        }
        return false;
    }



    @Override
    public List<OrderEntity> getOrdersByUser(String email) {
        EntityManager em = emf.createEntityManager();
        List<OrderEntity> orders = null;

        try {
            TypedQuery<OrderEntity> query = em.createQuery(
                    "SELECT o FROM OrderEntity o WHERE o.userEmail = :email ORDER BY o.orderDate DESC",
                    OrderEntity.class
            );
            query.setParameter("email", email);
            orders = query.getResultList();
        } finally {
            em.close();
        }

        return orders;
    }

}
