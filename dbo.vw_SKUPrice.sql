CREATE VIEW dbo.vw_SKUPrice AS
(
	SELECT s.ID as ID, s.Code as Code, s.Name as Name, dbo.udf_GetSKUPrice(s.ID) as SKUPrice
	FROM dbo.SKU s
)
GO