- view: service_dates
  sql_table_name: |
    client_service_dates
  fields:

  - dimension: id
    primary_key: true
    hidden: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension_group: date
    type: time
    timeframes: [date, week, month, raw]
    convert_tz: false
    sql: ${TABLE}.date

  - dimension_group: last_updated
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: ref_client_service
    hidden: true
    type: int
    sql: ${TABLE}.ref_client_service

  - dimension: ref_user
    hidden: true
    type: int
    sql: ${TABLE}.ref_user

  - dimension: ref_user_updated
    hidden: true
    type: int
    sql: ${TABLE}.ref_user_updated

  - dimension: time
    hidden: true
    sql: ${TABLE}.time

  - measure: count
    type: count
    drill_fields: [id]

