with department_history as
( SELECT * from {{ source('AdventureWorks', 'employeedepartmenthistory') }})


SELECT 
    businessentityid,
    departmentid,
    shiftid,
    startdate,
    enddate,
    modifieddate
FROM department_history