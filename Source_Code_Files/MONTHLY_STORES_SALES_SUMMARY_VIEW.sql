--MONTHLY_STORES_SALES_SUMMARY_VIEW
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "MONTHLY_STORES_SALES_SUMMARY" ("STORE_NAME", "STORE_ADDRESS", "ORDER_MONTH", "MONTHLY_SALES") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    s.STORE_NAME,
    s.LOCATION AS store_address,
    TO_CHAR(o.ORDER_DATE, 'YYYY-MM') AS order_month,
    SUM(oi.QUANTITY * p.UNIT_PRICE) AS monthly_sales
FROM
    OLIST_STORES s
JOIN
    OLIST_ORDERS o ON s.STORE_ID = o.STORE_ID
JOIN
    OLIST_ORDER_ITEMS oi ON o.ORDER_ID = oi.ORDER_ID
JOIN
    OLIST_PRODUCTS p ON oi.PRODUCT_ID = p.PRODUCT_ID
GROUP BY
    s.STORE_NAME,
    s.LOCATION,
    TO_CHAR(o.ORDER_DATE, 'YYYY-MM')
ORDER BY
    order_month, s.STORE_NAME;