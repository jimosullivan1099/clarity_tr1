- view: client_program_demographics
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date


  - dimension: benefit_snap
    type: int
    sql: ${TABLE}.benefit_snap

  - dimension: benefits_medicaid
    type: int
    sql: ${TABLE}.benefits_medicaid

  - dimension: benefits_medicare
    type: int
    sql: ${TABLE}.benefits_medicare

  - dimension: benefits_no_insurance
    type: int
    sql: ${TABLE}.benefits_no_insurance

  - dimension: benefits_noncash
    type: int
    sql: ${TABLE}.benefits_noncash

  - dimension: benefits_other
    type: int
    sql: ${TABLE}.benefits_other

  - dimension: benefits_other_source
    sql: ${TABLE}.benefits_other_source

  - dimension: benefits_private_insurance
    type: int
    sql: ${TABLE}.benefits_private_insurance

  - dimension: benefits_schip
    type: int
    sql: ${TABLE}.benefits_schip

  - dimension: benefits_section8
    type: int
    sql: ${TABLE}.benefits_section8

  - dimension: benefits_tanf_childcare
    type: int
    sql: ${TABLE}.benefits_tanf_childcare

  - dimension: benefits_tanf_other
    type: int
    sql: ${TABLE}.benefits_tanf_other

  - dimension: benefits_tanf_transportation
    type: int
    sql: ${TABLE}.benefits_tanf_transportation

  - dimension: benefits_temp_rent
    type: int
    sql: ${TABLE}.benefits_temp_rent

  - dimension: benefits_va_medical
    type: int
    sql: ${TABLE}.benefits_va_medical

  - dimension: benefits_wic
    type: int
    sql: ${TABLE}.benefits_wic


  - dimension: chronic_1
    type: int
    sql: ${TABLE}.chronic_1

  - dimension: chronic_2
    type: int
    sql: ${TABLE}.chronic_2

  - dimension: chronic_3
    type: int
    sql: ${TABLE}.chronic_3

  - dimension: chronic_4
    type: int
    sql: ${TABLE}.chronic_4

  - dimension: chronic_5
    type: int
    sql: ${TABLE}.chronic_5

  - dimension: chronic_homeless
    type: int
    sql: ${TABLE}.chronic_homeless

  - dimension: chronic_homeless_calculation
    sql:    CASE WHEN ${client_programs.head_of_household} = 1 AND ${TABLE}.disabled = 1 AND  ( ${TABLE}.chronic_1 = 1 OR  ${TABLE}.chronic_2 = 4) THEN 'Chronic Homeless'    ELSE 'Not Chronic Homeless'    END

 
  - dimension: client_location
    sql: ${TABLE}.client_location

  - dimension: disabled
    type: int
    sql: ${TABLE}.disabled

  - dimension: exit_destination
    type: int
    sql: ${TABLE}.exit_destination

  - dimension: exit_destination_other
    sql: ${TABLE}.exit_destination_other

  - dimension: exit_reason
    type: int
    sql: ${TABLE}.exit_reason

  - dimension: gross_ann_hsld_income
    type: number
    sql: ${TABLE}.gross_ann_hsld_income

  - dimension: gross_ann_ind_income
    type: number
    sql: ${TABLE}.gross_ann_ind_income

  - dimension: health_chronic
    type: int
    sql: ${TABLE}.health_chronic

  - dimension: health_chronic_documented
    type: int
    sql: ${TABLE}.health_chronic_documented

  - dimension: health_chronic_longterm
    type: int
    sql: ${TABLE}.health_chronic_longterm

  - dimension: health_chronic_services
    type: int
    sql: ${TABLE}.health_chronic_services

  - dimension: health_dev_disability
    type: int
    sql: ${TABLE}.health_dev_disability

  - dimension: health_dev_disability_documented
    type: int
    sql: ${TABLE}.health_dev_disability_documented

  - dimension: health_dev_disability_independence
    type: int
    sql: ${TABLE}.health_dev_disability_independence

  - dimension: health_dev_disability_services
    type: int
    sql: ${TABLE}.health_dev_disability_services

  - dimension: health_dv
    type: int
    sql: ${TABLE}.health_dv

  - dimension: health_dv_occurred
    type: int
    sql: ${TABLE}.health_dv_occurred

  - dimension: health_general
    type: int
    sql: ${TABLE}.health_general

  - dimension: health_hiv
    type: int
    sql: ${TABLE}.health_hiv

  - dimension: health_hiv_documented
    type: int
    sql: ${TABLE}.health_hiv_documented

  - dimension: health_hiv_independence
    type: int
    sql: ${TABLE}.health_hiv_independence

  - dimension: health_hiv_services
    type: int
    sql: ${TABLE}.health_hiv_services

  - dimension: health_ins_cobra
    type: int
    sql: ${TABLE}.health_ins_cobra

  - dimension: health_ins_emp
    type: int
    sql: ${TABLE}.health_ins_emp

  - dimension: health_ins_ppay
    type: int
    sql: ${TABLE}.health_ins_ppay

  - dimension: health_ins_state
    type: int
    sql: ${TABLE}.health_ins_state

  - dimension: health_insurance
    type: int
    sql: ${TABLE}.health_insurance

  - dimension: health_mental
    type: int
    sql: ${TABLE}.health_mental

  - dimension: health_mental_confirmed
    type: int
    sql: ${TABLE}.health_mental_confirmed

  - dimension: health_mental_documented
    type: int
    sql: ${TABLE}.health_mental_documented

  - dimension: health_mental_longterm
    type: int
    sql: ${TABLE}.health_mental_longterm

  - dimension: health_mental_services
    type: int
    sql: ${TABLE}.health_mental_services

  - dimension: health_mental_smi
    type: int
    sql: ${TABLE}.health_mental_smi

  - dimension: health_phys_disability
    type: int
    sql: ${TABLE}.health_phys_disability

  - dimension: health_phys_disability_documented
    type: int
    sql: ${TABLE}.health_phys_disability_documented

  - dimension: health_phys_disability_longterm
    type: int
    sql: ${TABLE}.health_phys_disability_longterm

  - dimension: health_phys_disability_services
    type: int
    sql: ${TABLE}.health_phys_disability_services

  - dimension: health_pregnancy
    type: int
    sql: ${TABLE}.health_pregnancy

  - dimension_group: health_pregnancy
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.health_pregnancy_date

  - dimension: health_substance_abuse
    type: int
    sql: ${TABLE}.health_substance_abuse

  - dimension: health_substance_abuse_confirmed
    type: int
    sql: ${TABLE}.health_substance_abuse_confirmed

  - dimension: health_substance_abuse_documented
    type: int
    sql: ${TABLE}.health_substance_abuse_documented

  - dimension: health_substance_abuse_longterm
    type: int
    sql: ${TABLE}.health_substance_abuse_longterm

  - dimension: health_substance_abuse_services
    type: int
    sql: ${TABLE}.health_substance_abuse_services

  - dimension: housing_ass_exit
    type: int
    sql: ${TABLE}.housing_ass_exit

  - dimension: housing_ass_exit_1
    type: int
    sql: ${TABLE}.housing_ass_exit_1

  - dimension: housing_ass_exit_2
    type: int
    sql: ${TABLE}.housing_ass_exit_2

  - dimension: housing_status
    type: int
    sql: ${TABLE}.housing_status

  - dimension: income_cash
    type: number
    sql: ${TABLE}.income_cash

  - dimension: income_cash_is
    type: int
    sql: ${TABLE}.income_cash_is

  - dimension: income_childsupport
    type: number
    sql: ${TABLE}.income_childsupport

  - dimension: income_childsupport_is
    type: int
    sql: ${TABLE}.income_childsupport_is

  - dimension: income_earned
    type: number
    sql: ${TABLE}.income_earned

  - dimension: income_earned_is
    type: int
