- view: client_service_programs
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_agency
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client_program
    type: int
    sql: ${TABLE}.ref_client_program

  - dimension: ref_client_service
    type: int
    sql: ${TABLE}.ref_client_service

  - measure: count
    type: count
    drill_fields: [id]

