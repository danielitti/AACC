view: web_traffic_ga_membership_number {
  derived_table: {
    sql:  SELECT *
          FROM
          (SELECT fullVisitorId AS cookie_ID, min(hits.customDimensions.value) as membership_number
            FROM  (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_],
                  TIMESTAMP('20170324'),
                  TIMESTAMP('20180101')))
            WHERE hits.customDimensions.index=12 = true
                  and hits.customDimensions.value is not null

            GROUP BY cookie_ID),

          (SELECT fullVisitorId AS cookie_ID, min(hits.customDimensions.value) as membership_number
           FROM  (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_intraday_],
                TIMESTAMP(replace(string(current_date()), '-', '')),
                TIMESTAMP(replace(string(current_date()), '-', ''))))

            WHERE hits.customDimensions.index=12 = true
                  and hits.customDimensions.value is not null

            GROUP BY cookie_ID);;

    }

  dimension: cookie_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.COOKIE_ID ;;
  }

  dimension: membership_number {
     type: string
    hidden:  yes
     sql: ${TABLE}.MEMBERSHIP_NUMBER ;;
   }

  measure: distinct_membership_number {
    label: "Distinct Membership  Number"
    type: count_distinct
    hidden:  yes
    sql:  ${membership_number} ;;
  }

}
