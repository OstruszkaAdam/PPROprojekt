/*-------------------------
  ROLE UZIVATELU
--------------------------*/
INSERT INTO roles (id, name) VALUES (1, 'USER');
INSERT INTO roles (id, name) VALUES (2, 'ADMIN');


/*-------------------------
  UZIVATELE
--------------------------*/
INSERT INTO users (id, creation_time, email, first_name, password, last_name, username, role_id) VALUES (1, '2018-07-23 16:04:24.000000', 'testik@testik.cz', 'Te', '$2a$10$8WpXhZ6fI6V27jS5cgUZW.C4evNRGjBheXGqw33GjfeB.I05/clI.', 'St', 'test', 1);
INSERT INTO users (id, creation_time, email, first_name, password, last_name, username, role_id) VALUES (3, '2018-07-28 14:46:28.000000', 'lorem@ipsum.cz', 'Lorem', '$2a$10$ijRT4IZhPrFWeGaQ9F/eo.o8SO7oBm68WdaF2k2vDaw8oehNIF.3.', 'Ipsum', 'loremIpsum', 1);


/*-------------------------
  TEMATA
--------------------------*/
INSERT INTO topics (id, name, url_name) VALUES (1, 'Pojmy a značení', 'pojmy-a-znaceni');
INSERT INTO topics (id, name, url_name) VALUES (2, 'Grafy a podgrafy', 'grafy-a-podgrafy');
INSERT INTO topics (id, name, url_name) VALUES (3, 'Cesty a cykly v grafu', 'cesty-a-cykly-v-grafu');
INSERT INTO topics (id, name, url_name) VALUES (4, 'Stromy a cykly', 'stromy-a-cykly');
INSERT INTO topics (id, name, url_name) VALUES (5, 'Isomorfismus grafu', 'isomorfismus-grafu');
INSERT INTO topics (id, name, url_name) VALUES (6, 'Vrcholová a hranová souvislost', 'vrcholova-a-hranova-souvislost');
INSERT INTO topics (id, name, url_name) VALUES (7, 'Párovaní a pokrytí', 'parovani-a-pokryti');
INSERT INTO topics (id, name, url_name) VALUES (8, 'Barvení grafu', 'barveni-grafu');
INSERT INTO topics (id, name, url_name) VALUES (9, 'Eulerovské a hamiltonovské grafy', 'eulerovske-a-hamiltonovske-grafy');
INSERT INTO topics (id, name, url_name) VALUES (10, 'Orientované grafy', 'orientovane-grafy');


