USE assignment_7;

DROP PROCEDURE IF EXISTS sp_GetAllInstructors;

DELIMITER $$

CREATE PROCEDURE sp_GetAllInstructors()
BEGIN
    SELECT 
        Id,
        CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName,
        Mobile,
        StartDate,
        NumberOfStars
    FROM Instructor
    WHERE IsActive = 1
    GROUP BY Id, FirstName, MiddleName, LastName, Mobile, StartDate
    ORDER BY NumberOfStars DESC;
END $$

DELIMITER ;

CALL sp_GetAllInstructors();

