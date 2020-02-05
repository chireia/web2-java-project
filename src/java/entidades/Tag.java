package entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "tag")
@SequenceGenerator(name = "seq_tag", sequenceName = "tag_id_seq", allocationSize = 1)
public class Tag {

    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "seq_tag", strategy = GenerationType.SEQUENCE)
    private int id;
    private String nome;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
