- view: program_assessments
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_assessment
    type: int
    sql: ${TABLE}.ref_assessment

  - dimension: ref_program
    type: int
    sql: ${TABLE}.ref_program

  - measure: count
    type: count
    drill_fields: [id]

