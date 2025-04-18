with department_history as
( SELECT businessentityid,
         departmentid,
         startdate,
         enddate

FROM {{ref("stg_department_history")}}   

WHERE enddate IS NULL  ),


department as 
( SELECT departmentid,
        department_name,
        business_unit

FROM {{ref("stg_department")}} ),

department_master as 
( SELECT department_history.businessentityid,
         department_history.departmentid,
         department_history.startdate,
         department_history.enddate,
         department.department_name,
         department.business_unit
         
FROM department_history

LEFT JOIN department
ON department_history.departmentid = department.departmentid   )

SELECT * from department_master

