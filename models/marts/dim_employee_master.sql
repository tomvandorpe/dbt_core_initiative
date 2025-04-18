with employees as 
(SELECT businessentityid,
       org,
       organizationlevel,
       birthdate,
       gender,
       hiredate,
       full_name,
       seniority_category,
       age_in_years

from {{ref("int_employees")}} ),



department as 
( SELECT businessentityid, 
         departmentid,
         department_name,
         business_unit,
         startdate,
         enddate

FROM {{ref("int_department")}} ),


employee_master as 
( SELECT employees.businessentityid,
       employees.org,
       employees.organizationlevel,
       employees.birthdate,
       employees.gender,
       employees.hiredate,
       employees.full_name,
       employees.seniority_category,
       employees.age_in_years,
       department.departmentid,
       department.department_name,
       department.business_unit,
       department.startdate,
       department.enddate

FROM employees

LEFT JOIN department
ON employees.businessentityid = department.businessentityid  )

SELECT * FROM employee_master