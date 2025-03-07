--TOP_SELLING_PRODUCT_OF_YEAR VIEW
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "TOP_SELLING_PRODUCT_OF_YEAR" ("YEAR", "PRODUCT_NAME", "TOTAL_SOLD") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT YEAR, PRODUCT_NAME, TOTAL_SOLD
FROM (
    SELECT 
        EXTRACT(YEAR FROM O.ORDER_DATE) AS YEAR, 
        P.PRODUCT_NAME, 
        SUM(OI.QUANTITY) AS TOTAL_SOLD,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM O.ORDER_DATE) ORDER BY SUM(OI.QUANTITY) DESC) AS RANK
    FROM OLIST_PRODUCTS P 
    JOIN OLIST_ORDER_ITEMS OI ON P.PRODUCT_ID = OI.PRODUCT_ID 
    JOIN OLIST_ORDERS O ON OI.ORDER_ID = O.ORDER_ID
    GROUP BY EXTRACT(YEAR FROM O.ORDER_DATE), P.PRODUCT_NAME
) WHERE RANK = 1
ORDER BY YEAR, TOTAL_SOLD DESC;