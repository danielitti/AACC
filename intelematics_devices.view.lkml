view: intelematics_devices {
  #sql_table_name: public.aa_devices ;;
  derived_table: {
    sql:  select * from public.aa_devices where rs_environment = 'prod';;
  }


  dimension: id {
    label: "Device ID"
    group_label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bluetoothpasswordstatus {
    type: string
    hidden:  yes
    sql: ${TABLE}.bluetoothpasswordstatus ;;
  }

  dimension: configversion {
    type: string
    hidden:  yes
    sql: ${TABLE}.configversion ;;
  }

  dimension: devicemodel {
    label: "Device Model"
    type: string
    sql: ${TABLE}.devicemodel ;;
  }

  dimension: deviceserialnumber {
    label: "Device Serial Number"
    type: string
    sql: ${TABLE}.deviceserialnumber ;;
  }

  dimension: devicetype {
    label: "Device Type"
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: firmwareversion {
    label: "Firmware Version"
    type: string
    sql: ${TABLE}.firmwareversion ;;
  }

  dimension_group: firstplugintimestamp {
    label: "First Plugin Timestamp"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.firstplugintimestamp ;;
  }

  dimension: imei {
    label: "IMEI"
    type: string
    hidden:  yes
    sql: ${TABLE}.imei ;;
  }

  dimension: isconnected {
    label: "Is Connected"
    type: yesno
    sql: ${TABLE}.isconnected ;;
  }

  dimension: lastknownlocationaccu {
    type: string
    hidden:  yes
    sql: ${TABLE}.lastknownlocationaccu ;;
  }

  dimension: lastknownlocationlat {
    type: number
    hidden:  yes
    sql: ${TABLE}.lastknownlocationlat ;;
  }

  dimension: lastknownlocationlong {
    type: number
    hidden: yes
    sql: ${TABLE}.lastknownlocationlong ;;
  }

  dimension_group: lastknownlocationlts {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastknownlocationlts ;;
  }

  dimension: lastknownlocationlval {
    type: number
    hidden:  yes
    sql: ${TABLE}.lastknownlocationlval ;;
  }

  dimension_group: lastknownlocationrts {
    type: time
    hidden:  yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastknownlocationrts ;;
  }

  dimension: rs_club {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_club ;;
  }

  dimension: rs_environment {
    label: "rsenvironment"
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_environment ;;
  }

  dimension: rs_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: total_devices {
    label: "# Devices"
    group_label: "Count"
    type: count
    drill_fields: [id]
  }

  measure: activated_devices {
    label: "# Activated Devices"
    group_label: "Count"
    type:  count_distinct
    sql:  ${id} ;;
    filters: {
      field: firstplugintimestamp_date
      value: "-NULL"
    }
  }

}
