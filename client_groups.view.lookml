- view: client_groups
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: date_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension: ref_client
    type: int
    sql: ${TABLE}.ref_client

  - measure: count
    type: count
    drill_fields: [id]

