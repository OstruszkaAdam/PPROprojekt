package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Article;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class SearchRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List search(String text) {

        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory()
                .buildQueryBuilder().forEntity(Article.class).get();

        Query query = queryBuilder
                .phrase()
                .onField("name")
                .sentence(text)
                .createQuery();

       FullTextQuery jpaQuery = fullTextEntityManager.createFullTextQuery(query, Article.class);

        @SuppressWarnings("unchecked")
                List results = jpaQuery.getResultList();
        System.out.println(results);

        return results;

    }

}
