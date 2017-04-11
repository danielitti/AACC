view: provisioning {
  sql_table_name: SYSTEM.MRT_CONCAR_STG_PROVISIONING ;;

  dimension_group: provisioning {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.PROVISIONING_DATE ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.SUPPLIER_NAME ;;
  }

  measure: qty_provisioned {
    group_label: "# Provisioned"
    label: "# Provisioned"
    type: sum
    sql: ${TABLE}.QTY ;;
  }

}
