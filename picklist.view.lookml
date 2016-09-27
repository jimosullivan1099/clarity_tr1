- view: picklist
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: code
    sql: ${TABLE}.code

  - dimension: field_name
    sql: ${TABLE}.field_name

  - dimension: ref_field
    type: int
    sql: ${TABLE}.ref_field

  - dimension: sort
    type: int
    sql: ${TABLE}.sort

  - dimension: value_name
    sql: ${TABLE}.value_name

  - measure: count
    type: count
    drill_fields: [id, value_name, field_name]

