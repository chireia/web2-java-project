package dao;

import entidades.Usuario;
import java.util.List;

public interface UsuarioDAO {

    public void save(Usuario usario);

    public void delete(Usuario usario);

    public Usuario find(int id);

    public List<Usuario> list();

    public boolean login(String usuario, String senha);

}
