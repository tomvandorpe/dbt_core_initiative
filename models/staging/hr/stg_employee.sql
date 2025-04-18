with employee as(
    select *
    from {{ source('AdventureWorks', 'employee') }}
)

SELECT businessentityid,
       cast(nationalidnumber as integer) as nationalidnumber,
       org,
       organizationlevel,
       birthdate,
       extract(year from age(cast('2014-01-01' as date), birthdate)) as age_in_years,
       gender,
       hiredate,
       {{ get_seniority_category('hiredate') }} AS seniority_category,
       vacationhours,
       sickleavehours,
       modifieddate

FROM employee
