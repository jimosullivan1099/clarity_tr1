- view: household_makeup
  derived_table:
    indexes: [ref_household]
    sql: |
      SELECT  enrollments.ref_household AS `ref_household`,
        COUNT(DISTINCT CASE WHEN (YEAR(DATE(enrollments.start_date)) - YEAR(DATE(clients.birth_date)) - (DATE_FORMAT(DATE(enrollments.start_date), '%m%d') < DATE_FORMAT(DATE(clients.birth_date), '%m%d')) >= 18) THEN enrollments.ref_client ELSE NULL END) AS `count_adults`,
        COUNT(DISTINCT CASE WHEN (YEAR(DATE(enrollments.start_date)) - YEAR(DATE(clients.birth_date)) - (DATE_FORMAT(DATE(enrollments.start_date), '%m%d') < DATE_FORMAT(DATE(clients.birth_date), '%m%d')) < 18) THEN enrollments.ref_client ELSE NULL END) AS `count_children`
      FROM  client_programs as enrollments
       LEFT JOIN clients
       AS clients ON enrollments.ref_client = clients.id
      INNER JOIN household  AS household ON enrollments.ref_household = household.id 
      WHERE {% condition enrollments.start_date %} enrollments.start_date {% endcondition %}
      AND ({% condition enrollments.end_date_or_today_date %} enrollments.end_date {% endcondition %}
        OR enrollments.end_date IS NULL)
      group by enrollments.ref_household
    
     
  fields:

  - measure: count
    type: count
    drill_fields: detail*

  - dimension: id
    hidden: true
    type: number
    sql: ${TABLE}.ref_household

  - dimension: count_adults
    hidden: true
    type: number
    sql: ${TABLE}.count_adults

  - dimension: count_children
    hidden: true
    type: number
    sql: ${TABLE}.count_children

  - dimension: household_type 
    type: string
    sql_case:
            Household with Children: ${count_adults} > 0 and ${count_children} >0
            Household without Children: ${count_adults} > 0 and ${count_children} = 0
            Households with only Children: ${count_adults} = 0 and ${count_children} > 0
            else: Unknown 

#   - dimension: total_clients
#     sql: |
#          (Select count(distinct ref_client) from client_programs where ref_household = ${TABLE}.ref_household)


  sets:
    detail:
      - enrollmentsref_household
      - householdcount_adults
      - householdcount_children

