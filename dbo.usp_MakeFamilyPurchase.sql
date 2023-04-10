CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
	-- Add the parameters for the stored procedure here
	@FamilySurName varchar(255) 
AS
BEGIN
	-- Проверка существования переданной фамилии в таблице dbo.Family
    IF NOT EXISTS (SELECT 1 FROM dbo.Family WHERE SurName = @FamilySurName)
    BEGIN
        RAISERROR('Семьи с фамилией "%s" не существует.', 16, 1, @FamilySurName);
        RETURN;
    END;

	UPDATE dbo.Family
	SET dbo.Family.BudgetValue = dbo.Family.BudgetValue - (SELECT sum(Value) FROM dbo.Basket WHERE dbo.Basket.ID_FAMILY = dbo.Family.ID)

END
GO
