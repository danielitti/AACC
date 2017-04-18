- dashboard: car_genie_overview
  title: Car Genie Overview
  layout: grid
  rows:
  - elements: [web_traffic_bar_chart, web_traffic_table]
    height: 400
  - elements: [orders_table]
    height: 200
  - elements: [download_line_chart, download_table]
    height: 300



  filters:
  - name: dashboard_date
    title: 'Date'
    type: date_filter
    default_value: 2017/04/01 to 2017/04/05

  #- name: dashboard_app_platform
    #title: 'App Platform'
    #type: field_filter
    #explore: app_download
    #field: app_download.platform

  elements:

  - name: web_traffic_bar_chart
    title: Web Traffic
    width: 10
    type: looker_column
    model: ga_big_query_web_data
    explore: web_traffic_ga
    dimensions: [web_traffic_ga.visit_timestamp_date]
    fill_fields: [web_traffic_ga.visit_timestamp_date]
    measures: [web_traffic_ga.visits_pp, web_traffic_ga.visits_ryi]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    sorts: [web_traffic_ga.visit_timestamp_date]
    limit: '500'
    column_limit: '50'
    query_timezone: Europe/London
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_label_rotation: -45
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable

  - name: web_traffic_table
    title: Web Traffic
    type: table
    model: ga_big_query_web_data
    explore: web_traffic_ga
    dimensions: [web_traffic_ga.visit_timestamp_date]
    fill_fields: [web_traffic_ga.visit_timestamp_date]
    measures: [web_traffic_ga.visits_pp, web_traffic_ga.visits_ryi]
    dynamic_fields:
    - table_calculation: ratio
      label: Ratio %
      expression: ${web_traffic_ga.visits_ryi}/${web_traffic_ga.visits_pp}
      value_format:
      value_format_name: percent_2
    total: true
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    sorts: [web_traffic_ga.visit_timestamp_date]
    limit: '500'
    column_limit: '50'
    query_timezone: Europe/London


  - name: download_line_chart
    title: Cumulative Download
    type: looker_line
    model: connected_car_localhost
    explore: app_download
    dimensions: [app_download.download_date]
    measures: [app_download.cumulative_download_count]
    listen:
      dashboard_date: app_download.download_date
    sorts: [app_download.download_date]
    limit: '500'
    column_limit: '50'
    query_timezone: Europe/London
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    fill_fields: [app_download.download_date]
    x_axis_label_rotation: -45
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}

  - name: download_table
    title: Download by Platform
    width: 6
    type: table
    model: connected_car_localhost
    explore: app_download
    dimensions: [app_download.download_date, app_download.platform]
    pivots: [app_download.platform]
    fill_fields: [app_download.download_date]
    measures: [app_download.download_count]
    listen:
      dashboard_date: app_download.download_date
      #dashboard_app_platform: app_download.platform
    total: true
    sorts: [app_download.download_date, app_download.platform]
    limit: '600'
    column_limit: '50'
    query_timezone: Europe/London

  - name: orders_table
    title: Orders
    width: 16
    type: table
    model: connected_car_localhost
    explore: orders_details
    dimensions: [orders.order_date]
    measures: [orders.orders_count, orders.gross_amount, orders.gross_discount_amount]
    listen:
     dashboard_date: orders.order_date
    sorts: [orders.order_date]
    limit: '500'
    column_limit: '50'
    total: true
    query_timezone: Europe/London


#
#   - name: ratings_bar_chart
#     title: Ratings
#     width: 10
#     type: looker_column
#     model: connected_car_localhost
#     explore: app_ratings
#     dimensions: [app_ratings.rating_date]
#     fill_fields: [app_ratings.rating_date]
#     measures: [app_ratings.avg_rating]
#     listen:
#       dashboard_date: app_ratings.rating_date
#       #dashboard_app_platform: app_ratings.platform
#     sorts: [app_download.download_date desc]
#     limit: '600'
#     column_limit: '50'
#     query_timezone: Europe/London
#     y_axis_min: [0]
#     y_axis_max: [5]
#     #x_axis_datetime_label: 'dd-mm-yyyy'
#     stacking: ''
#     show_value_labels: true
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: false
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     x_axis_label_rotation: -45
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: '#808080'
#     show_null_points: true
#     point_style: none
#     interpolation: linear
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#
#   - name: ratings_table
#     title: Ratings
#     width: 6
#     type: table
#     model: connected_car_localhost
#     explore: app_ratings
#     dimensions: [app_ratings.rating_date]
#     fill_fields: [app_ratings.rating_date]
#     measures: [app_ratings.rating_count, app_ratings.avg_rating]
#     listen:
#       dashboard_date: app_ratings.rating_date
#       #dashboard_app_platform: app_ratings.platform
#     sorts: [app_download.download_date]
#     limit: '600'
#     column_limit: '50'
#     total: true
#     query_timezone: Europe/London
#