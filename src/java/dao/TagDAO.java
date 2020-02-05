package dao;

import entidades.Tag;
import java.util.List;

public interface TagDAO {

    public void save(Tag tag);

    public void delete(Tag tag);

    public Tag find(int id);

    public List<Tag> list();

}
