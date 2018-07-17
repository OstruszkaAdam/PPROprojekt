package cz.uhk.ppro.dima.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "Users", schema = "dima")
public class User {

    @Id
    @GeneratedValue
    private int id;
    private String username;
    private String password;
    private String firstname;
    private String surname;
    private String email;
    private String phone;
    private Timestamp creationTime;

    @ManyToOne(cascade = CascadeType.ALL)
    private Role role;

    @OneToMany(mappedBy = "user")
    private List<Article> articles;

    @OneToMany(mappedBy = "author")
    private List<Comment> commentsPosted;

    @OneToMany(mappedBy = "author")
    private List<Rating> ratingsPosted;

    @OneToMany(mappedBy = "ratedUser")
    private List<Rating> ratingsReceived;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstName) {
        this.firstname = firstName;
    }


    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public Timestamp getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Timestamp creationTime) {
        this.creationTime = creationTime;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public List<Comment> getCommentsPosted() {
        return commentsPosted;
    }

    public void setCommentsPosted(List<Comment> commentsPosted) {
        this.commentsPosted = commentsPosted;
    }

    public List<Rating> getRatingsPosted() {
        return ratingsPosted;
    }

    public void setRatingsPosted(List<Rating> ratingsPosted) {
        this.ratingsPosted = ratingsPosted;
    }

    public List<Rating> getRatingsReceived() {
        return ratingsReceived;
    }

    public void setRatingsReceived(List<Rating> ratingsReceived) {
        this.ratingsReceived = ratingsReceived;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (!firstname.equals(user.firstname)) return false;
        if (!surname.equals(user.surname)) return false;
        if (!email.equals(user.email)) return false;
        if (!phone.equals(user.phone)) return false;
        return creationTime != null ? creationTime.equals(user.creationTime) : user.creationTime == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + firstname.hashCode();
        result = 31 * result + surname.hashCode();
        result = 31 * result + email.hashCode();
        result = 31 * result + phone.hashCode();
        result = 31 * result + (creationTime != null ? creationTime.hashCode() : 0);
        return result;
    }
}