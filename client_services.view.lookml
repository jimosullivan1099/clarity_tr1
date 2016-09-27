- view: client_services
  fields:

  - dimension: id
    hidden: true
    primary_key: true
    type: int
    sql: ${TABLE}.id

#   - dimension_group: added
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.added_date

  - dimension_group: end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.end_date

#   - dimension: expamount
#     type: number
#     sql: ${TABLE}.expamount
# 
#   - dimension_group: last_updated
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.last_updated

#   - dimension: private
#     type: yesno
#     sql: ${TABLE}.private
# 
  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client
    hidden: true
    type: int
    sql: ${TABLE}.ref_client

#   - dimension: ref_department
#     type: int
#     sql: ${TABLE}.ref_department

  - dimension: ref_service_item
    hidden: true
    type: int
    sql: ${TABLE}.ref_service_item
    
  - dimension: deleted
    hidden: true
    type: int
    sql: ${TABLE}.deleted  

  - dimension: ref_user 
    label: 'User Creating'
    sql: fn_getUserNameById(${TABLE}.ref_user)

  - dimension: ref_user_updated 
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)

  - dimension_group: start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.start_date
    

  - dimension: days_of_longterm_service
    label: 'Days of Service (long term)'
    bypass_suggest_restrictions: true
    suggest_dimension: 
    type: int
    sql: DATEDIFF(COALESCE(${end_date},NOW()),${start_date})    
    
 

  - measure: count
    type: count

