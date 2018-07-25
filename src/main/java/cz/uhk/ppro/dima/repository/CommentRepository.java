package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Comment;

public interface CommentRepository {
    void save(Comment comment);
    void delete(Comment comment);
}
