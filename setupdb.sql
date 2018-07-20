ALTER TABLE `clanky`.`articles`
  CHANGE COLUMN `description` `description` LONGTEXT NOT NULL ;

ALTER TABLE `clanky`.`articles`
  CHANGE COLUMN `image` `image` LONGBLOB ;

insert into categories (id, name) values (1, 'Pojmy a znaceni');
insert into categories (id, name) values (2, 'Grafy a podgrafy');
insert into categories (id, name) values (3, 'Cesty a cykly v grafu');
insert into categories (id, name) values (4, 'Stromy a cykly');
insert into categories (id, name) values (5, 'Isomorfismus grafu');
insert into categories (id, name) values (6, 'Vrcholova a hranova souvislost');
insert into categories (id, name) values (7, 'Parovani a pokryti');
insert into categories (id, name) values (8, 'Barveni grafu');
insert into categories (id, name) values (9, 'Eulerovske a hamiltonovske grafy');
insert into categories (id, name) values (10, 'Orientovane grafy');

insert into roles (id, name) values (1, 'USER');
insert into roles (id, name) values (2, 'ADMIN');
