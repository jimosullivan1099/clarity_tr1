- view: client_program_screening_base
  derived_table:
    sql: |
      SELECT
        cpd.ref_client
        ,cpd.ref_program
        ,count(*) as number_of_screenings
        ,min(
          case when screen_type = 2
          then cpd.id end)
          AS first_entry_screen_id

        ,max(
          case when screen_type IN (3,6)
          then cpd.id end)
          AS last_update_screen_id
  
        ,max(
          case when screen_type = 4
          then cpd.id end)
          AS last_exit_screen_id

        ,max(
          case when screen_type = 6
          then cpd.id end)
          AS last_annual_screen_id
        
      FROM 
      client_program_demographics cpd 
      INNER JOIN client_programs cp on cpd.ref_program = cp.id
      WHERE {% condition enrollments.start_date %} cp.start_date {% endcondition %}
      AND ({% condition enrollments.end_date_or_today_date %} cp.end_date {% endcondition %}
        OR cp.end_date IS NULL) and (cp.deleted is NULL or cp.deleted = 0) 
      AND (cpd.deleted is NULL or cpd.deleted = 0) AND cpd.program_date is not NULL
      
      GROUP BY 1,2
      
 

  fields:
  

#   - filter: start
#     type: time
#     timeframes: [date]
    
   
   
  - dimension: ref_client
    hidden: true
    type: number
    sql: ${TABLE}.ref_client

  - dimension: ref_program
    hidden: true
    type: number
    sql: ${TABLE}.ref_program

  - dimension: number_of_screenings
    hidden: true
    type: number
    sql: ${TABLE}.number_of_screenings


  - dimension: first_entry_screen_id
    type: int
    hidden: true
    sql: ${TABLE}.first_entry_screen_id
    
  - dimension: last_exit_screen_id
    type: int
    hidden: true
    sql: ${TABLE}.last_exit_screen_id

  - dimension: last_update_screen_id
    type: int
    hidden: true
    sql: ${TABLE}.last_update_screen_id


  - dimension: last_annual_screen_id
    type: int
    hidden: true
    sql: ${TABLE}.last_annual_screen_id

    

  - dimension: last_screening_to_analyze
    type: int
    hidden: true
    sql: COALESCE(${last_exit_screen_id},${last_update_screen_id})
      

  sets:
    detail:
      - ref_client
      - ref_program
      - number_of_screenings
      - last_exit_screen_id
      - last_exit_screen_date
      - last_annual_screen_id
      - last_annual_screen_date

