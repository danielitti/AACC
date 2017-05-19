view: intelematics_trips {
  #sql_table_name: public.aa_trips ;;
  derived_table: {
    sql:  select * from public.aa_trips where rs_environment = 'prod';;
  }

  dimension: id {
    label: "Trip ID"
    group_label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: accelerationhistogram_bin1 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin1 ;;
  }

  dimension: accelerationhistogram_bin10 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin10 ;;
  }

  dimension: accelerationhistogram_bin2 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin2 ;;
  }

  dimension: accelerationhistogram_bin3 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin3 ;;
  }

  dimension: accelerationhistogram_bin4 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin4 ;;
  }

  dimension: accelerationhistogram_bin5 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin5 ;;
  }

  dimension: accelerationhistogram_bin6 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin6 ;;
  }

  dimension: accelerationhistogram_bin7 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin7 ;;
  }

  dimension: accelerationhistogram_bin8 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin8 ;;
  }

  dimension: accelerationhistogram_bin9 {
    type: number
    hidden:  yes
    sql: ${TABLE}.accelerationhistogram_bin9 ;;
  }

  dimension: complete {
    type: yesno
    sql: ${TABLE}.complete ;;
  }

  dimension: decelerationhistogram_bin1 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin1 ;;
  }

  dimension: decelerationhistogram_bin10 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin10 ;;
  }

  dimension: decelerationhistogram_bin2 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin2 ;;
  }

  dimension: decelerationhistogram_bin3 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin3 ;;
  }

  dimension: decelerationhistogram_bin4 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin4 ;;
  }

  dimension: decelerationhistogram_bin5 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin5 ;;
  }

  dimension: decelerationhistogram_bin6 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin6 ;;
  }

  dimension: decelerationhistogram_bin7 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin7 ;;
  }

  dimension: decelerationhistogram_bin8 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin8 ;;
  }

  dimension: decelerationhistogram_bin9 {
    type: number
    hidden:  yes
    sql: ${TABLE}.decelerationhistogram_bin9 ;;
  }

  dimension: deviceid {
    label: "Device ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.deviceid ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: driverid {
    label: "Driver ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.driverid ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: endlocation_accuracy {
    type: number
    hidden:  yes
    sql: ${TABLE}.endlocation_accuracy ;;
  }

  dimension: endlocation_latitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.endlocation_latitude ;;
  }

  dimension: endlocation_longitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.endlocation_longitude ;;
  }

  dimension: endlocation_validity {
    type: number
    hidden:  yes
    sql: ${TABLE}.endlocation_validity ;;
  }

  dimension: endodometer {
    type: number
    hidden:  yes
    sql: ${TABLE}.endodometer ;;
  }

  dimension_group: endtimestamp {
    label: "End"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.endtimestamp ;;
  }

  dimension: enginetimetostart {
    label: "Engine Time To Start"
    type: number
    sql: ${TABLE}.enginetimetostart ;;
  }

  dimension: fuelconsumption {
    label: "Fuel Consumption"
    type: number
    sql: ${TABLE}.fuelconsumption ;;
  }

  dimension: idletime {
    label: "IDLE Time"
    type: number
    sql: ${TABLE}.idletime ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension_group: lastupdatedtimestamp {
    label: "Last Update"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastupdatedtimestamp ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension_group: reportedtimestamp {
    label: "Reported"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reportedtimestamp ;;
  }

  dimension: restingbatteryvoltage {
    label: "Resting Battery Voltage"
    type: number
    sql: ${TABLE}.restingbatteryvoltage ;;
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

  dimension: rs_polyline {
    type: string
    hidden:  yes
    sql: ${TABLE}.rs_polyline ;;
  }

  dimension: score_accelerationscore {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_accelerationscore ;;
  }

  dimension: score_averagespeed {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_averagespeed ;;
  }

  dimension: score_brakingscore {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_brakingscore ;;
  }

  dimension: score_driverrating {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_driverrating ;;
  }

  dimension: score_harshacceleration {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_harshacceleration ;;
  }

  dimension: score_harshbraking {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_harshbraking ;;
  }

  dimension: score_idlingscore {
    type: number
    hidden:  yes
    value_format_name: id
    sql: ${TABLE}.score_idlingscore ;;
  }

  dimension: score_speedingscore {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_speedingscore ;;
  }

  dimension: score_topspeed {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_topspeed ;;
  }

  dimension: score_totalecoscore {
    type: number
    hidden:  yes
    sql: ${TABLE}.score_totalecoscore ;;
  }

  dimension: speedhistogram_bin1 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin1 ;;
  }

  dimension: speedhistogram_bin10 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin10 ;;
  }

  dimension: speedhistogram_bin11 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin11 ;;
  }

  dimension: speedhistogram_bin12 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin12 ;;
  }

  dimension: speedhistogram_bin13 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin13 ;;
  }

  dimension: speedhistogram_bin14 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin14 ;;
  }

  dimension: speedhistogram_bin15 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin15 ;;
  }

  dimension: speedhistogram_bin16 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin16 ;;
  }

  dimension: speedhistogram_bin17 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin17 ;;
  }

  dimension: speedhistogram_bin2 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin2 ;;
  }

  dimension: speedhistogram_bin3 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin3 ;;
  }

  dimension: speedhistogram_bin4 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin4 ;;
  }

  dimension: speedhistogram_bin5 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin5 ;;
  }

  dimension: speedhistogram_bin6 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin6 ;;
  }

  dimension: speedhistogram_bin7 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin7 ;;
  }

  dimension: speedhistogram_bin8 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin8 ;;
  }

  dimension: speedhistogram_bin9 {
    type: number
    hidden:  yes
    sql: ${TABLE}.speedhistogram_bin9 ;;
  }

  dimension: startlocation_accuracy {
    type: number
    hidden:  yes
    sql: ${TABLE}.startlocation_accuracy ;;
  }

  dimension: startlocation_latitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.startlocation_latitude ;;
  }

  dimension: startlocation_longitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.startlocation_longitude ;;
  }

  dimension: startlocation_validity {
    type: number
    hidden:  yes
    sql: ${TABLE}.startlocation_validity ;;
  }

  dimension: startodometer {
    type: number
    hidden:  yes
    sql: ${TABLE}.startodometer ;;
  }

  dimension_group: starttimestamp {
    label: "Start"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.starttimestamp ;;
  }

  dimension: vehicleid {
    label: "Vehicle ID"
    group_label: "ID"
    type: string
    sql: ${TABLE}.vehicleid ;;
  }

  measure: trips {
    label: "# Trips"
    group_label: "Count"
    type: count
    drill_fields: [id, name]
  }

  measure: active_devices {
    label: "# Active Devices"
    group_label: "Count"
    type:  count_distinct
    sql:  ${deviceid} ;;
  }

  measure: averagebatteryvoltage {
    label: "AVG Battery Voltage"
    group_label: "Battery Voltage"
    type: average
    value_format: "0.00"
    sql: 1.00 * ${TABLE}.averagebatteryvoltage ;;
  }

  measure: minimumbatteryvoltage {
    label: "Minimum Battery Voltage"
    group_label: "Battery Voltage"
    type: min
    value_format: "0"
    sql: ${TABLE}.minimumbatteryvoltage ;;
  }

  measure: averagespeed {
    label: "AVG Speed"
    group_label: "Speed"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.averagespeed ;;
  }

  measure: maximumspeed {
    label: "MAX Speed"
    group_label: "Speed"
    type: max
    value_format: "0"
    sql: ${TABLE}.maximumspeed ;;
  }

  measure: numberofhardaccelerations {
    label: "# Hard Accelerations"
    group_label: "Count"
    type: sum
    sql: ${TABLE}.numberofhardaccelerations ;;
  }

  measure: numberofharshbrakes {
    label: "# Harsh Brakes"
    group_label: "Count"
    type: sum
    sql: ${TABLE}.numberofharshbrakes ;;
  }

  measure: overspeed {
    label: "# Overspeed"
    group_label: "Count"
    type: sum
    sql: ${TABLE}.overspeed ;;
  }

  measure: readingcount {
    label: "# Reading"
    group_label: "Count"
    type: sum
    sql: ${TABLE}.readingcount ;;
  }


}
