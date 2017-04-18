- dashboard: car_genie_kpis
  title: Car Genie KPIs
  layout: grid
  rows:
  - elements: [web_traffic_kpi_visit1, web_traffic_kpi_visit2, web_traffic_kpi_visit_ratio]
    height: 200
  - elements: [orders_kpi_total_orders, orders_kpi_total_orders_amount, orders_kpi_total_orders_discount_amount, stock_kpi_stock]
    height: 200
  - elements: [orders_kpi_most_common_make, orders_kpi_most_common_model]
    height: 200
  - elements: [app_kpi_total_download, app_kpi_total_update, app_kpi_total_ratings, app_kpi_avg_ratings]
    height: 200

  filters:
  - name: dashboard_date
    title: 'Date'
    type: date_filter
    default_value: 2017/04/01 to 2017/04/05

  elements:
  - name: web_traffic_kpi_visit1
    # width: 4
    # height: 2
    # top: 1
    title: Product Page Views
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.visits_pp]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_visit2
    # width: 4
    # height: 2
    title: Register Your Interest Views
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.visits_ryi]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_visit_ratio
    # width: 2
    # height: 2
    title: Views Ratio %
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.visits_ratio]
    listen:
      dashboard_date: web_traffic_ga.visit_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: orders_kpi_total_orders_amount
    # width: 2
    # height: 2
    # top: 10
    # left: 1
    title: Orders Amount
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    measures: [orders.gross_amount]
    listen:
      dashboard_date: orders.order_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}


  - name: orders_kpi_total_orders
    title: Orders
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    measures: [orders.orders_count]
    listen:
      dashboard_date: orders.order_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}


  - name: orders_kpi_total_orders_discount_amount
    title: Orders Discount Amount
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    measures: [orders.gross_discount_amount]
    listen:
      dashboard_date: orders.order_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}


  - name: orders_kpi_most_common_make
    title: Most Common Make
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    dimensions: [orders.car_make]
    measures: [orders.orders_count]
    filters:
      orders.order_date: 2017/04/01 to 2017/04/05
    sorts: [orders.orders_count desc]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}
    hidden_fields: [orders.orders_count]

  - name: orders_kpi_most_common_model
    title: Most Common Model
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    dimensions: [orders.car_model]
    measures: [orders.orders_count]
    filters:
      orders.order_date: 2017/04/01 to 2017/04/05
    sorts: [orders.orders_count desc]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}
    hidden_fields: [orders.orders_count]

  - name: stock_kpi_stock
    title: Stock
    type: single_value
    model: connected_car_localhost
    explore: stock
    dimensions: [stock.stock_date]
    measures: [stock.qty_stock]
    filters:
      stock.stock_date: 2017/04/01 to 2017/04/05
    sorts: [stock.stock_date desc]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: app_kpi_total_download
    title: APP Download
    type: single_value
    model: connected_car_localhost
    explore: app_download
    measures: [app_download.download_count]
    filters:
      app_download.download_date: 2017/04/01 to 2017/04/05
    sorts: [app_download.download_date]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: app_kpi_total_update
    title: APP Update
    type: single_value
    model: connected_car_localhost
    explore: app_download
    measures: [app_download.updates_count]
    filters:
      app_download.download_date: 2017/04/01 to 2017/04/05
    sorts: [app_download.download_date]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: app_kpi_total_ratings
    title: APP Ratings
    type: single_value
    model: connected_car_localhost
    explore: app_ratings
    measures: [app_ratings.rating_count]
    filters:
      app_ratings.rating_date: 2017/04/01 to 2017/04/05
    sorts: [app_ratings.rating_date]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: app_kpi_avg_ratings
    title: APP Average Rating Score
    type: single_value
    model: connected_car_localhost
    explore: app_ratings
    measures: [app_ratings.avg_rating]
    filters:
      app_ratings.rating_date: 2017/04/01 to 2017/04/05
    sorts: [app_ratings.rating_date]
    limit: '1'
    column_limit: '50'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}



  # - name: add_a_unique_name_1492099746
  #   hidden: yes
  #   width: 3
  #   height: 5
  #   title: Untitled Visualization
  #   type: looker_map
  #   model: connected_car_localhost
  #   explore: orders_details
  #   dimensions: [customers.map_area]
  #   measures: [orders.orders_count, orders.gross_amount]
  #   sorts: [orders.orders_count desc]
  #   limit: '500'
  #   column_limit: '50'
  #   query_timezone: Europe/London
  #   map_plot_mode: points
  #   heatmap_gridlines: true
  #   heatmap_opacity: 0.5
  #   show_region_field: true
  #   draw_map_labels_above_data: true
  #   map_tile_provider: positron
  #   map_position: custom
  #   map_scale_indicator: 'off'
  #   map_pannable: true
  #   map_zoomable: true
  #   map_marker_type: circle
  #   map_marker_icon_name: default
  #   map_marker_radius_mode: proportional_value
  #   map_marker_units: meters
  #   map_marker_proportional_scale_type: linear
  #   map_marker_color_mode: fixed
  #   show_view_names: true
  #   show_legend: true
  #   quantize_map_value_colors: false
  #   map_latitude: 55
  #   map_longitude: -3
  #   map_zoom: 5
