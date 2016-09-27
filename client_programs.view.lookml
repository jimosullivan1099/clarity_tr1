- view: enrollments
  sql_table_name: |
    client_programs
  fields:

  - dimension: id
    label: 'Project Entry Id'
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - filter: date_filter
    label: 'Reporting Period Filter'
    type: date
    sql: |
      ${start_raw} <= {% date_end date_filter %} 
      AND (${end_raw} >= {% date_start date_filter %} OR ${end_raw} is NULL)


  - dimension_group: added
    label: 'Date Created'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension_group: end
    label: 'Exit Date'
    type: time
    timeframes: [date, week, month, year, raw]
    convert_tz: false
    sql: ${TABLE}.end_date
    
  - dimension: end_date_or_today
    label: 'Exit Date Filter'
    type: time
    timeframes: [date] 
    sql: COALESCE(${end_date},NOW())

  - dimension_group: last_updated
    label: 'Date Updated'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: ref_agency
    hidden: true
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client
    hidden: true
    label: 'Personal Id'
    type: int
    sql: ${TABLE}.ref_client

  - dimension: ref_client_group
    # removed because its not a data standard
    label: 'Global Household Id (Profile Household)' 
    type: int
    sql: ${TABLE}.ref_client_group

  - dimension: ref_department
    hidden: true
    type: int
    sql: ${TABLE}.ref_department

  - dimension: ref_head
    hidden: true
    type: int
    sql: ${TABLE}.ref_head

  - dimension: head_of_household
    type: yesno
    sql: ${TABLE}.ref_head = ${TABLE}.ref_client

  - measure: count_households
    type: count_distinct
    sql: ${ref_client}
    drill_fields: [id, ref_household, clients.id, clients.full_name, start_date, end_date]
    filters:
      head_of_household: yes
      
  - measure: count_chronic_homeless_households
    type: count_distinct
    sql: ${ref_client}
    filters:
      head_of_household: yes
      entry_screen.chronic_homeless_calculation: Yes

  - dimension: ref_household
    label: 'Household Id'
    type: int
    sql: ${TABLE}.ref_household

  - dimension: ref_program
    label: 'Project Id'
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_user 
    label: 'User Creating'
    sql: fn_getUserNameById(${TABLE}.ref_user)

  - dimension: assigned_staff
    sql: CONCAT(${members.first_name},' ',${members.last_name})

  - dimension: ref_user_updated 
    label: 'User Updating'
    sql: fn_getUserNameById(${TABLE}.ref_user_updated)

  - dimension_group: start
    label: 'Entry Date'
    type: time
    timeframes: [date, week, month, year, raw]
    convert_tz: false
    sql: ${TABLE}.start_date
    
  - dimension: days_since_start
    label: 'Days in Project'
    bypass_suggest_restrictions: true
    suggest_dimension: 
    type: int
    sql: DATEDIFF(COALESCE(${end_date},NOW()),${start_date})
    
  - dimension: days_since_start_tier
    label: 'Days in Project Tier'
    type: tier
    style: integer
    tiers: [0,3,7,30,90,180,365,730,10000]
    sql: ${days_since_start}


  - measure: average_duration
    label: 'Average Days in Project'
    type: average
    sql: ${days_since_start}
    
  - measure: last_exit
    label: 'Last Exit'
    type: date
    sql: |
      CASE
      WHEN MAX( COALESCE(${end_date},'2099-12-31')) = '2099-12-31' THEN
      NULL
      ELSE MAX( COALESCE(${end_date},'2099-12-31'))
      END
      
  - measure: last_entry
    label: 'Last Entry'
    type: date
    sql: MAX(${start_date})
      



  - dimension: still_in_program
    label: 'Active in Project'
    type: yesno
    sql: ${end_date} IS NULL

  - dimension: status
    hidden: true
    type: int
    sql: ${TABLE}.status
    
#   - dimension: status_text
#     sql: fn_getPicklistValueName('status',${status})

  - dimension: type
    hidden: true
    type: int
    sql: ${TABLE}.type

  - dimension: enrollment_type
    label: 'Individual or Family '
    type: string
    bypass_suggest_restrictions: true
    sql_case:
            Individual: ${type} = 1
            Family: ${type} = 2
            else: unknown


    
  - measure: count
    type: count
      
      

