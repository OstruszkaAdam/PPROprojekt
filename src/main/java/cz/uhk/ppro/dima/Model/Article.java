package cz.uhk.ppro.dima.model;

import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Indexed
@Table(name = "posts", schema = "dima")
public class Article {
    //edited
    @Id
    @GeneratedValue
    private int id;
    @Field(index = Index.YES, analyze = Analyze.YES,store = Store.NO)
    @NotEmpty
    private String name;
    @NotEmpty
    @Column(columnDefinition = "TEXT")
    private String description;
    @NotNull
    private Timestamp timestamp;
    @NotEmpty
    private String location;
    @NotEmpty
    private String price;

    @ManyToOne
    private Category category;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "article", cascade = CascadeType.REMOVE)
    private List<Comment> comments;

    @OneToMany(mappedBy = "article", cascade = CascadeType.REMOVE)
    private List<ArticleImage> images;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public List<ArticleImage> getImages() {
        return images;
    }

    public void setImages(List<ArticleImage> images) {
        this.images = images;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Article)) return false;

        Article article = (Article) o;

        if (id != article.id) return false;
        if (name != null ? !name.equals(article.name) : article.name != null) return false;
        if (description != null ? !description.equals(article.description) : article.description != null) return false;
        if (timestamp != null ? !timestamp.equals(article.timestamp) : article.timestamp != null) return false;
        if (location != null ? !location.equals(article.location) : article.location != null) return false;
        if (price != null ? !price.equals(article.price) : article.price != null) return false;
        if (category != null ? !category.equals(article.category) : article.category != null) return false;
        if (user != null ? !user.equals(article.user) : article.user != null) return false;
        if (comments != null ? !comments.equals(article.comments) : article.comments != null) return false;
        return images != null ? images.equals(article.images) : article.images == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (timestamp != null ? timestamp.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        return result;
    }

    public String getMpf() {
        return null;
    }
}
