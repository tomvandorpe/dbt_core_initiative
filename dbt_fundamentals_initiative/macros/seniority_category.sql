{% macro get_seniority_category(hiredate_column, reference_date="cast('2014-01-01' as date)") %}
    {% set intervals = [
        (1, '< 1 year'),
        (2, '1 - 2 years'),
        (5, '2 - 5 years'),
        (10, '5 - 10 years')
    ] %}
    
    case
        {% for i, label in intervals %}
            {% if loop.first %}
                when {{ hiredate_column }} >= {{ reference_date }} - interval '{{ i }} year' then '{{ label }}'
            {% else %}
                when {{ hiredate_column }} >= {{ reference_date }} - interval '{{ i }} years'
                     and {{ hiredate_column }} < {{ reference_date }} - interval '{{ intervals[loop.index0 - 1][0] }} years' then '{{ label }}'
            {% endif %}
        {% endfor %}
        when {{ hiredate_column }} < {{ reference_date }} - interval '10 years' then '> 10 years'
        else 'Unknown'
    end
{% endmacro %}

