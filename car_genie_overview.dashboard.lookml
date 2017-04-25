- dashboard: car_genie_overview
  title: Car Genie Overview
  layout: grid
  rows:
  - elements: [web_traffic_bar_chart]
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
    measures: [orders.orders_count, orders.gross_amount, orders.discounted_orders_count, orders.discounted_gross_amount]
    listen:
     dashboard_date: orders.order_date
    sorts: [orders.order_date]
    limit: '500'
    column_limit: '50'
    total: true
    query_timezone: Europe/London

  - name: web_traffic_bar_chart
    title: Web Traffic
    type: looker_column
    model: ga_big_query_web_data
    explore: web_traffic_ga
    dimensions: [web_traffic_ga.funnel_journey_page]
    measures: [web_traffic_ga.views]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    sorts: [web_traffic_ga.funnel_journey_page]
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
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    show_dropoff: true
    column_spacing_ratio: 0
    column_group_spacing_ratio:
    hide_legend: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    colors: ['palette: Looker Classic']
    series_colors: {}