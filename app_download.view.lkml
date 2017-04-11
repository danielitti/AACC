view: app_download {
  sql_table_name: SYSTEM.MRT_CONCAR_STG_APP_DOWNLOAD ;;

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension_group: download {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.DOWNLOAD_DATE ;;
  }

  measure: download_count {
    group_label: "# of Download"
    label: "# Download"
    type: sum
    sql: ${TABLE}.DOWNLOADS ;;
  }

  measure: updates_count {
    group_label: "# of Updates"
    label: "# Updates"
    type: sum
    sql: ${TABLE}.UPDATES ;;
  }

  measure: cumulative_download_count {
    group_label: "# Cumulative of Download"
    label: "# Cumulative Download"
    type: running_total
    sql: ${download_count} ;;
  }

  measure: cumulative_updates_count {
    group_label: "# Cumulative of Updates"
    label: "# Cumulative Updates"
    type: running_total
    sql: ${updates_count} ;;
  }

}
