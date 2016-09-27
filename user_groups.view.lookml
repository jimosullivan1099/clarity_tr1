- view: user_groups
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: name
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]

