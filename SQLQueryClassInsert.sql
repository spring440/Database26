CREATE PROCEDURE SubmitClass
@title nvarchar(50),
@description nvarchar(255),
@duration int,
@level int

AS BEGIN

INSERT class
VALUES(@title, @description, @duration, @level, NULL)

END
