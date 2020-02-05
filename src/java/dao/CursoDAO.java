package dao;

import entidades.Curso;
import java.util.List;

public interface CursoDAO {

    public void save(Curso curso);

    public void delete(Curso curso);

    public Curso find(int id);

    public List<Curso> list();

}
