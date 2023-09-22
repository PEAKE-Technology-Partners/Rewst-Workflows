SHOW DATABASES;
use rewst;

-- List Number of total Executions
select COUNT(*) FROM `Rewst_Executions`;

-- Traditional SQL

SELECT * FROM `Rewst_Executions` WHERE `Org_Name` = 'PEAKE Technology Dev';

-- Get Number of Executions of Each Workflow
SELECT Workflow_Name, COUNT(*) FROM `Rewst_Executions` where `Org_Name` = 'PEAKE Technology Dev' GROUP BY Workflow_Name
ORDER BY `COUNT(*)`  DESC;


-- Get Total Time Saved per Workflow
SELECT Workflow_Name AS `Workflow Name`, SUM(Time_Saved) AS `Total Time Saved (Seconds)`
FROM `Rewst_Executions`
WHERE `Org_Name` = 'PEAKE Technology Dev'
GROUP BY Workflow_Name
ORDER BY `Total Time Saved (Seconds)` DESC;


-- For Each Workflow list number of each statuses
SELECT Workflow_Name, Workflow_ID,  Status, COUNT(*) AS Status_Count
FROM Rewst_Executions
WHERE `Org_Name` = 'PEAKE Technology Dev'
GROUP BY Workflow_ID, Workflow_Name, Status  
ORDER BY `Rewst_Executions`.`Workflow_Name` ASC;

-- Lists all Failed Workflow Executions from 9/10 where the Workflow Name contains ID. 
-- SELECT * from Rewst_Executions where Workflow_Name LIKE '%ID%' AND DATE(End_Time) = '2023-09-10' AND status = 'failed';

SELECT *
FROM Rewst_Executions
WHERE DATE(End_Time) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
  AND status = 'failed';
  
-- Stored Procedure Testing


-- Dropping Stored Procedures if they exist
DROP PROCEDURE IF EXISTS CountTotalWorkflowExecutions;
DROP PROCEDURE IF EXISTS CountTotalExecutions;
DROP PROCEDURE IF EXISTS TotalTimeSaved;



-- First Procedure Gets Total Workflow Executions for a Workflow that you specify as a Parameter
DELIMITER //

CREATE PROCEDURE CountTotalWorkflowExecutions(IN In_Workflow_Name varchar(50))
BEGIN
    SELECT CONCAT('Total Count of All Workflows with ', In_Workflow_Name) AS 'Message', COUNT(*) AS 'Count'
    FROM Rewst_Executions
    WHERE Workflow_Name LIKE In_Workflow_Name;
END //

DELIMITER ;





-- Second Procedure Gets Total Workflow Executions for all Workflows
DELIMITER //

CREATE PROCEDURE CountTotalExecutions()
BEGIN
    SELECT Workflow_Name AS `Workflow Name`, COUNT(*) AS `Count`
    FROM Rewst_Executions
    WHERE `Org_Name` = 'PEAKE Technology Dev' and DATE(End_Time) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY Workflow_Name;
END //

DELIMITER ;






-- Third Procedure Gets Total Time Saved for Each Workflow
DELIMITER //

CREATE PROCEDURE TotalTimeSaved()
BEGIN
    SELECT Workflow_Name AS `Workflow Name`, SUM(Time_Saved) AS `Total Time Saved (Seconds)`
    FROM `Rewst_Executions`
    WHERE `Org_Name` = 'PEAKE Technology Dev'
    GROUP BY Workflow_Name
    ORDER BY `Total Time Saved (Seconds)` DESC;
END //

DELIMITER ;




-- Call the Stored Procedures (Change these values to names that fit your workflow)
CALL CountTotalWorkflowExecutions ('CW PSA Pod: Technician Toolbox');
CALL CountTotalWorkflowExecutions ('%ID%');

CALL TotalTimeSaved;