/*-------------------------
  CLANKY
--------------------------*/
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (2, 'Nadpis 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla est. Etiam bibendum elit eget erat. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Pellentesque sapien. In laoreet, magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. Et harum quidem rerum facilis est et expedita distinctio. Aliquam erat volutpat. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Curabitur bibendum justo non orci. Maecenas fermentum, sem in pharetra pellentesque, velit turpis volutpat ante, in pharetra metus odio a lectus. Nulla turpis magna, cursus sit amet, suscipit a, interdum id, felis. Etiam sapien elit, consequat eget, tristique non, venenatis quis, ante. Pellentesque arcu. Proin mattis lacinia justo. Nulla non arcu lacinia neque faucibus fringilla. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Sed elit dui, pellentesque a, faucibus vel, interdum nec, diam. Nulla non arcu lacinia neque faucibus fringilla. Nam quis nulla. Morbi leo mi, nonummy eget tristique non, rhoncus non leo. Maecenas lorem. Fusce suscipit libero eget elit. Duis ante orci, molestie vitae vehicula venenatis, tincidunt ac pede. Praesent vitae arcu tempor neque lacinia pretium. Nulla turpis magna, cursus sit amet, suscipit a, interdum id, felis. Maecenas fermentum, sem in pharetra pellentesque, velit turpis volutpat ante, in pharetra metus odio a lectus. Curabitur bibendum justo non orci. Fusce tellus. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Fusce aliquam vestibulum ipsum. ', '2018-07-28 14:42:49.000000', 2, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (3, 'Nadpis 3', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-23 16:04:24.000000', 3, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (4, 'Nadpis 4', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-24 16:04:24.000000', 4, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (5, 'Nadpis 5', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-25 16:04:24.000000', 5, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (6, 'Nadpis 6', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-26 16:04:24.000000', 6, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (7, 'Nadpis 7', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-27 16:04:24.000000', 7, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (8, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus et lorem id felis nonummy placerat. Aliquam ornare wisi eu metus. Etiam dictum tincidunt diam. Phasellus faucibus molestie nisl. Aenean fermentum risus id tortor. Nullam feugiat, turpis at pulvinar vulputate, erat libero tristique tellus, nec bibendum odio risus sit amet ante. Aenean vel massa quis mauris vehicula lacinia. Mauris tincidunt sem sed arcu. Etiam neque. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et, dolor. Duis pulvinar. Integer rutrum, orci vestibulum ullamcorper ultricies, lacus quam ultricies odio, vitae placerat pede sem sit amet enim. Phasellus faucibus molestie nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus augue non sapien. Nulla non arcu lacinia neque faucibus fringilla. Etiam dictum tincidunt diam. Integer lacinia. Nulla pulvinar eleifend sem. Nulla turpis magna, cursus sit amet, suscipit a, interdum id, felis. Mauris elementum mauris vitae tortor. Etiam quis quam. Nulla pulvinar eleifend sem. In rutrum. Aliquam ante. Donec vitae arcu. Nullam eget nisl. Nullam rhoncus aliquam metus. Nulla est. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Nunc tincidunt ante vitae massa. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Aliquam erat volutpat. Aliquam erat volutpat. Mauris suscipit, ligula sit amet pharetra semper, nibh ante cursus purus, vel sagittis velit mauris vel metus. Integer in sapien. Nullam justo enim, consectetuer nec, ullamcorper ac, vestibulum in, elit. Etiam egestas wisi a erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Vestibulum fermentum tortor id mi. Fusce wisi. Etiam egestas wisi a erat. Vivamus ac leo pretium faucibus. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Praesent dapibus. Aenean fermentum risus id tortor. Sed vel lectus. Donec odio tempus molestie, porttitor ut, iaculis quis, sem. Maecenas fermentum, sem in pharetra pellentesque, velit turpis volutpat ante, in pharetra metus odio a lectus. Mauris dictum facilisis augue. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam rhoncus aliquam metus. In dapibus augue non sapien. In dapibus augue non sapien. Aenean placerat. Aliquam id dolor. Vestibulum erat nulla, ullamcorper nec, rutrum non, nonummy ac, erat. Aenean fermentum risus id tortor. Fusce wisi. Fusce aliquam vestibulum ipsum. Curabitur vitae diam non enim vestibulum interdum. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Mauris metus. Nullam justo enim, consectetuer nec, ullamcorper ac, vestibulum in, elit. Aenean id metus id velit ullamcorper pulvinar. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Phasellus faucibus molestie nisl. Etiam dictum tincidunt diam. Nulla accumsan, elit sit amet varius semper, nulla mauris mollis quam, tempor suscipit diam nulla vel leo. Vivamus porttitor turpis ac leo.', '2018-07-30 15:24:29.000000', 1, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (9, 'Nadpis 9', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-29 18:04:24.000000', 2, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (10, 'Nadpis 10', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-29 19:04:24.000000', 3, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (11, 'Nadpis 11', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Donec quis nibh at felis congue commodo. Cras pede libero, dapibus nec, pretium sit amet, tempor quis. Vestibulum fermentum tortor id mi. Etiam commodo dui eget wisi. Integer imperdiet lectus quis justo. Nullam eget nisl. Fusce consectetuer risus a nunc. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Vestibulum fermentum tortor id mi. Maecenas lorem. Fusce nibh. Nulla est. Proin mattis lacinia justo. Praesent dapibus. ', '2018-07-29 21:04:24.000000', 4, 1);
INSERT INTO articles (id, name, text, timestamp, topic_id, user_id) VALUES (12, 'Escaping', '<p><b>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</b> Donec ipsum massa, ullamcorper in, auctor et, scelerisque sed, est. Maecenas libero. In rutrum. In convallis. Praesent id justo in neque elementum ultrices. Pellentesque pretium lectus id turpis. Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus. Nullam sit amet magna in magna gravida vehicula. Vivamus luctus egestas leo. Quisque porta. Nulla pulvinar eleifend sem. <a href="/">Visit our website.</a> Et harum quidem rerum facilis est et expedita distinctio. Etiam dictum tincidunt diam. Nulla pulvinar eleifend sem. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p><p>Etiam posuere lacus quis dolor. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Proin mattis lacinia justo. Nam sed tellus id magna elementum tincidunt. Duis pulvinar. Nullam at arcu a est sollicitudin euismod. Nulla non lectus sed nisl molestie malesuada. Nullam sit amet magna in magna gravida vehicula. Fusce tellus odio, dapibus id fermentum quis, suscipit id erat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus faucibus molestie nisl. In sem justo, commodo ut, suscipit at, pharetra vitae, orci. Phasellus enim erat, vestibulum vel, aliquam a, posuere eu, velit. Aliquam ornare wisi eu metus. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Nullam justo enim, consectetuer nec, ullamcorper ac, vestibulum in, elit. Suspendisse sagittis ultrices augue. Etiam egestas wisi a erat.</p><p>Morbi scelerisque luctus velit. Quisque porta. Praesent in mauris eu tortor porttitor accumsan. Pellentesque arcu. Proin pede metus, vulputate nec, fermentum fringilla, vehicula vitae, justo. Aenean id metus id velit ullamcorper pulvinar. Praesent dapibus. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus. Nunc tincidunt ante vitae massa. In dapibus augue non sapien. Integer vulputate sem a nibh rutrum consequat. Aliquam in lorem sit amet leo accumsan lacinia.</p>', '2018-07-21 20:04:24.000000', 5, 1);


/*-------------------------
  OBRAZKY DO CLANKU
--------------------------*/
INSERT INTO images (id, uuid, article_id) VALUES (9, 'testovaci-obrazek-1', 8);
INSERT INTO images (id, uuid, article_id) VALUES (10, 'testovaci-obrazek-2', 8);
INSERT INTO images (id, uuid, article_id) VALUES (11, 'testovaci-obrazek-3', 8);


/*-------------------------
  KOMENTARE KE CLANKUM
--------------------------*/
INSERT INTO comments (id, comment_text, post_date, article_id, author_id) VALUES (1, 'Vivamus ac leo pretium faucibus. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Praesent dapibus. Aenean fermentum risus id tortor. Sed vel lectus.', '2018-07-28 14:43:45.000000', 8, 1);
INSERT INTO comments (id, comment_text, post_date, article_id, author_id) VALUES (2, 'Uisque tincidunt scelerisque libero. Aenean id metus id velit ullamcorper pulvinar. ', '2018-07-28 14:47:34.000000', 8, 3);
INSERT INTO comments (id, comment_text, post_date, article_id, author_id) VALUES (3, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2018-07-28 14:48:36.000000', 8, 1);
INSERT INTO comments (id, comment_text, post_date, article_id, author_id) VALUES (4, ' Curabitur bibendum justo non orci.', '2018-07-28 14:48:47.000000', 8, 3);


/*-------------------------
  GRAFY
--------------------------*/
INSERT INTO graphs (id, name, description, user_id) VALUES (1, 'Test','Lorem ipsum dolor sit amet', 1);