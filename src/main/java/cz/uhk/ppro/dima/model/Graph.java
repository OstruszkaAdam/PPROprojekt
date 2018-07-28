package cz.uhk.ppro.dima.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;


@Entity
@Table(name = "graphs", schema = "dima")
public class Graph {

    @Id
    @GeneratedValue
    private int id;

    @NotEmpty
    private String name;

    private String description;

    @ManyToOne
    private User user;

    @ManyToOne
    private Article article;

    public Graph() {
    }


    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public int getId() {
        return id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Graph graph = (Graph) o;

        if (id != graph.id) return false;
        if (name != null ? !name.equals(graph.name) : graph.name != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }


}
