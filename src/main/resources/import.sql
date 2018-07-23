insert into topics (id, name, url_name) values (1, 'Pojmy a značení', 'pojmy-a-znaceni');
insert into topics (id, name, url_name) values (2, 'Grafy a podgrafy', 'grafy-a-podgrafy');
insert into topics (id, name, url_name) values (3, 'Cesty a cykly v grafu', 'cesty-a-cykly-v-grafu');
insert into topics (id, name, url_name) values (4, 'Stromy a cykly', 'stromy-a-cykly');
insert into topics (id, name, url_name) values (5, 'Isomorfismus grafu', 'isomorfismus-grafu');
insert into topics (id, name, url_name) values (6, 'Vrcholová a hranová souvislost', 'vrcholova-a-hranova-souvislost');
insert into topics (id, name, url_name) values (7, 'Párovaní a pokrytí', 'parovani-a-pokryti');
insert into topics (id, name, url_name) values (8, 'Barvení grafu', 'barveni-grafu');
insert into topics (id, name, url_name) values (9, 'Eulerovské a hamiltonovské grafy', 'eulerovske-a-hamiltonovske-grafy');
insert into topics (id, name, url_name) values (10, 'Orientované grafy', 'orientovane-grafy');

insert into roles (id, name) values (1, 'USER');
insert into roles (id, name) values (2, 'ADMIN');

insert into users (id, creation_time, email, firstname, password, phone, surname, username, role_id) values (1, '2018-07-23 16:04:24.000000', 'testik@testik.cz', 'Te', '$2a$10$8WpXhZ6fI6V27jS5cgUZW.C4evNRGjBheXGqw33GjfeB.I05/clI.', '111222333', 'St', 'test', 1);