- view: counties
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: code
    type: int
    sql: ${TABLE}.code

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: name
    sql: ${TABLE}.name

  - dimension: ref_state
    label: 'StateID'
    type: int
    sql: ${TABLE}.ref_state

  - measure: count
    type: count
    drill_fields: [id, name]

