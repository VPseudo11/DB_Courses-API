CREATE TABLE "users" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" integer NOT NULL,
  "registration_date" date NOT NULL,
  "update_date" date NOT NULL,
  "verified" boolean NOT NULL DEFAULT false,
  "profile_image" text NOT NULL
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "publication_date" date NOT NULL,
  "teacher" varchar NOT NULL,
  "duration" integer NOT NULL,
  "level" varchar NOT NULL,
  "state" varchar NOT NULL,
  "course_image" text NOT NULL
);

CREATE TABLE "course_videos" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar NOT NULL,
  "duration" integer NOT NULL,
  "course_id" integer,
  "url" text NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "course_categories" (
  "id" serial PRIMARY KEY,
  "course_id" integer,
  "categories_id" integer
);

CREATE TABLE "users_courses" (
  "id" serial PRIMARY KEY,
  "user_id" uuid,
  "course_id" integer
);

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");



insert into users  (id, "name", last_name, email, "password", age, registration_date, update_date, profile_image) values ('5b539b4d-ba89-47df-99d2-7671fbb9333d', 'Javier', 'C', 'v.pseudo.11@gmail.com', '123456', 22, '2023/01/23', '2023/01/23', 'https://profile.image.png');
insert into users  (id, "name", last_name, email, "password", age, registration_date, update_date, profile_image) values ('4df2c702-ef42-4beb-826b-dd73cf87c113', 'Cristina', 'M', 'chris@gmail.com', '123456', 22, '2023/01/23', '2023/01/23', 'https://profile.image.png');
insert into users  (id, "name", last_name, email, "password", age, registration_date, update_date, profile_image) values ('8af6cb88-37f2-423f-b87f-e082ea07c575', 'Erika', 'L', 'erika.l@gmail.com', '123456', 22, '2023/01/23', '2023/01/23', 'https://profile.image.png');

insert into courses ("name", description, publication_date, teacher, duration, "level", state, course_image) values ('fundamentos de la programación', 'fundamentos de programacion desde cero para el desarrollo de la lógica', '2022/11/25', 'teacher 1', 500, 'beginner', 'active', 'https://image.course.jpg');
insert into courses ("name", description, publication_date, teacher, duration, "level", state, course_image) values ('Master en sql', 'SQL Aprende Bases de Datos, Consultas, Funciones, Tablas y Permisos. Diseña y Programa una Base de Datos Relacional SQL', '2021/10/02', 'teacher 3', 960, 'master', 'active', 'https://image.course.jpg');
insert into courses ("name", description, publication_date, teacher, duration, "level", state, course_image) values ('Java a profundidad', 'Aprende Java a profundidad desde cero, sin presentaciones aburridas pero con todos los conceptos explicados a detalle', '2021/09/25', 'teacher 1', 900, 'master', 'active', 'https://image.course.jpg');
insert into courses ("name", description, publication_date, teacher, duration, "level", state, course_image) values ('JavaScript Moderno: Guía para dominar el lenguaje', 'Webpack, Clases, Propiedades privadas, ESNext, Node, Npm, Babel, Hot Reaload, CRUD, Carga de archivos y más!', '2021/05/25', 'teacher 4', 1620, 'intermediate', 'active', 'https://image.course.jpg');
insert into courses ("name", description, publication_date, teacher, duration, "level", state, course_image) values ('Scrum Master y Product Owner Certificación Año 2023', 'Todo para Certificarte de Manera Exitosa en cualquiera de las principales Certificadoras Internacionales de Scrum', '2022/11/25', 'teacher 1', 1020, 'beginner', 'active', 'https://image.course.jpg');
insert into courses ("name", description, publication_date, teacher, duration, "level", state, course_image) values ('diseño visual y de interfaces con figma', 'curso de UI/UX y diseÑo visual, para paginas web y aplicaciones moviles funcionales y esteticas con figma', '2022/01/25', 'teacher 2', 930, 'intermediate', 'active', 'https://image.course.jpg');

insert into users_courses  (user_id , course_id) values ('5b539b4d-ba89-47df-99d2-7671fbb9333d', 1);
insert into users_courses  (user_id , course_id) values ('5b539b4d-ba89-47df-99d2-7671fbb9333d', 2);
insert into users_courses  (user_id , course_id) values ('5b539b4d-ba89-47df-99d2-7671fbb9333d', 3);
insert into users_courses  (user_id , course_id) values ('4df2c702-ef42-4beb-826b-dd73cf87c113', 4);
insert into users_courses  (user_id , course_id) values ('4df2c702-ef42-4beb-826b-dd73cf87c113', 1);
insert into users_courses  (user_id , course_id) values ('4df2c702-ef42-4beb-826b-dd73cf87c113', 5);
insert into users_courses  (user_id , course_id) values ('8af6cb88-37f2-423f-b87f-e082ea07c575', 6);
insert into users_courses  (user_id , course_id) values ('8af6cb88-37f2-423f-b87f-e082ea07c575', 1);
insert into users_courses  (user_id , course_id) values ('8af6cb88-37f2-423f-b87f-e082ea07c575', 2);

