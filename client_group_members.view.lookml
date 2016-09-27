- view: client_group_members
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.end_date

  - dimension: ref_client
    type: int
    sql: ${TABLE}.ref_client

  - dimension: ref_group
    type: int
    sql: ${TABLE}.ref_group

  - dimension: ref_type
    type: int
    sql: ${TABLE}.ref_type

  - dimension_group: start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.start_date

  - measure: count
    type: count
    drill_fields: [id]

