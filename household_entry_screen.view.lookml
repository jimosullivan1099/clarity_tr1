- view: household_entry_screen
  derived_table:
    sql: |
      SELECT  enrollments.ref_household AS `ref_household`,
              SUM(income_individual) as `total_household_income`,
              COUNT(distinct enrollments.ref_client) as `total_household_members`
      FROM  client_programs as enrollments
       INNER JOIN client_program_demographics as cpd
        ON enrollments.id = cpd.ref_program and cpd.screen_type=2
        where (enrollments.deleted=0 or enrollments.deleted is NULL) AND (cpd.deleted IS NULL OR cpd.deleted=0)
       and  {% condition enrollments.start_date %} enrollments.start_date {% endcondition %}
       AND ({% condition enrollments.end_date_or_today_date %} enrollments.end_date {% endcondition %} OR enrollments.end_date IS NULL) 
        group by 1

  fields:


  - dimension: screen_id
    hidden: true
    type: number
    sql: ${TABLE}.id

  - dimension: household_id
    hidden: true
    type: number
    sql: ${TABLE}.ref_household

  - dimension: total_household_income
    group_label: 'Household Demographics'
    type: number
    value_format_name: usd    
    sql: ${TABLE}.total_household_income

  - dimension: total_household_annual_income
    group_label: 'Household Demographics'
    type: number
    value_format_name: usd    
    sql: ${TABLE}.total_household_income * 12

    
  - dimension: total_household_clients
    group_label: 'Household Demographics'
    type: number
    sql: ${TABLE}.total_household_members
    
  - dimension: area_median_income_in_dollars
    type: number
    hidden: true
    sql: |
          (select income_amount from area_median_incomes where ref_county = ${agencies.ref_county} 
          and persons_count = ${TABLE}.total_household_members and income_amount < (${TABLE}.total_household_income * 12) order by income_amount desc limit 1)

  - dimension: area_median_income_internal
    hidden: true
    type: number
    group_label: 'household demographics'
    sql: |
          (select ref_income_type from area_median_incomes where ref_county = ${agencies.ref_county} 
          and persons_count = ${TABLE}.total_household_members and income_amount < (${TABLE}.total_household_income * 12) order by income_amount desc limit 1)
          
    
  - dimension: area_median_income
    group_label: 'Household Demographics'
    sql_case:
            Below 30% Median: ${total_household_income} >= 0 and ${area_median_income_internal} is null
            30% Median: ${area_median_income_internal} = 1
            Very Low Income: ${area_median_income_internal} = 2
            Low Income: ${area_median_income_internal} = 3
            else: unknown


  sets:
    detail:
      - household_id
