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
  "course_id" serial,
  "url" text NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "course_categories" (
  "id" serial PRIMARY KEY,
  "course_id" serial,
  "categories_id" serial
);

CREATE TABLE "users_courses" (
  "id" serial PRIMARY KEY,
  "user_id" uuid,
  "course_id" serial
);

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");