view: intelematics_devices {
  sql_table_name: public.aa_devices ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bluetoothpasswordstatus {
    type: string
    sql: ${TABLE}.bluetoothpasswordstatus ;;
  }

  dimension: configversion {
    type: string
    sql: ${TABLE}.configversion ;;
  }

  dimension: devicemodel {
    type: string
    sql: ${TABLE}.devicemodel ;;
  }

  dimension: deviceserialnumber {
    type: string
    sql: ${TABLE}.deviceserialnumber ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: firmwareversion {
    type: string
    sql: ${TABLE}.firmwareversion ;;
  }

  dimension_group: firstplugintimestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.firstplugintimestamp ;;
  }

  dimension: imei {
    type: string
    sql: ${TABLE}.imei ;;
  }

  dimension: isconnected {
    type: yesno
    sql: ${TABLE}.isconnected ;;
  }

  dimension: lastknownlocationaccu {
    type: string
    sql: ${TABLE}.lastknownlocationaccu ;;
  }

  dimension: lastknownlocationlat {
    type: number
    sql: ${TABLE}.lastknownlocationlat ;;
  }

  dimension: lastknownlocationlong {
    type: number
    sql: ${TABLE}.lastknownlocationlong ;;
  }

  dimension_group: lastknownlocationlts {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastknownlocationlts ;;
  }

  dimension: lastknownlocationlval {
    type: number
    sql: ${TABLE}.lastknownlocationlval ;;
  }

  dimension_group: lastknownlocationrts {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastknownlocationrts ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
