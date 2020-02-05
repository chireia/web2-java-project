package dao;

import entidades.Livro;
import java.util.List;

public interface LivroDAO {

    public void save(Livro livro);

    public void delete(Livro livro);

    public Livro find(int id);

    public List<Livro> list();

}
