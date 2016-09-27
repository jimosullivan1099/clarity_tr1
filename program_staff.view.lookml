- view: program_staff
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_program
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_user
    type: int
    sql: ${TABLE}.ref_user

  - measure: count
    type: count
    drill_fields: [id]

