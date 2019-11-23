package dao;

import entidades.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDAOImpl implements UsuarioDAO {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("ProjetoPU");

    public void save(Usuario usuario) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (usuario.getId() > 0) {
            em.merge(usuario);
        } else {
            em.persist(usuario);
        }
        em.getTransaction().commit();
        em.clear();
    }

    public void delete(Usuario usuario) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        if (!em.contains(usuario)) {
            usuario = em.merge(usuario);
        }
        em.remove(usuario);
        em.getTransaction().commit();
        em.close();
    }

    public Usuario find(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Usuario.class, id);
    }

    public List<Usuario> list() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("SELECT c FROM Usuario as c"); //JPQL
        return q.getResultList();
    }

    public boolean login(String usuario, String senha) {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery(
                "SELECT c FROM Usuario as c WHERE usuario = :usuario AND senha = :senha"
        ); //JPQL
        q.setParameter("usuario", usuario);
        q.setParameter("senha", senha);

        if (q.getResultList().size() > 0) {
            return true;
        }
        return false;
    }
}
