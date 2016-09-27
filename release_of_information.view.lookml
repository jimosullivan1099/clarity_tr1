- view: release_of_information
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: deleted
    hidden: true
    type: yesno
    sql: ${TABLE}.deleted

  - dimension: documentation
    sql: fn_getPicklistValueName('documentation',${TABLE}.documentation)

  - dimension_group: end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.end_date

  - dimension_group: last_updated
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: location
    sql: ${TABLE}.location

  - dimension: permission
    type: yesno
    sql: ${TABLE}.permission

  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: agency
    sql: ${roi_agencies.name}  

  - dimension: ref_agency_deleted
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency_deleted

  - dimension: ref_client
    hidden: true
    type: int
    sql: ${TABLE}.ref_client

  - dimension: ref_file
    hidden: true
    type: int
    sql: ${TABLE}.ref_file

  - dimension: ref_user
    label: 'User Creating'
    type: int
    sql: ${TABLE}.ref_user

  - dimension: ref_user_updated
    label: 'User Updating'
    type: int
    sql: ${TABLE}.ref_user_updated

  - dimension_group: start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.start_date

  - measure: count
    type: count
    drill_fields: [id]

