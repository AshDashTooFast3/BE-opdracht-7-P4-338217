DROP PROCEDURE IF EXISTS sp_InstructorsCount

DELIMITER $$

CREATE PROCEDURE sp_InstructorsCount()
BEGIN
    SELECT COUNT(*) AS InstructorsCount
    FROM Instructor;
END $$

DELIMITER ;

CALL sp_InstructorsCount();