view: intelematics_trips {
  sql_table_name: public.aa_trips ;;

  # dimension: id {
  #   primary_key: yes
  #   type: string
  #   sql: ${TABLE}.id ;;
  # }

  # dimension: accelerationhistogram_bin1 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin1 ;;
  # }

  # dimension: accelerationhistogram_bin10 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin10 ;;
  # }

  # dimension: accelerationhistogram_bin2 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin2 ;;
  # }

  # dimension: accelerationhistogram_bin3 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin3 ;;
  # }

  # dimension: accelerationhistogram_bin4 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin4 ;;
  # }

  # dimension: accelerationhistogram_bin5 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin5 ;;
  # }

  # dimension: accelerationhistogram_bin6 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin6 ;;
  # }

  # dimension: accelerationhistogram_bin7 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin7 ;;
  # }

  # dimension: accelerationhistogram_bin8 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin8 ;;
  # }

  # dimension: accelerationhistogram_bin9 {
  #   type: number
  #   sql: ${TABLE}.accelerationhistogram_bin9 ;;
  # }

  # dimension: averagebatteryvoltage {
  #   type: number
  #   sql: ${TABLE}.averagebatteryvoltage ;;
  # }

  # dimension: averagespeed {
  #   type: number
  #   sql: ${TABLE}.averagespeed ;;
  # }

  # dimension: complete {
  #   type: yesno
  #   sql: ${TABLE}.complete ;;
  # }

  # dimension: decelerationhistogram_bin1 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin1 ;;
  # }

  # dimension: decelerationhistogram_bin10 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin10 ;;
  # }

  # dimension: decelerationhistogram_bin2 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin2 ;;
  # }

  # dimension: decelerationhistogram_bin3 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin3 ;;
  # }

  # dimension: decelerationhistogram_bin4 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin4 ;;
  # }

  # dimension: decelerationhistogram_bin5 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin5 ;;
  # }

  # dimension: decelerationhistogram_bin6 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin6 ;;
  # }

  # dimension: decelerationhistogram_bin7 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin7 ;;
  # }

  # dimension: decelerationhistogram_bin8 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin8 ;;
  # }

  # dimension: decelerationhistogram_bin9 {
  #   type: number
  #   sql: ${TABLE}.decelerationhistogram_bin9 ;;
  # }

   dimension: deviceid {
     label: "Device ID"
     hidden: yes
     type: string
     sql: ${TABLE}.deviceid ;;
   }

  # dimension: distance {
  #   type: number
  #   sql: ${TABLE}.distance ;;
  # }

  # dimension: driverid {
  #   type: string
  #   sql: ${TABLE}.driverid ;;
  # }

  # dimension: duration {
  #   type: number
  #   sql: ${TABLE}.duration ;;
  # }

  # dimension: endlocation_accuracy {
  #   type: number
  #   sql: ${TABLE}.endlocation_accuracy ;;
  # }

  # dimension: endlocation_latitude {
  #   type: number
  #   sql: ${TABLE}.endlocation_latitude ;;
  # }

  # dimension: endlocation_longitude {
  #   type: number
  #   sql: ${TABLE}.endlocation_longitude ;;
  # }

  # dimension: endlocation_validity {
  #   type: number
  #   sql: ${TABLE}.endlocation_validity ;;
  # }

  # dimension: endodometer {
  #   type: number
  #   sql: ${TABLE}.endodometer ;;
  # }

  # dimension_group: endtimestamp {
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.endtimestamp ;;
  # }

  # dimension: enginetimetostart {
  #   type: number
  #   sql: ${TABLE}.enginetimetostart ;;
  # }

  # dimension: fuelconsumption {
  #   type: number
  #   sql: ${TABLE}.fuelconsumption ;;
  # }

  # dimension: idletime {
  #   type: number
  #   sql: ${TABLE}.idletime ;;
  # }

  # dimension: label {
  #   type: string
  #   sql: ${TABLE}.label ;;
  # }

  # dimension_group: lastupdatedtimestamp {
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.lastupdatedtimestamp ;;
  # }

  # dimension: maximumspeed {
  #   type: number
  #   sql: ${TABLE}.maximumspeed ;;
  # }

  # dimension: minimumbatteryvoltage {
  #   type: number
  #   sql: ${TABLE}.minimumbatteryvoltage ;;
  # }

  # dimension: name {
  #   type: string
  #   sql: ${TABLE}.name ;;
  # }

  # dimension: number {
  #   type: number
  #   sql: ${TABLE}.number ;;
  # }

  # dimension: numberofhardaccelerations {
  #   type: number
  #   sql: ${TABLE}.numberofhardaccelerations ;;
  # }

  # dimension: numberofharshbrakes {
  #   type: number
  #   sql: ${TABLE}.numberofharshbrakes ;;
  # }

  # dimension: overspeed {
  #   type: number
  #   sql: ${TABLE}.overspeed ;;
  # }

  # dimension: readingcount {
  #   type: number
  #   sql: ${TABLE}.readingcount ;;
  # }

  # dimension_group: reportedtimestamp {
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.reportedtimestamp ;;
  # }

  # dimension: restingbatteryvoltage {
  #   type: number
  #   sql: ${TABLE}.restingbatteryvoltage ;;
  # }

  # dimension: rs_club {
  #   type: string
  #   sql: ${TABLE}.rs_club ;;
  # }

  # dimension: rs_environment {
  #   type: string
  #   sql: ${TABLE}.rs_environment ;;
  # }

  # dimension: rs_id {
  #   type: string
  #   sql: ${TABLE}.rs_id ;;
  # }

  # dimension: rs_polyline {
  #   type: string
  #   sql: ${TABLE}.rs_polyline ;;
  # }

  # dimension: score_accelerationscore {
  #   type: number
  #   sql: ${TABLE}.score_accelerationscore ;;
  # }

  # dimension: score_averagespeed {
  #   type: number
  #   sql: ${TABLE}.score_averagespeed ;;
  # }

  # dimension: score_brakingscore {
  #   type: number
  #   sql: ${TABLE}.score_brakingscore ;;
  # }

  # dimension: score_driverrating {
  #   type: number
  #   sql: ${TABLE}.score_driverrating ;;
  # }

  # dimension: score_harshacceleration {
  #   type: number
  #   sql: ${TABLE}.score_harshacceleration ;;
  # }

  # dimension: score_harshbraking {
  #   type: number
  #   sql: ${TABLE}.score_harshbraking ;;
  # }

  # dimension: score_idlingscore {
  #   type: number
  #   value_format_name: id
  #   sql: ${TABLE}.score_idlingscore ;;
  # }

  # dimension: score_speedingscore {
  #   type: number
  #   sql: ${TABLE}.score_speedingscore ;;
  # }

  # dimension: score_topspeed {
  #   type: number
  #   sql: ${TABLE}.score_topspeed ;;
  # }

  # dimension: score_totalecoscore {
  #   type: number
  #   sql: ${TABLE}.score_totalecoscore ;;
  # }

  # dimension: speedhistogram_bin1 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin1 ;;
  # }

  # dimension: speedhistogram_bin10 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin10 ;;
  # }

  # dimension: speedhistogram_bin11 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin11 ;;
  # }

  # dimension: speedhistogram_bin12 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin12 ;;
  # }

  # dimension: speedhistogram_bin13 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin13 ;;
  # }

  # dimension: speedhistogram_bin14 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin14 ;;
  # }

  # dimension: speedhistogram_bin15 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin15 ;;
  # }

  # dimension: speedhistogram_bin16 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin16 ;;
  # }

  # dimension: speedhistogram_bin17 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin17 ;;
  # }

  # dimension: speedhistogram_bin2 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin2 ;;
  # }

  # dimension: speedhistogram_bin3 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin3 ;;
  # }

  # dimension: speedhistogram_bin4 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin4 ;;
  # }

  # dimension: speedhistogram_bin5 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin5 ;;
  # }

  # dimension: speedhistogram_bin6 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin6 ;;
  # }

  # dimension: speedhistogram_bin7 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin7 ;;
  # }

  # dimension: speedhistogram_bin8 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin8 ;;
  # }

  # dimension: speedhistogram_bin9 {
  #   type: number
  #   sql: ${TABLE}.speedhistogram_bin9 ;;
  # }

  # dimension: startlocation_accuracy {
  #   type: number
  #   sql: ${TABLE}.startlocation_accuracy ;;
  # }

  # dimension: startlocation_latitude {
  #   type: number
  #   sql: ${TABLE}.startlocation_latitude ;;
  # }

  # dimension: startlocation_longitude {
  #   type: number
  #   sql: ${TABLE}.startlocation_longitude ;;
  # }

  # dimension: startlocation_validity {
  #   type: number
  #   sql: ${TABLE}.startlocation_validity ;;
  # }

  # dimension: startodometer {
  #   type: number
  #   sql: ${TABLE}.startodometer ;;
  # }

  dimension_group: starttimestamp {
   label: "Trip Start"
   type: time
   timeframes: [time, date, week, month]
   sql: ${TABLE}.starttimestamp ;;
  }

  # dimension: vehicleid {
  #   type: string
  #   sql: ${TABLE}.vehicleid ;;
  # }

   measure: trips {
     label: "# of Trips"
     type: count
     # drill_fields: [id, name]
   }

  measure: active_devices {
    type:  count_distinct
    sql:  ${deviceid} ;;
  }
}
