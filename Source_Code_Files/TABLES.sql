-------------------TABLE CREATION SCRIPTS----------------------

--OLIST_CUSTOMER TABLE
 CREATE TABLE "OLIST_CUSTOMERS" 
   (	"CUSTOMER_ID" NUMBER, 
	"FULL_NAME" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	"EMAIL_ADDRESS" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "OLIST_CUSTOMERS_CON" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;


 --OLIST_ORDER TABLE
  CREATE TABLE "OLIST_ORDERS" 
   (	"ORDER_ID" NUMBER, 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER, 
	"ORDER_STATUS" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"STORE_ID" NUMBER, 
	 CONSTRAINT "OLIST_ORDERS_CON" PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;

  ALTER TABLE "OLIST_ORDERS" ADD CONSTRAINT "OLIST_ORDERS_CUST_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "OLIST_CUSTOMERS" ("CUSTOMER_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "OLIST_ORDERS" ADD CONSTRAINT "OLIST_ORDERS_STORE_FK" FOREIGN KEY ("STORE_ID")
	  REFERENCES "OLIST_STORES" ("STORE_ID") ON DELETE CASCADE ENABLE;

--OLIST_ORDER_ITEMS TABLE
  CREATE TABLE "OLIST_ORDER_ITEMS" 
   (	"ORDER_ID" NUMBER NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER NOT NULL ENABLE, 
	"QUANTITY" NUMBER NOT NULL ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;

  ALTER TABLE "OLIST_ORDER_ITEMS" ADD CONSTRAINT "OLIST_ORDER_ITEMS_CON" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "OLIST_ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "OLIST_ORDER_ITEMS" ADD CONSTRAINT "OLIST_ORDER_ITEMS_PRODUCT_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "OLIST_PRODUCTS" ("PRODUCT_ID") ON DELETE CASCADE ENABLE;

--OLIST_ORDER_PAYMENTS TABLE
  CREATE TABLE "OLIST_ORDER_PAYMENTS" 
   (	"PAYMENT_ID" NUMBER, 
	"ORDER_ID" NUMBER, 
	"PAYMENT_TYPE" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "OLIST_ORDER_PAYMENTS_CON" PRIMARY KEY ("PAYMENT_ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;

  ALTER TABLE "OLIST_ORDER_PAYMENTS" ADD CONSTRAINT "OLIST_ORDER_PAYMENTS_ORDER_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "OLIST_ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE;


--OLIST_ORDER_REVIEWS TABLE
  CREATE TABLE "OLIST_ORDER_REVIEWS" 
   (	"REVIEW_ID" NUMBER, 
	"ORDER_ID" NUMBER, 
	"RATING" NUMBER, 
	"REVIEW_MESSAGE" VARCHAR2(1000) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "OLIST_ORDER_REVIEWS_CON" PRIMARY KEY ("REVIEW_ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;

  ALTER TABLE "OLIST_ORDER_REVIEWS" ADD CONSTRAINT "OLIST_ORDER_REVIEWS_ORDER_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "OLIST_ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE;


--OLIST_PRODUCTS TABLE
  CREATE TABLE "OLIST_PRODUCTS" 
   (	"PRODUCT_ID" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	"CATEGORY" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"UNIT_PRICE" NUMBER, 
	"PRODUCT_DESCRIPTION" VARCHAR2(32767) COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "OLIST_PRODUCTS_CON" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;


--OLIST_STORES TABLE
  CREATE TABLE "OLIST_STORES" 
   (	"STORE_ID" NUMBER, 
	"STORE_NAME" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"LOCATION" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"PHONE_NUMBER" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"EMAIL" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"WEBSITE" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"LATITUDE" NUMBER, 
	"LONGITUDE" NUMBER, 
	 CONSTRAINT "OLIST_STORES_CON" PRIMARY KEY ("STORE_ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;