view: customers {
  sql_table_name: SYSTEM.V_MRT_CONCAR_STG_CUSTOMERS ;;

  dimension: membership_number {
    type: string
    sql: ${TABLE}.MEMBERSHIP_NUMBER ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.AGE ;;
  }

  dimension: age_tier {
    type: string
    sql: case
            when ${TABLE}.AGE >=18 and ${TABLE}.AGE <=34 then '18 - 34'
            when ${TABLE}.AGE >=35 and ${TABLE}.AGE <=44 then '35 - 44'
            when ${TABLE}.AGE >=45 and ${TABLE}.AGE <=54 then '45 - 54'
            when ${TABLE}.AGE >=55 and ${TABLE}.AGE <=64 then '55 - 64'
            when ${TABLE}.AGE >=65 then '65+'
            else 'Undefined'
    end;;
  }

  dimension_group: car_genie_start {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.CAR_GENIE_START_DATE ;;
  }

  dimension_group: car_genie_expiry {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.CAR_GENIE_EXPIRY_DATE ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.LOCATION ;;
  }

  dimension: map_area {
    type:  string
    map_layer_name: uk_postcode_areas
    sql:${TABLE}.UK_POSTCODE_AREA ;;
  }

  dimension_group: renewal {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.RENEWAL_DATE ;;
  }

  dimension: tenure {
    label: "Tenure Tier"
    type: string
    sql: case
    when ${TABLE}.TENURE =0 then '0 - Tenure 0'
    when ${TABLE}.TENURE =1 then '1 - Tenure 1'
    when ${TABLE}.TENURE =2 then '2 - Tenure 2'
    when ${TABLE}.TENURE =3 then '3 - Tenure 3'
    when ${TABLE}.TENURE =4 then '4 - Tenure 4'
    when ${TABLE}.TENURE =5 then '5 - Tenure 5'
    when ${TABLE}.TENURE >=6 and ${TABLE}.TENURE <=10 then '6 - Tenure 6-10'
    when ${TABLE}.TENURE >=11 and ${TABLE}.TENURE <=19 then '7 - Tenure 11-19'
    when ${TABLE}.TENURE >=20 then '8 - Tenure 20+'
    else 'Undefined'
    end;;
  }

  measure: customrrs_count {
    group_label: "# Customers"
    label: "# of Customers"
    type: count
  }
}
