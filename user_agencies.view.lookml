- view: user_agencies
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_agency
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_user
    type: int
    sql: ${TABLE}.ref_user

  - measure: count
    type: count
    drill_fields: [id]

