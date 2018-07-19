package cz.uhk.ppro.dima.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "posts", schema = "dima")
public class Article {
    @Id
    @GeneratedValue
    private int id;
    @NotEmpty
    private String name;
    private byte[] image;
    @NotEmpty
    private String description;

    private Timestamp timestamp;
    @NotEmpty
    private String location;
    @NotEmpty
    private String price;

    @Transient
    private MultipartFile mpf;

    @ManyToOne
    private Category category;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "article")
    private List<Comment> comments;


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


    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
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

    public MultipartFile getMpf() {
        return mpf;
    }

    public void setMpf(MultipartFile mpf) {
        this.mpf = mpf;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Article)) return false;

        Article article = (Article) o;

        if (id != article.id) return false;
        if (name != null ? !name.equals(article.name) : article.name != null) return false;
        if (!Arrays.equals(image, article.image)) return false;
        if (description != null ? !description.equals(article.description) : article.description != null) return false;
        if (timestamp != null ? !timestamp.equals(article.timestamp) : article.timestamp != null) return false;
        if (location != null ? !location.equals(article.location) : article.location != null) return false;
        if (price != null ? !price.equals(article.price) : article.price != null) return false;
        if (category != null ? !category.equals(article.category) : article.category != null) return false;
        if (user != null ? !user.equals(article.user) : article.user != null) return false;
        return comments != null ? comments.equals(article.comments) : article.comments == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(image);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (timestamp != null ? timestamp.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        return result;
    }
}
