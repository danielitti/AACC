view: app_ratings {
  sql_table_name: SYSTEM.MRT_CONCAR_STG_APP_RATINGS ;;

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.LANGUAGE ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.APP_ID ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.APP_NAME ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}.PUBLISHER_ID ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.RATING ;;
  }

  dimension_group: rating {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.RATING_DATE ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension: review {
    type: string
    sql: ${TABLE}.REVIEW ;;
  }


  dimension: version {
    type: string
    sql: ${TABLE}.VERSION ;;
  }

  measure: rating_count {
    group_label: "# Rating"
    label: "# of Rating"
    type: count
    drill_fields: [platform]
  }

  measure: avg_rating {
    group_label: "AVG of Rating"
    label: "AVG Rating"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.RATING ;;

  }


}
