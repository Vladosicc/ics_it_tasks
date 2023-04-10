CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
BEGIN
	-- Обновление значения DiscountValue на 5% от Value для записей с одним ID_SKU, если их количество >= 2
    UPDATE b
    SET DiscountValue = b.Value * 0.05
    FROM dbo.Basket b
    INNER JOIN (
        SELECT ID_SKU
        FROM inserted
        GROUP BY ID_SKU
        HAVING COUNT(*) >= 2
    ) i ON b.ID_SKU = i.ID_SKU;
    
    -- Установка значения DiscountValue в 0 для записей с одним ID_SKU, если их количество < 2
    UPDATE b
    SET DiscountValue = 0
    FROM dbo.Basket b
    INNER JOIN (
        SELECT ID_SKU
        FROM inserted
        GROUP BY ID_SKU
        HAVING COUNT(*) < 2
    ) i ON b.ID_SKU = i.ID_SKU
END
GO
	