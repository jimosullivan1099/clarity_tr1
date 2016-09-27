- view: service_items_housing
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

  - dimension: availability
    type: number
    sql: ${TABLE}.availability

  - dimension: beds_with_children
    type: int
    sql: ${TABLE}.beds_with_children

  - dimension: beds_wo_children
    type: int
    sql: ${TABLE}.beds_wo_children

  - dimension: deleted
    type: int
    sql: ${TABLE}.deleted

  - dimension_group: information
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.information_date

  - dimension: inventory_type
    bypass_suggest_restrictions: true
    sql: fn_getPicklistValueName('inventory_type',${TABLE}.inventory_type)     

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

#   - dimension: program_warning
#     type: int
#     sql: ${TABLE}.program_warning
# 
#   - dimension: ref_agency_deleted
#     type: int
#     sql: ${TABLE}.ref_agency_deleted

  - dimension: ref_bed_type
    label: 'bed type'
    bypass_suggest_restrictions: true
    sql: fn_getPicklistValueName('bed_types',${TABLE}.ref_bed_type)   


  - dimension: ref_household_type
    label: 'household type'
    bypass_suggest_restrictions: true
    sql: fn_getPicklistValueName('household_types',${TABLE}.ref_household_types)   


  - dimension: ref_service_item
    hidden: true
    type: int
    sql: ${TABLE}.ref_service_item

  - dimension: ref_service_type
    hidden: true
    type: number
    sql: ${TABLE}.ref_service_type

# 
  - dimension: ref_user_updated 
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)

#   - dimension: reservation
#     type: int
#     sql: ${TABLE}.reservation
# 
#   - dimension: reservation_term
#     type: int
#     sql: ${TABLE}.reservation_term
# 
#   - dimension: reservation_type
#     type: int
#     sql: ${TABLE}.reservation_type

  - dimension: units_with_children
    type: int
    sql: ${TABLE}.units_with_children

  - dimension: youth_inventory_type
    type: int
    sql: ${TABLE}.youth_inventory_type

  - measure: count
    type: count
    drill_fields: [id]