#     hidden: true
    sql: ${TABLE}.income_earned_is

  - dimension: income_status
    sql: |
      CASE
      WHEN ${income_earned_is} = 1 THEN 'Has Income'
      WHEN ${income_earned_is} = 0 THEN 'No Income'
      ELSE 'Not Asked'
      END

  - measure: count_with_income
    type: count_distinct
    sql: ${ref_client}
    filters:
      income_status: 'Has Income'
      
  - measure: count_asked_about_income
    hidden: true
    type: count_distinct
    sql: ${ref_client}
    filters:
      income_status: No Income,Has Income
      
    
      
  - measure: percent_with_income
    type: number
    format: '%0.1f%'
    sql: 100.0 * ${count_with_income} / NULLIF(${count_asked_about_income},0)

  - dimension: income_ga
    type: number
    sql: ${TABLE}.income_ga

  - dimension: income_ga_is
    type: int
    sql: ${TABLE}.income_ga_is

  - dimension: income_individual
    type: number
    sql: ${TABLE}.income_individual

  - dimension: income_other
    type: number
    sql: ${TABLE}.income_other

  - dimension: income_other_is
    type: int
    sql: ${TABLE}.income_other_is

  - dimension: income_other_source
    sql: ${TABLE}.income_other_source

  - dimension: income_private_disability
    type: number
    sql: ${TABLE}.income_private_disability

  - dimension: income_private_disability_is
    type: int
    sql: ${TABLE}.income_private_disability_is

  - dimension: income_private_pension
    type: number
    sql: ${TABLE}.income_private_pension

  - dimension: income_private_pension_is
    type: int
    sql: ${TABLE}.income_private_pension_is

  - dimension: income_spousal_support
    type: number
    sql: ${TABLE}.income_spousal_support

  - dimension: income_spousal_support_is
    type: int
    sql: ${TABLE}.income_spousal_support_is

  - dimension: income_ss_retirement
    type: number
    sql: ${TABLE}.income_ss_retirement

  - dimension: income_ss_retirement_is
    type: int
    sql: ${TABLE}.income_ss_retirement_is

  - dimension: income_ssdi
    type: number
    sql: ${TABLE}.income_ssdi

  - dimension: income_ssdi_is
    type: int
    sql: ${TABLE}.income_ssdi_is

  - dimension: income_ssi
    type: number
    sql: ${TABLE}.income_ssi

  - dimension: income_ssi_is
    type: int
    sql: ${TABLE}.income_ssi_is

  - dimension: income_tanf
    type: number
    sql: ${TABLE}.income_tanf

  - dimension: income_tanf_is
    type: int
    sql: ${TABLE}.income_tanf_is

  - dimension: income_unemployment
    type: number
    sql: ${TABLE}.income_unemployment

  - dimension: income_unemployment_is
    type: int
    sql: ${TABLE}.income_unemployment_is

  - dimension: income_vet_disability
    type: number
    sql: ${TABLE}.income_vet_disability

  - dimension: income_vet_disability_is
    type: int
    sql: ${TABLE}.income_vet_disability_is

  - dimension: income_vet_pension
    type: number
    sql: ${TABLE}.income_vet_pension

  - dimension: income_vet_pension_is
    type: int
    sql: ${TABLE}.income_vet_pension_is

  - dimension: income_workers_comp
    type: number
    sql: ${TABLE}.income_workers_comp

  - dimension: income_workers_comp_is
    type: int
    sql: ${TABLE}.income_workers_comp_is

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: marital_status
    type: int
    sql: ${TABLE}.marital_status

  - dimension_group: move_in
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.move_in_date

  - dimension: permanent_housing_is
    type: int
    sql: ${TABLE}.permanent_housing_is


  - dimension: prior_city
    sql: ${TABLE}.prior_city

  - dimension: prior_duration
    type: int
    sql: ${TABLE}.prior_duration

  - dimension: prior_residence
    type: int
    sql: ${TABLE}.prior_residence

  - dimension: prior_residence_other
    sql: ${TABLE}.prior_residence_other

  - dimension: prior_state
    sql: ${TABLE}.prior_state

  - dimension: prior_street_address
    sql: ${TABLE}.prior_street_address

  - dimension_group: program
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.program_date

  - dimension_group: program_entry
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.program_entry

  - dimension_group: program_exit
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.program_exit

  - dimension: ref_agency
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_client
    type: int
    sql: ${TABLE}.ref_client

  - dimension: ref_program
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_user
    type: int
    sql: ${TABLE}.ref_user

  - dimension: ref_user_updated
    type: int
    sql: ${TABLE}.ref_user_updated

  - dimension: screen_type
    type: int
    sql: ${TABLE}.screen_type

  - dimension: screen_type_text
    sql: |
      CASE
      WHEN ${screen_type} = 2 THEN '1 - Enrollment'
      WHEN ${screen_type} = 3 THEN '2 - Update'
      WHEN ${screen_type} = 4 THEN '4 - Exit'
      WHEN ${screen_type} = 5 THEN '3 - Annual Assessment'
      END
    

  - dimension: zipcode
    type: zipcode
    sql: ${TABLE}.zipcode

  - dimension: zipcode_quality
    type: int
    sql: ${TABLE}.zipcode_quality

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - vi_f_spdat_child1_fullname
    - vi_f_spdat_child2_fullname
    - vi_f_spdat_child3_fullname
    - vi_f_spdat_child4_fullname
    - vi_f_spdat_hh2_fullname
    - vi_f_spdat_child10_fullname
    - vi_f_spdat_child9_fullname
    - vi_f_spdat_child5_fullname
    - vi_f_spdat_child6_fullname
    - vi_f_spdat_child7_fullname
    - vi_f_spdat_child8_fullname

