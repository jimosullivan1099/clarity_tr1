- view: program_service_items
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: count_days
    type: int
    sql: ${TABLE}.count_days

  - dimension: ref_program
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_service_item
    type: int
    sql: ${TABLE}.ref_service_item

  - measure: count
    type: count
    drill_fields: [id]

