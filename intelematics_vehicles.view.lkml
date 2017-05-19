view: intelematics_vehicles {
  #sql_table_name: public.aa_vehicles ;;
  derived_table: {
    sql:  select * from public.aa_vehicles where rs_environment = 'prod';;
  }

  dimension: id {
    primary_key: yes
    label: "Vehicle ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: batterystatus {
    label: "Battery Status"
    type: string
    sql: ${TABLE}.batterystatus ;;
  }

  dimension: bodytype {
    label: "Body Type"
    group_label: "Car"
    type: string
    sql: ${TABLE}.bodytype ;;
  }

  dimension: builddate {
    label: "Build Date"
    group_label: "Car"
    type: string
    sql: ${TABLE}.builddate ;;
  }

  dimension: buildyear {
    label: "Build Year"
    group_label: "Car"
    type: number
    value_format: "0"
    sql: ${TABLE}.buildyear ;;
  }

  dimension: colour {
    label: "Colour"
    group_label: "Car"
    type: string
    sql: ${TABLE}.colour ;;
  }

  dimension: enginetype {
    label: "Engine Type"
    group_label: "Car"
    type: string
    sql: ${TABLE}.enginetype ;;
  }

  dimension: licenseplate {
    type: string
    hidden:  yes
    sql: ${TABLE}.licenseplate ;;
  }

  dimension: licenseplateregion {
    type: string
    hidden:  yes
    sql: ${TABLE}.licenseplateregion ;;
  }

  dimension: make {
    label: "Car Make"
    group_label: "Car"
    type:  string
    sql: ${TABLE}.make ;;
  }

  dimension: milon {
    type: yesno
    sql: ${TABLE}.milon ;;
  }

  dimension: model {
    label: "Car Model"
    group_label: "Car"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: modelyear {
    label: "Car Model Year"
    group_label: "Car"
    type: number
    value_format: "0"
    sql: ${TABLE}.modelyear ;;
  }

  dimension: odometer {
    type: number
    sql: ${TABLE}.odometer ;;
  }

  dimension: odometertype {
    label: "Odometer Type"
    type: number
    sql: ${TABLE}.odometertype ;;
  }

  dimension: rs_club {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_club ;;
  }

  dimension: rs_environment {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_environment ;;
  }

  dimension: rs_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_id ;;
  }

  dimension: salescolour {
    label: "Sales Colour"
    type: string
    sql: ${TABLE}.salescolour ;;
  }

  dimension: seedodometer {
    label: "Seed Odometer"
    type: number
    sql: ${TABLE}.seedodometer ;;
  }

  dimension_group: seedodometertimestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.seedodometertimestamp ;;
  }

  dimension: series {
    type: string
    sql: ${TABLE}.series ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: transmissiontype {
    label: "Transmission Type"
    group_label: "Car"
    type: string
    sql: ${TABLE}.transmissiontype ;;
  }

  dimension: variant {
    label: "Variant"
    type: string
    sql: ${TABLE}.variant ;;
  }

# do not expose this info since it is PII
  # dimension: vin {
  #   label: "Vin"
  #   type: string
  #   sql: ${TABLE}.vin ;;
  # }

  measure: total_vehicles {
    label: "# Vehicles"
    group_label: "Count"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }

  measure: numberofharshaccelerations {
    label: "# Harsh Accelerations"
    group_label: "Count"
    type: sum
    sql: ${TABLE}.numberofharshaccelerations ;;
  }

  measure: numberofharshbrakes {
    label: "# Harsh Brakes"
    group_label: "Count"
    type: sum
    sql: ${TABLE}.numberofharshbrakes ;;
  }


}
