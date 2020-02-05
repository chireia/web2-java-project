package dao;

import cdi.DAOQualifier;
import entidades.Curso;
import java.util.List;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@DAOQualifier
public class CursoDAOImpl implements CursoDAO {

    @Inject
    private EntityManagerFactory fabrica;

    @Inject
    private Event<Curso> evento;

    public void save(Curso curso) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (curso.getId() > 0) {
            em.merge(curso);
        } else {
            em.persist(curso);
        }
        em.getTransaction().commit();
        em.clear();
        evento.fire(curso);
    }

    public void delete(Curso curso) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(curso)) {
            curso = em.merge(curso);
        }
        em.remove(curso);
        em.getTransaction().commit();
        em.close();
    }

    public Curso find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Curso.class, id);
    }

    public List<Curso> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM Curso as c"); //JPQL
        return q.getResultList();
    }
}
