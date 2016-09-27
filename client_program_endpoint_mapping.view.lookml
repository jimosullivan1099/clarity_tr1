- view: client_program_endpoint_mapping
  derived_table:
    sql: |
      SELECT
        ref_client
        ,ref_program
        ,count(*) as number_of_screenings
        ,max(
          case when screen_type = 4
          then id end)
          AS last_exit_screen_id
        ,max(
          case when screen_type = 4
          then program_date end)
          AS last_exit_screen_date
        ,max(
          case when screen_type = 6
          then id end)
          AS last_annual_screen_id
        ,max(
          case when screen_type = 6
          then program_date end)
          AS last_annual_screen_date
        
      FROM 
      client_program_demographics
      
      WHERE
      screen_type != 2
      
      GROUP BY 1,2
      
 

  fields:
  - measure: count
    hidden: true
    type: count
    drill_fields: detail*

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

  - dimension: last_exit_screen_id
    type: int
    sql: ${TABLE}.last_exit_screen_id

  - dimension: last_exit_screen_date
    hidden: true
    sql: ${TABLE}.last_exit_screen_date

  - dimension: last_annual_screen_id
    type: int
    sql: ${TABLE}.last_annual_screen_id

  - dimension: last_annual_screen_date
    hidden: true
    sql: ${TABLE}.last_annual_screen_date
    
  - dimension: last_screening_to_analyze
    type: int
    sql: COALESCE(${last_exit_screen_id},${last_annual_screen_id})
      

  sets:
    detail:
      - ref_client
      - ref_program
      - number_of_screenings
      - last_exit_screen_id
      - last_exit_screen_date
      - last_annual_screen_id
      - last_annual_screen_date

