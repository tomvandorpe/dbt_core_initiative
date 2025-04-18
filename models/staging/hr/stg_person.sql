with person as (
    select *
    from {{ source('AdventureWorks', 'person') }}
)

select businessentityid,
       persontype,
       firstname,
       lastname,
       CONCAT(firstname, ' ', lastname) as full_name,
       modifieddate
from person