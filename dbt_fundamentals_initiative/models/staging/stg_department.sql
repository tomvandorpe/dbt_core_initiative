SELECT  departmentid,
        department_name,
        groupname as business_unit,
        modifieddate

FROM {{ source('AdventureWorks', 'department') }}


