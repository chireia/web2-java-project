package dao;

import entidades.NivelAcesso;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class NivelAcessoDAOImpl implements NivelAcessoDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("ProjetoPU");

    public void save(NivelAcesso nivelacesso) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (nivelacesso.getId() > 0) {
            em.merge(nivelacesso);
        } else {
            em.persist(nivelacesso);
        }
        em.getTransaction().commit();
        em.clear();
    }

    public void delete(NivelAcesso nivelacesso) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(nivelacesso)) {
            nivelacesso = em.merge(nivelacesso);
        }
        em.remove(nivelacesso);
        em.getTransaction().commit();
        em.close();
    }

    public NivelAcesso find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(NivelAcesso.class, id);
    }

    public List<NivelAcesso> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM NivelAcesso as c"); //JPQL
        return q.getResultList();
    }
}
