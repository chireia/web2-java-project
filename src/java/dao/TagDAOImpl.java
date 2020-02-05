package dao;

import entidades.Tag;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class TagDAOImpl implements TagDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("ProjetoPU");

    public void save(Tag tag) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (tag.getId() > 0) {
            em.merge(tag);
        } else {
            em.persist(tag);
        }
        em.getTransaction().commit();
        em.clear();
    }

    public void delete(Tag tag) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(tag)) {
            tag = em.merge(tag);
        }
        em.remove(tag);
        em.getTransaction().commit();
        em.close();
    }

    public Tag find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Tag.class, id);
    }

    public List<Tag> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM Tag as c"); //JPQL
        return q.getResultList();
    }
}
