view: intelematics_trip_IDs {
  #sql_table_name: public.aa_trips ;;
  derived_table: {
    sql:  select distinct deviceid, driverid, vehicleid from public.aa_trips where rs_environment = 'prod';;
  }

  dimension: deviceid {
    label: "Device ID"
    group_label: "ID"
    type: string
    hidden:  yes
    sql: ${TABLE}.deviceid ;;
  }

  dimension: driverid {
    label: "Driver ID"
    group_label: "ID"
    type: string
    hidden:  yes
    sql: ${TABLE}.driverid ;;
  }

  dimension: vehicleid {
    label: "Vehicle ID"
    group_label: "ID"
    type: string
    hidden:  yes
    sql: ${TABLE}.vehicleid ;;
  }

  measure: distinctIDs {
    label: "# Distinct IDs"
    group_label: "Count"
    hidden:  yes
    type: count
  }
}
