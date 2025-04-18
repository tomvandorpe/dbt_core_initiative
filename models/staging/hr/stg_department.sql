with department as (
    SELECT *
    FROM {{ source('AdventureWorks', 'department') }} )


SELECT  departmentid,
        department_name,
        groupname as business_unit,
        modifieddate

FROM department

