- view: service_items
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

#   - dimension: adjustable
#     type: yesno
#     sql: ${TABLE}.adjustable
# 
#   - dimension: allow_groups
#     type: yesno
#     sql: ${TABLE}.allow_groups
# 
#   - dimension: charge_attendance
#     type: int
#     sql: ${TABLE}.charge_attendance
# 
#   - dimension: default_amount
#     type: number
#     sql: ${TABLE}.default_amount
# 
#   - dimension_group: end_availability
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.end_availability
# 
#   - dimension: expense_type
#     type: yesno
#     sql: ${TABLE}.expense_type
# 
#   - dimension: geocode
#     sql: ${TABLE}.geocode
# 
#   - dimension: is_employment
#     type: yesno
#     sql: ${TABLE}.is_employment
# 
#   - dimension: is_service
#     type: yesno
#     sql: ${TABLE}.is_service
# 
#   - dimension_group: last_updated
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.last_updated
# 
  - dimension: name
    bypass_suggest_restrictions: true
    sql: ${TABLE}.name
# 
#   - dimension: program_option
#     type: yesno
#     sql: ${TABLE}.program_option
# 
#   - dimension: ref_charge_type
#     type: int
#     sql: ${TABLE}.ref_charge_type
# 
  - dimension: ref_delivery_type
    type: int
    sql: ${TABLE}.ref_delivery_type
    
  - dimension: deleted
    type: yesno
    sql: ${TABLE}.deleted    

#   - dimension: ref_funding
#     type: int
#     sql: ${TABLE}.ref_funding

  - dimension: ref_service
    hidden: true
    type: int
    sql: ${TABLE}.ref_service

#   - dimension: ref_user_updated
#     type: int
#     sql: ${TABLE}.ref_user_updated

#   - dimension: si_cat1
#     type: int
#     sql: ${TABLE}.si_cat1
# 
#   - dimension: si_cat2
#     type: int
#     sql: ${TABLE}.si_cat2
# 
#   - dimension: si_cat3
#     type: int
#     sql: ${TABLE}.si_cat3

#   - dimension_group: start_availability
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: false
#     sql: ${TABLE}.start_availability


