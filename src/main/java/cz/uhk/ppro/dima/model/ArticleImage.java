package cz.uhk.ppro.dima.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table(name = "images", schema = "dima")
public class ArticleImage {

    @Id
    @GeneratedValue
    private int id;

    @NotEmpty
    private String uuid;

    @ManyToOne
    private Article article;

    public ArticleImage() {
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ArticleImage)) return false;

        ArticleImage that = (ArticleImage) o;

        if (uuid != null ? !uuid.equals(that.uuid) : that.uuid != null) return false;
        return article != null ? article.equals(that.article) : that.article == null;
    }

    @Override
    public int hashCode() {
        int result = uuid != null ? uuid.hashCode() : 0;
        result = 31 * result + (article != null ? article.hashCode() : 0);
        return result;
    }
}
