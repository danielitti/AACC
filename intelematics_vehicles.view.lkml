view: intelematics_vehicles {
  sql_table_name: public.aa_vehicles ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: batterystatus {
    type: string
    sql: ${TABLE}.batterystatus ;;
  }

  dimension: bodytype {
    type: string
    sql: ${TABLE}.bodytype ;;
  }

  dimension: builddate {
    type: string
    sql: ${TABLE}.builddate ;;
  }

  dimension: buildyear {
    type: number
    sql: ${TABLE}.buildyear ;;
  }

  dimension: colour {
    type: string
    sql: ${TABLE}.colour ;;
  }

  dimension: enginetype {
    type: string
    sql: ${TABLE}.enginetype ;;
  }

  dimension: licenseplate {
    type: string
    sql: ${TABLE}.licenseplate ;;
  }

  dimension: licenseplateregion {
    type: string
    sql: ${TABLE}.licenseplateregion ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: milon {
    type: yesno
    sql: ${TABLE}.milon ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: modelyear {
    type: number
    sql: ${TABLE}.modelyear ;;
  }

  dimension: numberofharshaccelerations {
    type: number
    sql: ${TABLE}.numberofharshaccelerations ;;
  }

  dimension: numberofharshbrakes {
    type: number
    sql: ${TABLE}.numberofharshbrakes ;;
  }

  dimension: odometer {
    type: number
    sql: ${TABLE}.odometer ;;
  }

  dimension: odometertype {
    type: number
    sql: ${TABLE}.odometertype ;;
  }

  dimension: rs_club {
    type: string
    sql: ${TABLE}.rs_club ;;
  }

  dimension: rs_environment {
    type: string
    sql: ${TABLE}.rs_environment ;;
  }

  dimension: rs_id {
    type: string
    sql: ${TABLE}.rs_id ;;
  }

  dimension: salescolour {
    type: string
    sql: ${TABLE}.salescolour ;;
  }

  dimension: seedodometer {
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
    type: string
    sql: ${TABLE}.transmissiontype ;;
  }

  dimension: variant {
    type: string
    sql: ${TABLE}.variant ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
