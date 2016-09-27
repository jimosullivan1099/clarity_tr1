- view: program_services
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_program
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_service
    type: int
    sql: ${TABLE}.ref_service

  - measure: count
    type: count
    drill_fields: [id]

