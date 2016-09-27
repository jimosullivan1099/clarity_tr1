- view: assessment_measures
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: color
    type: int
    sql: ${TABLE}.color

  - dimension: ref_agency
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_assessment
    type: int
    sql: ${TABLE}.ref_assessment

  - dimension: ref_field
    type: int
    sql: ${TABLE}.ref_field

  - measure: count
    type: count
    drill_fields: [id]

