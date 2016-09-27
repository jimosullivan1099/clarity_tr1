- view: entry_custom
  sql_table_name: |
    client_program_data

  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: ref_client_program_demographics
    hidden: true
    type: int
    sql: ${TABLE}.ref_client_program_demographics


  - dimension: age_0_3
    type: int
    sql: ${TABLE}.age_0_3

  - dimension: age_13_17
    type: int
    sql: ${TABLE}.age_13_17

  - dimension: age_18_24
    type: int
    sql: ${TABLE}.age_18_24

  - dimension: age_25_59
    type: int
    sql: ${TABLE}.age_25_59

  - dimension: age_4_12
    type: int
    sql: ${TABLE}.age_4_12

  - dimension: age_60
    type: int
    sql: ${TABLE}.age_60

  - dimension: asian_number
    type: int
    sql: ${TABLE}.asian_number

  - dimension: birth_city
    sql: ${TABLE}.birth_city

  - dimension: black_number
    type: int
    sql: ${TABLE}.black_number

  - dimension: c_ambulation
    type: int
    sql: ${TABLE}.c_ambulation

  - dimension: c_characteristics
    sql: ${TABLE}.c_characteristics

  - dimension: c_chronic
    type: int
    sql: ${TABLE}.c_chronic

  - dimension: c_english
    type: int
    sql: ${TABLE}.c_english

  - dimension: c_english_explain
    sql: ${TABLE}.c_english_explain

  - dimension: c_fall_cause
    type: int
    sql: ${TABLE}.c_fall_cause

  - dimension: c_fall_concern
    type: int
    sql: ${TABLE}.c_fall_concern

  - dimension_group: c_fall_last
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.c_fall_last

  - dimension: c_fall_reoccurring
    type: int
    sql: ${TABLE}.c_fall_reoccurring

  - dimension: c_fall_where
    type: int
    sql: ${TABLE}.c_fall_where

  - dimension: c_fpoutreach
    type: int
    sql: ${TABLE}.c_fpoutreach

  - dimension: c_functional_status
    type: int
    sql: ${TABLE}.c_functional_status

  - dimension: c_id_type
    sql: ${TABLE}.c_id_type

  - dimension: c_impairment_explain
    sql: ${TABLE}.c_impairment_explain

  - dimension: c_income_received
    sql: ${TABLE}.c_income_received

  - dimension: c_ivdu
    type: int
    sql: ${TABLE}.c_ivdu

  - dimension: c_jurisdiction
    type: int
    sql: ${TABLE}.c_jurisdiction

  - dimension: c_legal_type
    sql: ${TABLE}.c_legal_type

  - dimension: c_location_description
    sql: ${TABLE}.c_location_description

  - dimension: c_lvfr_notes
    sql: ${TABLE}.c_lvfr_notes

  - dimension: c_medical_changes
    type: int
    sql: ${TABLE}.c_medical_changes

  - dimension: c_medical_different
    type: int
    sql: ${TABLE}.c_medical_different

  - dimension: c_medical_medication
    type: int
    sql: ${TABLE}.c_medical_medication

  - dimension: c_medical_medication_filled
    type: int
    sql: ${TABLE}.c_medical_medication_filled

  - dimension: c_medical_physician
    type: int
    sql: ${TABLE}.c_medical_physician

  - dimension: c_medical_physician_name
    sql: ${TABLE}.c_medical_physician_name

  - dimension: c_medical_specialty
    type: int
    sql: ${TABLE}.c_medical_specialty

  - dimension: c_medical_specialty_name
    sql: ${TABLE}.c_medical_specialty_name

  - dimension: c_medically_fragile
    type: int
    sql: ${TABLE}.c_medically_fragile

  - dimension: c_nv_healthlink
    type: int
    sql: ${TABLE}.c_nv_healthlink

  - dimension: c_phone
    sql: ${TABLE}.c_phone

  - dimension: c_ref_dme
    type: int
    sql: ${TABLE}.c_ref_dme

  - dimension: c_ref_infant
    type: int
    sql: ${TABLE}.c_ref_infant

  - dimension: c_ref_nhap
    type: int
    sql: ${TABLE}.c_ref_nhap

  - dimension: c_ref_pregnancy
    type: int
    sql: ${TABLE}.c_ref_pregnancy

  - dimension: c_ref_tanf
    type: int
    sql: ${TABLE}.c_ref_tanf

  - dimension: c_ref_vision
    type: int
    sql: ${TABLE}.c_ref_vision

  - dimension: c_ref_well
    type: int
    sql: ${TABLE}.c_ref_well

  - dimension: c_refused
    type: int
    sql: ${TABLE}.c_refused

  - dimension: c_resourcenetwork
    type: int
    sql: ${TABLE}.c_resourcenetwork

  - dimension: c_stand_dizzy
    type: int
    sql: ${TABLE}.c_stand_dizzy

  - dimension: c_toys
    type: int
    sql: ${TABLE}.c_toys

  - dimension: c_transfer_status
    type: int
    sql: ${TABLE}.c_transfer_status

  - dimension: c_transportation_type
    type: int
    sql: ${TABLE}.c_transportation_type

  - dimension_group: c_umc_discharge
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.c_umc_discharge

  - dimension: c_umc_los
    type: int
    sql: ${TABLE}.c_umc_los

  - dimension: c_umc_room
    type: int
    sql: ${TABLE}.c_umc_room

  - dimension: c_umc_socialworker
    sql: ${TABLE}.c_umc_socialworker

  - dimension: c_umc_socialworker_email
    sql: ${TABLE}.c_umc_socialworker_email

  - dimension: c_umc_socialworker_phone
    sql: ${TABLE}.c_umc_socialworker_phone

  - dimension: c_vispdat_score
    type: int
    sql: ${TABLE}.c_vispdat_score

  - dimension: c_walk_assistance
    type: int
    sql: ${TABLE}.c_walk_assistance

  - dimension: client_new
    type: int
    sql: ${TABLE}.client_new

  - dimension: cref_medical
    type: int
    sql: ${TABLE}.cref_medical

  - dimension: description
    sql: ${TABLE}.description

  - dimension: diabetic
    type: int
    sql: ${TABLE}.diabetic

  - dimension: disability_proof
    type: int
    sql: ${TABLE}.disability_proof

  - dimension: disability_proof_type
    type: int
    sql: ${TABLE}.disability_proof_type

  - dimension: eye_color
    type: int
    sql: ${TABLE}.eye_color

  - dimension: felony
    type: int
    sql: ${TABLE}.felony

  - dimension: felony_register
    type: int
    sql: ${TABLE}.felony_register

  - dimension: females_number
    type: int
    sql: ${TABLE}.females_number

  - dimension: guide_dog
    type: int
    sql: ${TABLE}.guide_dog

  - dimension: hair_color
    type: int
    sql: ${TABLE}.hair_color

  - dimension: health_afford_rx
    type: int
    sql: ${TABLE}.health_afford_rx

  - dimension: health_er
    type: int
    sql: ${TABLE}.health_er

  - dimension: health_ins_under
    type: int
    sql: ${TABLE}.health_ins_under

  - dimension: health_insurance_type
    type: int
    sql: ${TABLE}.health_insurance_type

  - dimension: health_knt
    type: int
    sql: ${TABLE}.health_knt

  - dimension: health_no_van
    type: int
    sql: ${TABLE}.health_no_van

  - dimension: health_pcp
    type: int
    sql: ${TABLE}.health_pcp

  - dimension: health_rx
    type: int
    sql: ${TABLE}.health_rx

  - dimension: health_van
    type: int
    sql: ${TABLE}.health_van

  - dimension: health_van_ref
    type: int
    sql: ${TABLE}.health_van_ref

  - dimension: hispanic_number
    type: int
    sql: ${TABLE}.hispanic_number

  - dimension: homeless
    type: int
    sql: ${TABLE}.homeless

  - dimension: homeless_cause
    type: int
    sql: ${TABLE}.homeless_cause

  - dimension: homeless_minor
    type: int
    sql: ${TABLE}.homeless_minor

  - dimension: household_adults
    type: int
    sql: ${TABLE}.household_adults

  - dimension: household_children
    type: int
    sql: ${TABLE}.household_children

  - dimension: household_multifamily
    type: int
    sql: ${TABLE}.household_multifamily

  - dimension: household_seniors
    type: int
    sql: ${TABLE}.household_seniors

  - dimension: household_total
    type: int
    sql: ${TABLE}.household_total

  - dimension: hp_access
    type: int
    sql: ${TABLE}.hp_access

  - dimension: hp_dairy
    type: int
    sql: ${TABLE}.hp_dairy

  - dimension: hp_fruit
    type: int
    sql: ${TABLE}.hp_fruit

  - dimension: hp_grains
    type: int
    sql: ${TABLE}.hp_grains

  - dimension: hp_headofhousehold
    type: int
    sql: ${TABLE}.hp_headofhousehold

  - dimension: hp_meat
    type: int
    sql: ${TABLE}.hp_meat

  - dimension: hp_missed_meals
    type: int
    sql: ${TABLE}.hp_missed_meals

  - dimension: hp_q1
    type: int
    sql: ${TABLE}.hp_q1

  - dimension: hp_q2
    type: int
    sql: ${TABLE}.hp_q2

  - dimension: hp_q3
    type: int
    sql: ${TABLE}.hp_q3

  - dimension: hp_q4
    type: int
    sql: ${TABLE}.hp_q4

  - dimension: identification
    type: int
    sql: ${TABLE}.identification

  - dimension: identification_birthcert
    type: int
    sql: ${TABLE}.identification_birthcert

  - dimension: identification_other
    type: int
    sql: ${TABLE}.identification_other

  - dimension: income_earned_monthly
    type: number
    sql: ${TABLE}.income_earned_monthly

  - dimension: income_level
    type: int
    sql: ${TABLE}.income_level

  - dimension: income_monthly_inheritence
    type: number
    sql: ${TABLE}.income_monthly_inheritence

  - dimension: income_monthly_total
    type: number
    sql: ${TABLE}.income_monthly_total

  - dimension: income_range
    type: int
    sql: ${TABLE}.income_range

  - dimension: interpreter
    type: int
    sql: ${TABLE}.interpreter

  - dimension: isamount
    type: int
    sql: ${TABLE}.isamount

  - dimension: ksk_caseworker
    type: int
    sql: ${TABLE}.ksk_caseworker

  - dimension: ksk_snap
    type: int
    sql: ${TABLE}.ksk_snap

  - dimension: ksk_snap_amount
    type: number
    sql: ${TABLE}.ksk_snap_amount

  - dimension: ksk_snap_app
    type: int
    sql: ${TABLE}.ksk_snap_app

  - dimension_group: ksk_snap_app
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ksk_snap_app_date

  - dimension: ksk_snap_applied
    type: int
    sql: ${TABLE}.ksk_snap_applied

  - dimension: ksk_snap_ccnnapp
    type: int
    sql: ${TABLE}.ksk_snap_ccnnapp

  - dimension: ksk_snap_gaveapp
    type: int
    sql: ${TABLE}.ksk_snap_gaveapp

  - dimension: ksk_snap_pending
    type: int
    sql: ${TABLE}.ksk_snap_pending

  - dimension: ksk_snap_qualify
    type: int
    sql: ${TABLE}.ksk_snap_qualify

  - dimension: ksk_snap_recert
    type: int
    sql: ${TABLE}.ksk_snap_recert

  - dimension: ksk_snap_refer
    type: int
    sql: ${TABLE}.ksk_snap_refer

  - dimension: ksk_snap_referto
    sql: ${TABLE}.ksk_snap_referto

  - dimension: ksk_snap_refused
    type: int
    sql: ${TABLE}.ksk_snap_refused

  - dimension: ksk_snap_status
    type: int
    sql: ${TABLE}.ksk_snap_status

  - dimension: language
    type: int
    sql: ${TABLE}.language

  - dimension: law_consult
    type: int
    sql: ${TABLE}.law_consult

  - dimension: law_location
    type: int
    sql: ${TABLE}.law_location

  - dimension: limit_bathing
    type: int
    sql: ${TABLE}.limit_bathing

  - dimension: limit_bladder
    type: int
    sql: ${TABLE}.limit_bladder

  - dimension: limit_bowelcare
    type: int
    sql: ${TABLE}.limit_bowelcare

  - dimension: limit_dressing
    type: int
    sql: ${TABLE}.limit_dressing

  - dimension: limit_eating
    type: int
    sql: ${TABLE}.limit_eating

  - dimension: limit_housework
    type: int
    sql: ${TABLE}.limit_housework

  - dimension: limit_hygiene
    type: int
    sql: ${TABLE}.limit_hygiene

  - dimension: limit_locomotion
    type: int
    sql: ${TABLE}.limit_locomotion

  - dimension: limit_meals
    type: int
    sql: ${TABLE}.limit_meals

  - dimension: limit_mobility
    type: int
    sql: ${TABLE}.limit_mobility

  - dimension: limit_money
    type: int
    sql: ${TABLE}.limit_money

  - dimension: limit_shopping
    type: int
    sql: ${TABLE}.limit_shopping

  - dimension: limit_telephone
    type: int
    sql: ${TABLE}.limit_telephone

  - dimension: limit_transfer
    type: int
    sql: ${TABLE}.limit_transfer

  - dimension: living_arrangement
    type: int
    sql: ${TABLE}.living_arrangement

  - dimension: males_number
    type: int
    sql: ${TABLE}.males_number

  - dimension: member_number
    type: int
    sql: ${TABLE}.member_number

  - dimension: nativeamerican_number
    type: int
    sql: ${TABLE}.nativeamerican_number

  - dimension: needs_adoptions
    type: int
    sql: ${TABLE}.needs_adoptions

  - dimension: needs_diningroom
    type: int
    sql: ${TABLE}.needs_diningroom

  - dimension: needs_emergency
    type: int
    sql: ${TABLE}.needs_emergency

  - dimension: needs_hcelc
    type: int
    sql: ${TABLE}.needs_hcelc

  - dimension: needs_immigration
    type: int
    sql: ${TABLE}.needs_immigration

  - dimension: needs_k2s
    type: int
    sql: ${TABLE}.needs_k2s

  - dimension: needs_pantry
    type: int
    sql: ${TABLE}.needs_pantry

  - dimension: needs_residence
    type: int
    sql: ${TABLE}.needs_residence

  - dimension: needs_thriftstore
    type: int
    sql: ${TABLE}.needs_thriftstore

  - dimension: nevada_region
    type: int
    sql: ${TABLE}.nevada_region

  - dimension: nv_location
    type: int
    sql: ${TABLE}.nv_location

  - dimension: other_number
    type: int
    sql: ${TABLE}.other_number

  - dimension: pacificislander_number
    type: int
    sql: ${TABLE}.pacificislander_number

  - dimension: pantry_bags
    type: int
    sql: ${TABLE}.pantry_bags

  - dimension: ref_agency
    type: int
    sql: ${TABLE}.ref_agency

  - dimension: ref_childfind
    type: int
    sql: ${TABLE}.ref_childfind

  - dimension: ref_childrenscab
    type: int
    sql: ${TABLE}.ref_childrenscab

  - dimension: ref_client
    type: int
    sql: ${TABLE}.ref_client

  - dimension: ref_clothing
    type: int
    sql: ${TABLE}.ref_clothing

  - dimension: ref_dental
    type: int
    sql: ${TABLE}.ref_dental

  - dimension: ref_dis
    type: int
    sql: ${TABLE}.ref_dis

  - dimension: ref_earlychild
    type: int
    sql: ${TABLE}.ref_earlychild

  - dimension: ref_employment
    type: int
    sql: ${TABLE}.ref_employment

  - dimension: ref_energy
    type: int
    sql: ${TABLE}.ref_energy

  - dimension: ref_er
    type: int
    sql: ${TABLE}.ref_er

  - dimension: ref_esl
    type: int
    sql: ${TABLE}.ref_esl

  - dimension: ref_food
    type: int
    sql: ${TABLE}.ref_food

  - dimension: ref_ged
    type: int
    sql: ${TABLE}.ref_ged

  - dimension: ref_hawc
    type: int
    sql: ${TABLE}.ref_hawc

  - dimension: ref_health_other
    type: int
    sql: ${TABLE}.ref_health_other

  - dimension: ref_healthc
    type: int
    sql: ${TABLE}.ref_healthc

  - dimension: ref_help
    type: int
    sql: ${TABLE}.ref_help

  - dimension: ref_homemaker
    type: int
    sql: ${TABLE}.ref_homemaker

  - dimension: ref_hopes
    type: int
    sql: ${TABLE}.ref_hopes

  - dimension: ref_immigration
    type: int
    sql: ${TABLE}.ref_immigration

  - dimension: ref_literacy
    type: int
    sql: ${TABLE}.ref_literacy

  - dimension: ref_medicaid
    type: int
    sql: ${TABLE}.ref_medicaid

  - dimension: ref_medicare
    type: int
    sql: ${TABLE}.ref_medicare

  - dimension: ref_mental
    type: int
    sql: ${TABLE}.ref_mental

  - dimension: ref_nutrition
    type: int
    sql: ${TABLE}.ref_nutrition

  - dimension: ref_nvcheckup
    type: int
    sql: ${TABLE}.ref_nvcheckup

  - dimension: ref_orvis
    type: int
    sql: ${TABLE}.ref_orvis

  - dimension: ref_othercommunity
    type: int
    sql: ${TABLE}.ref_othercommunity

  - dimension: ref_parenting
    type: int
    sql: ${TABLE}.ref_parenting

  - dimension: ref_pca
    type: int
    sql: ${TABLE}.ref_pca

  - dimension: ref_pcp
    type: int
    sql: ${TABLE}.ref_pcp

  - dimension: ref_program
    type: int
    sql: ${TABLE}.ref_program

  - dimension: ref_salvarmy
    type: int
    sql: ${TABLE}.ref_salvarmy

  - dimension: ref_shelter
    type: int
    sql: ${TABLE}.ref_shelter

  - dimension: ref_smoking
    type: int
    sql: ${TABLE}.ref_smoking

  - dimension: ref_social
    type: int
    sql: ${TABLE}.ref_social

  - dimension: ref_socsec
    type: int
    sql: ${TABLE}.ref_socsec

  - dimension: ref_spcneeds
    type: int
    sql: ${TABLE}.ref_spcneeds

  - dimension: ref_status
    type: int
    sql: ${TABLE}.ref_status

  - dimension: ref_stmary
    type: int
    sql: ${TABLE}.ref_stmary

  - dimension: ref_transportation
    type: int
    sql: ${TABLE}.ref_transportation

  - dimension: ref_user
    type: int
    sql: ${TABLE}.ref_user

  - dimension: ref_va
    type: int
    sql: ${TABLE}.ref_va

  - dimension: ref_washoe
    type: int
    sql: ${TABLE}.ref_washoe

  - dimension: ref_wic
    type: int
    sql: ${TABLE}.ref_wic

  - dimension: resources_ahcn
    type: int
    sql: ${TABLE}.resources_ahcn

  - dimension: resources_aps
    type: int
    sql: ${TABLE}.resources_aps

  - dimension: resources_benefits
    type: int
    sql: ${TABLE}.resources_benefits

  - dimension: resources_childcare
    type: int
    sql: ${TABLE}.resources_childcare

  - dimension: resources_counseling
    type: int
    sql: ${TABLE}.resources_counseling

  - dimension: resources_cps
    type: int
    sql: ${TABLE}.resources_cps

  - dimension: resources_dv
    type: int
    sql: ${TABLE}.resources_dv

  - dimension: resources_eps
    type: int
    sql: ${TABLE}.resources_eps

  - dimension: resources_frcs
    type: int
    sql: ${TABLE}.resources_frcs

  - dimension: resources_legal
    type: int
    sql: ${TABLE}.resources_legal

  - dimension: resources_sa
    type: int
    sql: ${TABLE}.resources_sa

  - dimension: resources_senior
    type: int
    sql: ${TABLE}.resources_senior

  - dimension: retired
    type: int
    sql: ${TABLE}.retired

  - dimension: screen_type
    type: int
    sql: ${TABLE}.screen_type

  - dimension: session_idle_limit_warning
    type: int
    sql: ${TABLE}.session_idle_limit_warning

  - dimension: smoker
    type: int
    sql: ${TABLE}.smoker

  - dimension: sports_release
    type: int
    sql: ${TABLE}.sports_release

  - dimension: support_system
    type: int
    sql: ${TABLE}.support_system

  - dimension: test_field3
    type: int
    sql: ${TABLE}.test_field3

  - dimension: total_amount
    type: number
    sql: ${TABLE}.total_amount

  - dimension: transgender_number
    type: int
    sql: ${TABLE}.transgender_number

  - dimension: white_number
    type: int
    sql: ${TABLE}.white_number

  - measure: count
    type: count
    drill_fields: [id, c_medical_physician_name, c_medical_specialty_name]


    
  sets:
      entry_custom_fields:
      - smoker

