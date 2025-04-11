{% macro get_seniority_category(hiredate_column) %}
    case 
        when {{ hiredate_column }} >= cast('2014-01-01' as date) - interval '1 year' then '< 1 year'
        when {{ hiredate_column }} >= cast('2014-01-01' as date) - interval '2 years'
             and {{ hiredate_column }} < cast('2014-01-01' as date) - interval '1 year' then '1 - 2 years'
        when {{ hiredate_column }} >= cast('2014-01-01' as date) - interval '5 years'
             and {{ hiredate_column }} < cast('2014-01-01' as date) - interval '2 years' then '2 - 5 years'
        when {{ hiredate_column }} >= cast('2014-01-01' as date) - interval '10 years'
             and {{ hiredate_column }} < cast('2014-01-01' as date) - interval '5 years' then '5 - 10 years'
        when {{ hiredate_column }} < cast('2014-01-01' as date) - interval '10 years' then '> 10 years'
        else 'Unknown'
    end
{% endmacro %}
