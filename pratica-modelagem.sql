CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "fullName" varchar,
  "cpf" text UNIQUE,
  "email" text UNIQUE,
  "password" text
);

CREATE TABLE "bankAccount" (
  "id" SERIAL PRIMARY KEY,
  "customerId" int UNIQUE,
  "accountNumber" text,
  "agency" text,
  "openDate" date,
  "closeDate" date
);

CREATE TABLE "transactions" (
  "id" SERIAL PRIMARY KEY,
  "bankAccountId" int,
  "amount" numeric,
  "type" text,
  "time" time,
  "description" text,
  "cancelled" boolean
);

CREATE TABLE "creditCards" (
  "id" SERIAL PRIMARY KEY,
  "bankAccountId" int,
  "name" varchar,
  "number" varchar UNIQUE,
  "securityCode" varchar(3),
  "expirationMonth" int,
  "expirationYear" int,
  "password" text,
  "limit" numeric
);

CREATE TABLE "customerAddresses" (
  "id" SERIAL PRIMARY KEY,
  "customerId" int UNIQUE,
  "street" text,
  "number" text,
  "complement" text,
  "postalCode" varchar,
  "cityId" int
);

CREATE TABLE "cities" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "stateId" int
);

CREATE TABLE "states" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "customerPhones" (
  "id" SERIAL PRIMARY KEY,
  "customerId" int,
  "number" varchar,
  "type" varchar
);

ALTER TABLE "bankAccount" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount" ("id");

ALTER TABLE "creditCards" ADD FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount" ("id");

ALTER TABLE "customers" ADD FOREIGN KEY ("id") REFERENCES "customerAddresses" ("customerId");

ALTER TABLE "customerAddresses" ADD FOREIGN KEY ("cityId") REFERENCES "cities" ("id");

ALTER TABLE "cities" ADD FOREIGN KEY ("stateId") REFERENCES "states" ("id");

ALTER TABLE "customerPhones" ADD FOREIGN KEY ("customerId") REFERENCES "customers" ("id");
