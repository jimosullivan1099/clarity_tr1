- view: client_program_members
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_client_program
    type: int
    sql: ${TABLE}.ref_client_program

  - dimension: ref_member
    type: int
    sql: ${TABLE}.ref_member

  - dimension: ref_member_program
    type: int
    sql: ${TABLE}.ref_member_program

  - measure: count
    type: count
    drill_fields: [id]

