

- view: inbound_recidivism
  derived_table:
    sql: |
      select 
         cpd.id AS screen_id
        ,cpd.ref_client AS client_id
        ,cpd.ref_program AS program_id
        ,cpd.housing_status AS housing_status
        ,cpd.added_date AS screen_add_date
        ,cp.start_date AS cp_start_date
        ,count(previous_exits.id) * 1.0 AS previous_exits_number
        ,sum(CASE WHEN cpd.ref_program = previous_exits.ref_program THEN 1.0 END) AS previous_exits_in_same_program
        ,sum(CASE WHEN previous_exits.exit_destination in (10,11,19,20,21,22,23,26,28,3)    THEN 1.0 END) AS previous_exits_with_stable_housing
        ,sum(CASE WHEN previous_exits.exit_destination in (10,11,19,20,21,22,23,26,28,3)   AND cpd.ref_program = previous_exits.ref_program THEN 1.0 END) AS previous_exits_with_stable_housing_in_same_program
        ,max(previous_exits_cp.start_date) AS previous_exit_date
        ,max(CASE WHEN previous_exits.exit_destination in (10,11,19,20,21,22,23,26,28,3)    THEN previous_exits_cp.start_date END ) AS previous_exit_date_with_stable_housing
        ,max(CASE WHEN cpd.ref_program = previous_exits.ref_program  THEN previous_exits_cp.start_date END) AS previous_exit_date_in_same_program
        ,max(CASE WHEN previous_exits.exit_destination in (10,11,19,20,21,22,23,26,28,3)    AND cpd.ref_program = previous_exits.ref_program THEN previous_exits_cp.start_date END) AS previous_exit_date_with_stable_housing_in_same_program
    
      
      from client_program_demographics cpd
      
      inner join client_programs cp
          on cpd.ref_program = cp.id
          
      left join .client_program_demographics previous_exits
          on cpd.ref_client = previous_exits.ref_client
        and previous_exits.screen_type = 4
          
      left join client_programs previous_exits_cp
          on previous_exits.ref_program = previous_exits_cp.id
          
      where 
            cpd.screen_type = 2
        and cp.start_date > previous_exits_cp.end_date
      
      group by 1,2,3,4,5,6
      order by cpd.id, cpd.added_date
            
  fields:
 
  - dimension: screen_id
    primary_key: true
    type: number
    hidden: true
    sql: ${TABLE}.screen_id

  - dimension: client_id
    type: number
    hidden: true
    sql: ${TABLE}.client_id

  - dimension: program_id
    type: number
    hidden: true
    sql: ${TABLE}.program_id

  - dimension: housing_status
    type: number
    hidden: true
    sql: ${TABLE}.housing_status

  - dimension_group: screen_add_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.screen_add_date

  - dimension_group: cp_start
    hidden: true
    type: time
    timeframes: [date]    
    sql: ${TABLE}.cp_start_date



  - measure: count
    type: count
    hidden: true
    drill_fields: detail*
    
  - measure: distinct_client_count
    type: count_distinct
    sql: ${client_id}
    hidden: true

  
  
  - dimension: appeared_before
    type: yesno
    sql: ${previous_exits_number} > 0
  
  - dimension: appeared_before_in_same_program
    type: yesno
    sql: ${previous_exits_in_same_program} > 0

  - dimension: appeared_before_with_stable_housing
    type: yesno
    sql: ${previous_exits_with_stable_housing} > 0

  - dimension: appeared_before_with_stable_housing_in_same_program
    type: yesno
    sql: ${previous_exits_with_stable_housing_in_same_program} > 0


  - measure: count_entries_appeared_before
    type: count
    filters:
      appeared_before: 'Yes'
 
  - measure: count_entries_appeared_before_in_same_program
    type: count
    filters:
      appeared_before_in_same_program: 'Yes'
 
  - measure: count_entries_appeared_before_with_stable_housing
    type: count
    filters:
      appeared_before_with_stable_housing: 'Yes'
 
  - measure: count_entries_appeared_before_with_stable_housing_in_same_program
    type: count
    filters:
      appeared_before_with_stable_housing_in_same_program: 'Yes'

  
  - measure: percent_entries_appeared_before
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_entries_appeared_before} / NULLIF(${entry_screen.count},0)

  - measure: percent_entries_appeared_before_in_same_program
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_entries_appeared_before_in_same_program} / NULLIF(${entry_screen.count},0)

  - measure: percent_entries_appeared_before_with_stable_housing
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_entries_appeared_before_with_stable_housing} / NULLIF(${entry_screen.count},0)

  - measure: percent_entries_appeared_before_with_stable_housing_in_same_program
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_entries_appeared_before_with_stable_housing_in_same_program} / NULLIF(${entry_screen.count},0)


 
  - measure: count_clients_appeared_before
    type: count_distinct
    sql: ${client_id}
    filters:
      appeared_before: 'Yes'
 
  - measure: count_clients_appeared_before_in_same_program
    type: count_distinct
    sql: ${client_id}
    filters:
      appeared_before_in_same_program: 'Yes'
 
  - measure: count_clients_appeared_before_with_stable_housing
    type: count_distinct
    sql: ${client_id}
    drill_fields: [clients.id, clients.full_name, clients.birth_date, programs.name, client_programs.start_date, entry_screen.housing_status_text, previous_exit_with_stable_housing_date]
    filters:
      appeared_before_with_stable_housing: 'Yes'
 
  - measure: count_clients_appeared_before_with_stable_housing_in_same_program
    type: count_distinct
    sql: ${client_id}
    filters:
      appeared_before_with_stable_housing_in_same_program: 'Yes'
 
 
 
  - measure: percent_clients_appeared_before
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_clients_appeared_before} / NULLIF(${clients.count},0)

  - measure: percent_clients_appeared_before_in_same_program
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_clients_appeared_before_in_same_program} / NULLIF(${clients.count},0)

  - measure: percent_clients_appeared_before_with_stable_housing
    type: number
    format: '%0.1f%'
    drill_fields: [programs.name, entry_screen.housing_status_text, clients.count, count_clients_appeared_before_with_stable_housing]
    sql: 100.0 * ${count_clients_appeared_before_with_stable_housing} / nullif(${clients.count},0)

  - measure: percent_clients_appeared_before_with_stable_housing_in_same_program
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_clients_appeared_before_with_stable_housing_in_same_program} / NULLIF(${clients.count},0)
  
  
  - dimension: previous_exits_number
    type: number
    sql: ${TABLE}.previous_exits_number

  - dimension: previous_exits_in_same_program
    type: number
    sql: ${TABLE}.previous_exits_in_same_program

  - dimension: previous_exits_with_stable_housing
    type: number
    sql: ${TABLE}.previous_exits_with_stable_housing

  - dimension: previous_exits_with_stable_housing_in_same_program
    type: number
    sql: ${TABLE}.previous_exits_with_stable_housing_in_same_program

  
  
  - dimension_group: previous_exit
    type: time
    timeframes: [date]    
    sql: ${TABLE}.previous_exit_date

  - dimension_group: previous_exit_in_same_program
    type: time
    timeframes: [date]    
    sql: ${TABLE}.previous_exit_date_in_same_program

  - dimension_group: previous_exit_with_stable_housing
    type: time
    timeframes: [date]    
    sql: ${TABLE}.previous_exit_date_with_stable_housing

  - dimension_group: previous_exit_with_stable_housing_in_same_program
    type: time
    timeframes: [date]    
    sql: ${TABLE}.previous_exit_date_with_stable_housing_in_same_program
    
  
  - dimension: days_since_last_exit
    type: number
    sql: DATEDIFF(${previous_exit_date}, ${cp_start_date})
    
  - dimension: days_since_last_exit_in_same_program
    type: number
    sql: DATEDIFF(${previous_exit_in_same_program_date}, ${cp_start_date})
    
  - dimension: days_since_last_exit_with_stable_housing
    type: number
    sql: DATEDIFF(${previous_exit_with_stable_housing_date}, ${cp_start_date})
    
  - dimension: days_since_last_exit_with_stable_housing_in_same_program
    type: number
    sql: DATEDIFF(${previous_exit_with_stable_housing_in_same_program_date}, ${cp_start_date})
    
    
  - measure: average_days_since_last_exit
    type: average
    sql: ${days_since_last_exit}
    
  - measure: average_days_since_last_exit_in_same_program
    type: average
    sql: ${days_since_last_exit_in_same_program}
    
  - measure: average_days_since_last_exit_with_stable_housing
    type: average
    sql: ${days_since_last_exit_with_stable_housing}
    
  - measure: average_days_since_last_exit_with_stable_housing_in_same_program
    type: average
    sql: ${days_since_last_exit_with_stable_housing_in_same_program}
    
    
  
  sets:
    detail:
      - screen_id
      - client_id
      - program_id
      - housing_status
      - screen_add_date
      - cp_start_date

