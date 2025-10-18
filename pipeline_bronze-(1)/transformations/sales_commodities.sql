CREATE OR REFRESH STREAMING LIVE TABLE sales_commodities
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/yfinance/commodities/latest_prices/',
  'json'
);