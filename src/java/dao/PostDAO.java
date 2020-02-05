package dao;

import entidades.Post;
import java.util.List;

public interface PostDAO {

    public void save(Post post);

    public void delete(Post post);

    public Post find(int id);

    public List<Post> list();

}
