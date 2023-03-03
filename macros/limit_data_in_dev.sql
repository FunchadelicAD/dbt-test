{% macro limit_data_in_dev(column_name, days_of_data=365 )%}
{% if target.name == 'default' %}
where {{column_name}} >= dateadd('day', - {{days_of_data}}, current_timestamp)
{% endif %}
{%endmacro%}