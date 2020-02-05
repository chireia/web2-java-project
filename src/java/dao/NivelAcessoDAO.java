package dao;

import entidades.NivelAcesso;
import java.util.List;

public interface NivelAcessoDAO {

    public void save(NivelAcesso nivelacesso);

    public void delete(NivelAcesso nivelacesso);

    public NivelAcesso find(int id);

    public List<NivelAcesso> list();

}
