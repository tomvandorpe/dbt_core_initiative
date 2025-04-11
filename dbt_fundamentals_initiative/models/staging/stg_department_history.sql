SELECT 
    businessentityid,
    departmentid,
    shiftid,
    startdate,
    enddate,
    modifieddate
FROM {{ source('AdventureWorks', 'employeedepartmenthistory') }}