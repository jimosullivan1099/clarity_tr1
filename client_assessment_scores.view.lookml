- view: client_assessment_scores
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: detail
    hidden: true
    sql: ${TABLE}.detail

  - dimension: ref_assessment
    hidden: true
    type: int
    sql: ${TABLE}.ref_assessment

  - dimension: score
    type: int
    sql: ${TABLE}.score
    
  - dimension: score_type
    sql: ${TABLE}.score_type
    
  - dimension: a
    sql: COLUMN_GET(${TABLE}.detail,'a' as INT)

  - dimension: b
    sql: COLUMN_GET(${TABLE}.detail,'b' as INT)
      
  - dimension: c
    sql: COLUMN_GET(${TABLE}.detail,'c' as INT)
    
  - dimension: d
    sql: COLUMN_GET(${TABLE}.detail,'d' as INT)
    
  - dimension: e
    sql: COLUMN_GET(${TABLE}.detail,'e' as INT)
    
  - measure: count
    type: count
    drill_fields: [id]

