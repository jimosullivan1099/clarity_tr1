- view: referral_connections
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_client_program
    type: int
    sql: ${TABLE}.ref_client_program

  - dimension: ref_referral
    type: int
    sql: ${TABLE}.ref_referral

  - measure: count
    type: count
    drill_fields: [id]

