--MOST_PURCHASED_PRODUCT_OF_THE_MONTH VIEW
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "MOST_PURCHASED_PRODUCT_OF_THE_MONTH" ("YEAR", "MONTH", "PRODUCT_ID", "PRODUCT_NAME", "MAX_QUANTITY_SOLD") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    year,
    month,
    PRODUCT_ID,
    PRODUCT_NAME,
    MAX(total_quantity) AS max_quantity_sold
FROM
    (
        SELECT
            EXTRACT(YEAR FROM o.ORDER_DATE) AS year,
            EXTRACT(MONTH FROM o.ORDER_DATE) AS month,
            p.PRODUCT_ID,
            p.PRODUCT_NAME,
            SUM(oi.QUANTITY) AS total_quantity
        FROM
            OLIST_ORDERS o
        JOIN
            OLIST_ORDER_ITEMS oi ON o.ORDER_ID = oi.ORDER_ID
        JOIN
            OLIST_PRODUCTS p ON oi.PRODUCT_ID = p.PRODUCT_ID
        GROUP BY
            EXTRACT(YEAR FROM o.ORDER_DATE),
            EXTRACT(MONTH FROM o.ORDER_DATE),
            p.PRODUCT_ID,
            p.PRODUCT_NAME
    )
GROUP BY
    year,
    month,
    PRODUCT_ID,
    PRODUCT_NAME
ORDER BY
    year,
    month,
    max_quantity_sold DESC;