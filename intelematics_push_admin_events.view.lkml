view: intelematics_push_admin_events {
  sql_table_name: public.aa_push_admin_events ;;

  dimension: deviceid {
    type: string
    sql: ${TABLE}.deviceid ;;
  }

  dimension: driverid {
    type: string
    sql: ${TABLE}.driverid ;;
  }

  dimension_group: reportedtimestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reportedtimestamp ;;
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

  dimension: simid {
    type: string
    sql: ${TABLE}.simid ;;
  }

  dimension: vehicleid {
    type: string
    sql: ${TABLE}.vehicleid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