insert into course_videos ("name", description, duration, course_id, url) values ('fundamentos de la programación', 'clase 1', 15, 1, 'https://course/course/1/clase1');
insert into course_videos ("name", description, duration, course_id, url) values ('fundamentos de la programación', 'clase 2', 15, 1, 'https://course/course/1/clase2');
insert into course_videos ("name", description, duration, course_id, url) values ('fundamentos de la programación', 'clase 3', 15, 1, 'https://course/course/1/clase3');
insert into course_videos ("name", description, duration, course_id, url) values ('Master en SQL Aprende Bases de Datos, Consultas, Funciones, Tablas y Permisos. Diseña y Programa una Base de Datos Relacional SQL', 'clase 1', 15, 2, 'https://course/course/1/clase1');
insert into course_videos ("name", description, duration, course_id, url) values ('Master en SQL Aprende Bases de Datos, Consultas, Funciones, Tablas y Permisos. Diseña y Programa una Base de Datos Relacional SQL', 'clase 2', 15, 2, 'https://course/course/1/clase2');
insert into course_videos ("name", description, duration, course_id, url) values ('Java a profundidad Aprende Java a profundidad desde cero, sin presentaciones aburridas pero con todos los conceptos explicados a detalle', 'clase 1', 15, 3, 'https://course/course/1/clase1');
insert into course_videos ("name", description, duration, course_id, url) values ('Java a profundidad Aprende Java a profundidad desde cero, sin presentaciones aburridas pero con todos los conceptos explicados a detalle', 'clase 2', 15, 3, 'https://course/course/1/clase2');
insert into course_videos ("name", description, duration, course_id, url) values ('Java a profundidad Aprende Java a profundidad desde cero, sin presentaciones aburridas pero con todos los conceptos explicados a detalle', 'clase 3', 15, 3, 'https://course/course/1/clase3');
insert into course_videos ("name", description, duration, course_id, url) values ('Java a profundidad Aprende Java a profundidad desde cero, sin presentaciones aburridas pero con todos los conceptos explicados a detalle', 'clase 4', 15, 3, 'https://course/course/1/clase4');
insert into course_videos ("name", description, duration, course_id, url) values ('JavaScript Moderno: Guía para dominar el lenguaje Webpack, Clases, Propiedades privadas, ESNext, Node, Npm, Babel, Hot Reaload, CRUD, Carga de archivos y más!', 'clase 1', 15, 4, 'https://course/course/1/clase1');
insert into course_videos ("name", description, duration, course_id, url) values ('Scrum Master y Product Owner Certificación Año 2023', 'clase 1', 15, 5, 'https://course/course/1/clase1');
insert into course_videos ("name", description, duration, course_id, url) values ('diseño visual y de interfaces con figma', 'clase 1', 15, 6, 'https://course/course/1/clase1');

insert into	categories ("name") values ('programming');
insert into	categories ("name") values ('ui/ux desing');
insert into	categories ("name") values ('databases');
insert into	categories ("name") values ('Java');
insert into	categories ("name") values ('javascript');
insert into	categories ("name") values ('scrum');

insert into course_categories (course_id, categories_id) values (1, 1);
insert into course_categories (course_id, categories_id) values (2, 2);
insert into course_categories (course_id, categories_id) values (3, 3);
insert into course_categories (course_id, categories_id) values (4, 4);
insert into course_categories (course_id, categories_id) values (5, 5);
insert into course_categories (course_id, categories_id) values (6, 6);

select * from users;
select * from courses;
select * from users_courses;
select * from course_videos;
select * from course_categories;
select * from categories; 


select u.id, u."name" as user_name, u.last_name, u.email, u."password", u.age, u.registration_date, u.update_date, u.verified, u.profile_image, c."name" as categorie_name, c.description, c.publication_date, c.teacher, c.duration, c."level", c.state, c.course_image from (users u join users_courses uc on u.id = uc.user_id) join courses c on uc.course_id = c.id;
select c.id, c."name", c.description, c.publication_date, c.teacher, c.duration, c."level", c.state, c.course_image, cv."name", cv.description, cv.duration, cv.url  from courses c join course_videos cv on c.id  = cv.course_id;
select c.id, c."name", c.description, c.publication_date, c.teacher, c.duration, c."level", c.state, c.course_image, c2."name" as categorie_name from courses c join course_categories cc on c.id = cc.course_id join categories c2 on c2.id = cc.categories_id;