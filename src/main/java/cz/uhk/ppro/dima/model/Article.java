package cz.uhk.ppro.dima.model;

import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Indexed //zahrnuti clanku do vyhledavaciho indexu
//@Analyzer //pro umozneni vyhledavani ruznych tvaru slov
@Table(name = "posts", schema = "dima")
public class Article {
    //edited
    @Id
    @GeneratedValue
    private int id;

    @Field(index = Index.YES, analyze = Analyze.YES,store = Store.NO) //Whether this data is stored in the index or not has nothing to do with the ability to search for it
    @NotEmpty
    private String name;

    @Field(index = Index.YES, analyze = Analyze.YES,store = Store.NO)
    @NotEmpty
    //@Analyzer //pro umozneni vyhledavani ruznych tvaru slov
    @Column(columnDefinition = "TEXT")
    private String text;

    @NotNull
    private Timestamp timestamp;

   // @IndexedEmbedded
    @ManyToOne
    private Topic topic;

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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
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
        if (text != null ? !text.equals(article.text) : article.text != null) return false;
        if (timestamp != null ? !timestamp.equals(article.timestamp) : article.timestamp != null) return false;
        if (topic != null ? !topic.equals(article.topic) : article.topic != null) return false;
        if (user != null ? !user.equals(article.user) : article.user != null) return false;
        if (comments != null ? !comments.equals(article.comments) : article.comments != null) return false;
        return images != null ? images.equals(article.images) : article.images == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (timestamp != null ? timestamp.hashCode() : 0);
        result = 31 * result + (topic != null ? topic.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        result = 31 * result + (images != null ? images.hashCode() : 0);
        return result;
    }

    public String getMpf() {
        return null;
    }
}
