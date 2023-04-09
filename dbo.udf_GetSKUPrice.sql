CREATE FUNCTION dbo.GetSKUPrice 
(
	-- Add the parameters for the function
	@ID_SKU INT
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Price DECIMAL(18, 2);

	-- Add the T-SQL statements to compute the return value here
	SELECT @Price = SUM(Value) / SUM(Quantity)
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;

	-- Return the result of the function
	RETURN @Price;

END
GO

