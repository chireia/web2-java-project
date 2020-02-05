package dao;

import cdi.DAOQualifier;
import entidades.Livro;
import java.util.List;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@DAOQualifier
public class LivroDAOImpl implements LivroDAO {

    @Inject
    private EntityManagerFactory fabrica;

    @Inject
    private Event<Livro> evento;
    
    public void save(Livro livro) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (livro.getId() > 0) {
            em.merge(livro);
        } else {
            em.persist(livro);
        }
        em.getTransaction().commit();
        em.clear();
        evento.fire(livro);
    }

    public void delete(Livro livro) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(livro)) {
            livro = em.merge(livro);
        }
        em.remove(livro);
        em.getTransaction().commit();
        em.close();
    }

    public Livro find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Livro.class, id);
    }

    public List<Livro> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM Livro as c"); //JPQL
        return q.getResultList();
    }
}
