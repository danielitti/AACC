view: web_traffic_ga {
  derived_table: {
    sql:  SELECT  *
          FROM

          (SELECT  --STRFTIME_UTC_USEC(SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000),"%Y-%m-%d %H:%M:%S") as view_timestamp,
                  SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000) as view_timestamp,
                  visitStartTime,
                  DAYOFWEEK(date) AS day_Of_Week, #Where 1 = Sunday,
                  fullVisitorId AS cookie_ID,
                  '' as membership_number,
                  visitId as session_ID,
                  CASE WHEN hits.page.pagePath like '%/connect-checkout/receipt/%' THEN LEFT(hits.page.pagePath,26) ELSE hits.page.pagePath END as page,
                  totals.timeOnSite as session_Duration_In_Seconds,
                  device.mobileDeviceBranding as device_Mobile_Branding,
                  device.mobileDeviceModel as device_Mobile_Model,
                  device.operatingSystem as device_Operating_System,
                  device.browser as device_Browser,
                  geoNetwork.city as geo_network_city,
                  geoNetwork.country as geo_network_country,
                  trafficSource.referralPath as source_referral_path,
                  trafficSource.source as source,
                  trafficSource.medium as medium,
                  trafficSource.campaign as campaign,
                  device.isMobile as device_is_mobile
                  FROM  (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_],
                        TIMESTAMP('20170324'),
                        TIMESTAMP('20180401')))
                  WHERE (hits.page.pagePath = '/breakdown-cover/connected-car'
                        OR hits.page.pagePath = '/car-genie'
                        OR hits.page.pagePath like '%connect-checkout%')
                        AND hits.type = "PAGE"),


          (SELECT  --STRFTIME_UTC_USEC(SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000),"%Y-%m-%d %H:%M:%S") as view_timestamp,
                  SEC_TO_TIMESTAMP(visitStartTime+ hits.time/1000) as view_timestamp,
                  visitStartTime,
                  DAYOFWEEK(date) AS day_Of_Week, #Where 1 = Sunday,
                  fullVisitorId AS cookie_ID,
                  '' as membership_number,
                  visitId as session_ID,
                  CASE WHEN hits.page.pagePath like '%/connect-checkout/receipt/%' THEN LEFT(hits.page.pagePath,26) ELSE hits.page.pagePath END as page,
                  totals.timeOnSite as session_Duration_In_Seconds,
                  device.mobileDeviceBranding as device_Mobile_Branding,
                  device.mobileDeviceModel as device_Mobile_Model,
                  device.operatingSystem as device_Operating_System,
                  device.browser as device_Browser,
                  geoNetwork.city as geo_network_city,
                  geoNetwork.country as geo_network_country,
                  trafficSource.referralPath as source_referral_path,
                  trafficSource.source as source,
                  trafficSource.medium as medium,
                  trafficSource.campaign as campaign,
                  device.isMobile as device_is_mobile
                  FROM  (TABLE_DATE_RANGE([the-aa-1470042790750:110663916.ga_sessions_intraday_],
                        TIMESTAMP(replace(string(current_date()), '-', '')),
                        TIMESTAMP(replace(string(current_date()), '-', ''))))
                  WHERE (hits.page.pagePath = '/breakdown-cover/connected-car'
                        OR hits.page.pagePath = '/car-genie'
                        OR hits.page.pagePath like '%connect-checkout%')
                        AND hits.type = "PAGE")
        ;;

    }

  dimension: cookie_id {
    type: string
    sql: ${TABLE}.COOKIE_ID ;;
  }

  dimension: device_mobile_model {
    type: string
    sql: ${TABLE}.DEVICE_MOBILE_MODEL ;;
  }

  dimension: device_browser {
    type: string
    sql: ${TABLE}.DEVICE_BROWSER ;;
  }

  dimension: device_is_mobile {
    type: yesno
    sql: ${TABLE}.DEVICE_IS_MOBILE ;;
  }

  dimension: device_mobile_branding {
    type: string
    sql: ${TABLE}.DEVICE_MOBILE_BRANDING ;;
  }

  dimension: device_operating_system {
    type: string
    sql: ${TABLE}.DEVICE_OPERATING_SYSTEM ;;
  }

  dimension: geo_network_city {
    type: string
    sql: ${TABLE}.GEO_NETWORK_CITY ;;
  }

  dimension: geo_network_country {
    type: string
    sql: ${TABLE}.GEO_NETWORK_COUNTRY ;;
  }

  dimension: membership_number {
    type: string
    sql: ${TABLE}.MEMBERSHIP_NUMBER ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.MEDIUM ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.CAMPAIGN ;;
  }

  dimension: source_referral_path {
    type: string
    sql: ${TABLE}.SOURCE_REFERRAL_PATH ;;
  }

  dimension:page  {
    type: string
    sql: ${TABLE}.PAGE ;;
  }

  dimension: page_name {
    type: string
    sql: case
            when ${page} = '/breakdown-cover/connected-car' then 'Product Page'
            when ${page} = '/car-genie' then 'Shop Home Page'
            when ${page} = '/connect-checkout/eligibility' then 'Eligibility'
            when ${page} = '/connect-checkout/' then 'Eligibility'
            when ${page} = '/connect-checkout/delivery' then 'Delivery'
            when ${page} = '/connect-checkout/order-summary' then 'Order Summary'
            when ${page} = '/connect-checkout/receipt/' then 'Receipt'
            else 'Undefined'
        end;;
  }


  dimension: funnel_journey_page {
    label: "Funnel Journey"
    type: string
    sql: case
            when ${page} = '/breakdown-cover/connected-car' then '1 - Product Page'
            when ${page} = '/car-genie' then '2 - Shop Home Page'
            when ${page} = '/connect-checkout/eligibility' then '3 - Eligibility'
            when ${page} = '/connect-checkout/' then '3 - Eligibility'
            when ${page} = '/connect-checkout/delivery' then '4 - Delivery'
            when ${page} = '/connect-checkout/order-summary' then '5 - Order Summary'
            when ${page} = '/connect-checkout/payment' then '6 - Payment'
            when ${page} = '/connect-checkout/receipt/' then '7 - Receipt'
            else 'Undefined'
        end;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension: day_of_week {
    type: string
    sql: case
            when ${TABLE}.DAY_OF_WEEK = 1 then '7 - Sunday'
            when ${TABLE}.DAY_OF_WEEK = 2 then '1 - Monday'
            when ${TABLE}.DAY_OF_WEEK = 3 then '2 - Tuesday'
            when ${TABLE}.DAY_OF_WEEK = 4 then '3 - Wednesday'
            when ${TABLE}.DAY_OF_WEEK = 5 then '4 - Thursday'
            when ${TABLE}.DAY_OF_WEEK = 6 then '5 - Friday'
            when ${TABLE}.DAY_OF_WEEK = 7 then '6 - Saturday'
            else null
        end;;
  }

  dimension_group: view_timestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.view_timestamp ;;
  }

  measure: views {
    label: "# Views"
    group_label: "# Views"
    type: count
    link: {
      label: "Views Trend"
      url: "/looks/244"
    }
    link: {
      label: "Views Trend  by Medium"
      url: "/looks/246"
#      #url: "/explore/ga_big_query_web_data/web_traffic_ga?fields=web_traffic_ga.view_timestamp_date,web_traffic_ga.visits_pp&fill_fields=web_traffic_ga.view_timestamp_date&sorts=web_traffic_ga.view_timestamp_date&limit=30&column_limit=50&query_timezone=Europe%2FLondon&vis=%7B%7D&filter_config=%7B%7D&origin=share-expanded"
    }
  }

  measure: views_pp {
    label: "# Views Product Page"
    group_label: "# Views"
    hidden: no
    type: count
    filters: {
      field: page
      value: "/breakdown-cover/connected-car"
    }
  }

  measure: views_d {
    label: "# Views Delivery Page"
    group_label: "# Views"
    hidden: no
    type: count
    filters: {
      field: page
      value: "/connect-checkout/delivery"
    }
  }

  measure: views_fr {
    label: "# Views Final Receipt"
    group_label: "# Views"
    hidden: no
    type: count
    filters: {
      field: page
      value: "/connect-checkout/receipt/"
    }
  }

  measure: views_pp_to_fr_ratio {
    label: "Product Page to Final Receipt Views Ratio %"
    group_label: "Views Ratio %"
    type: number
    value_format: "0.00\%"
    sql:  ${views_fr}/${views_pp}*100 ;;
    link: {
      label: "Views Ratio % Analysis"
      url: "/looks/251"
    }
  }

  measure: views_shp_to_fr_ratio {
    label: "Delivery Page to Final Receipt Views Ratio %"
    group_label: "Views Ratio %"
    type: number
    value_format: "0.00\%"
    sql:  ${views_fr}/${views_d}*100 ;;
    link: {
      label: "Views Ratio % Analysis"
      url: "/looks/252"
    }
  }

  measure: visitors {
    label: "# Visitors"
    type: count_distinct
    sql:  ${cookie_id} ;;
  }

  measure: sessions {
    label: "# Sessions"
    type: count_distinct
    sql:  ${session_id} ;;
  }

  measure: session_duration_in_seconds {
    label: "Session Duration In Seconds"
    type: sum
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS ;;
  }

  measure: avg_session_duration_in_seconds {
    label: "AVG Session Duration In Seconds"
    type: average
    value_format: "0.00"
    sql: ${TABLE}.SESSION_DURATION_IN_SECONDS ;;
  }
}
