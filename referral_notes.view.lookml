- view: referral_notes
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: deleted
    type: int
    sql: ${TABLE}.deleted

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: ref_agency_deleted
    type: int
    sql: ${TABLE}.ref_agency_deleted

  - dimension: ref_message
    type: int
    sql: ${TABLE}.ref_message

  - dimension: ref_referral
    type: int
    sql: ${TABLE}.ref_referral

  - dimension: ref_user
    type: int
    sql: ${TABLE}.ref_user

  - dimension: ref_user_updated
    type: int
    sql: ${TABLE}.ref_user_updated

  - measure: count
    type: count
    drill_fields: [id]

