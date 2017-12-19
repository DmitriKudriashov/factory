CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "post" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_categories_on_name" ON "categories" ("name");
CREATE TABLE "brands" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_brands_on_name" ON "brands" ("name");
CREATE TABLE "units" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_units_on_name" ON "units" ("name");
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_products_on_name" ON "products" ("name");
CREATE TABLE "budgetitems" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "codeitem" varchar(10), "shortname" varchar(20), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_budgetitems_on_name" ON "budgetitems" ("name");
CREATE UNIQUE INDEX "index_budgetitems_on_codeitem" ON "budgetitems" ("codeitem");
CREATE INDEX "index_budgetitems_on_shortname" ON "budgetitems" ("shortname");
CREATE TABLE "modelsets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "number_model" varchar, "date_model" date DEFAULT '2017-10-27' NOT NULL, "product_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_modelsets_on_number_model" ON "modelsets" ("number_model");
CREATE INDEX "index_modelsets_on_product_id" ON "modelsets" ("product_id");
CREATE TABLE "currencies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "curry_code" varchar(3) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_currencies_on_name" ON "currencies" ("name");
CREATE UNIQUE INDEX "index_currencies_on_curry_code" ON "currencies" ("curry_code");
CREATE TABLE "ratecurries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "currency_id" integer, "rate" decimal(15,4), "date_rate" date DEFAULT '2017-10-27', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_ratecurries_on_currency_id" ON "ratecurries" ("currency_id");
CREATE TABLE "modelprices" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "modelset_id" integer, "category_id" integer, "description_id" integer, "quantty" decimal(15,4), "unit_id" integer, "unit_price" decimal(15,2), "currency_id" integer, "ratecurry_id" integer, "sum_curry" decimal(15,2), "sum_usd" decimal(15,2), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_modelprices_on_modelset_id" ON "modelprices" ("modelset_id");
CREATE INDEX "index_modelprices_on_category_id" ON "modelprices" ("category_id");
CREATE INDEX "index_modelprices_on_description_id" ON "modelprices" ("description_id");
CREATE INDEX "index_modelprices_on_unit_id" ON "modelprices" ("unit_id");
CREATE INDEX "index_modelprices_on_currency_id" ON "modelprices" ("currency_id");
CREATE INDEX "index_modelprices_on_ratecurry_id" ON "modelprices" ("ratecurry_id");
CREATE TABLE "suppliers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_suppliers_on_name" ON "suppliers" ("name");
CREATE TABLE "descriptions" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`category_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
CREATE UNIQUE INDEX `index_descriptions_on_name` ON `descriptions` (
	`name`
);
CREATE INDEX `index_descriptions_on_category_id` ON `descriptions` (
	`category_id`
);
CREATE TABLE "usingtypes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "inventories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "quantity" decimal DEFAULT '0', "budgetitem_id" integer, "description_id" integer, "brand_id" integer, "serial_number" varchar, "supplier_id" integer, "price_curry" decimal(15,2), "sum_curry" decimal(15,2), "price_usd" decimal(15,2), "sum_usd" decimal(15,2), "ratecurry_id" integer, "currency_id" integer, "unit_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "date_investment" date, "usingtype_id" integer);
CREATE INDEX "index_inventories_on_description_id" ON "inventories" ("description_id");
CREATE INDEX "index_inventories_on_brand_id" ON "inventories" ("brand_id");
CREATE INDEX "index_inventories_on_supplier_id" ON "inventories" ("supplier_id");
CREATE INDEX "index_inventories_on_ratecurry_id" ON "inventories" ("ratecurry_id");
CREATE INDEX "index_inventories_on_currency_id" ON "inventories" ("currency_id");
CREATE INDEX "index_inventories_on_unit_id" ON "inventories" ("unit_id");
CREATE INDEX "index_inventories_on_budgetitem_id" ON "inventories" ("budgetitem_id");
INSERT INTO "schema_migrations" (version) VALUES
('20171021104422'),
('20171023080206'),
('20171023080709'),
('20171023080739'),
('20171023080814'),
('20171023081009'),
('20171023081218'),
('20171023082601'),
('20171023085715'),
('20171023091507'),
('20171023093009'),
('20171023101204'),
('20171027081848'),
('20171027084431'),
('20171102120725'),
('20171106065429'),
('20171106090737'),
('20171106094410'),
('20171107123405');


