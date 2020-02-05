package dao;

import cdi.DAOQualifier;
import entidades.Post;
import java.util.List;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@DAOQualifier
public class PostDAOImpl implements PostDAO {

    @Inject
    private EntityManagerFactory fabrica;

    @Inject
    private Event<Post> evento;

    public void save(Post post) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (post.getId() > 0) {
            em.merge(post);
        } else {
            em.persist(post);
        }
        em.getTransaction().commit();
        em.clear();
        evento.fire(post);
    }

    public void delete(Post post) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(post)) {
            post = em.merge(post);
        }
        em.remove(post);
        em.getTransaction().commit();
        em.close();
    }

    public Post find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Post.class, id);
    }

    public List<Post> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM Post as c"); //JPQL
        return q.getResultList();
    }
}
