- view: assessment_processors
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: class_name
    sql: ${TABLE}.class_name

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: name
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name, class_name]

