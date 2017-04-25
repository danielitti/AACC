- dashboard: car_genie_kpis
  title: Car Genie KPIs
  layout: grid
  rows:
  - elements: [web_traffic_title]
    height: 100
  - elements: [web_traffic_kpi_views_pp, web_traffic_kpi_views_shp, web_traffic_kpi_views_fr]
    height: 150
  - elements: [web_traffic_kpi_views_pp_to_shp_ratio, web_traffic_kpi_views_shp_to_fr_ratio]
    height: 100
  - elements: [web_traffic_kpi_views_pp_to_fr_ratio]
    height: 100
  - elements: [orders_title]
    height: 100
  - elements: [orders_kpi_orders_count, orders_kpi_orders_amount, orders_kpi_discounted_orders_count, orders_kpi_discounted_orders_amount]
    height: 150
  - elements: [orders_kpi_most_common_make, orders_kpi_most_common_model]
    height: 150
  - elements: [stock_kpi_last_stock_date, stock_kpi_stock]
    height: 150

  filters:
  - name: dashboard_date
    title: 'Date'
    type: date_filter
    default_value: last 7 days

  elements:

  - name: web_traffic_title
    type: text
    title_text: Web Traffic
    #subtitle_text:
    #body_text:

  - name: orders_title
    type: text
    title_text: Orders
    #subtitle_text:
    #body_text:

  - name: web_traffic_kpi_views_pp
    # width: 4
    # height: 2
    # top: 1
    title: Product Page Views
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.views_pp]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_views_shp
    # width: 4
    # height: 2
    title: Shop Home Page Views
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.views_shp]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_views_fr
    # width: 4
    # height: 2
    title: Final Receipt Page Views
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.views_fr]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_views_pp_to_shp_ratio
    # width: 2
    # height: 2
    title: Product Page to Shop Home Page Visits Ratio %
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.views_pp_to_shp_ratio]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_views_shp_to_fr_ratio
    # width: 2
    # height: 2
    title: Shop Home Page to Final Receipt Visits Ratio %
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.views_shp_to_fr_ratio]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: web_traffic_kpi_views_pp_to_fr_ratio
    # width: 2
    # height: 2
    title: Product Page to Final Receipt Visits Ratio %
    type: single_value
    model: ga_big_query_web_data
    explore: web_traffic_ga
    measures: [web_traffic_ga.views_pp_to_fr_ratio]
    listen:
      dashboard_date: web_traffic_ga.view_timestamp_date
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true
    show_comparison: false
    font_size: small
    label_density: 25
    legend_position: center
    series_types: {}

  - name: orders_kpi_orders_count
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

  - name: orders_kpi_orders_amount
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

  - name: orders_kpi_discounted_orders_count
    title: Discounted Orders
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    measures: [orders.discounted_orders_count]
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

  - name: orders_kpi_discounted_orders_amount
    title: Discounted Orders Amount
    type: single_value
    model: connected_car_localhost
    explore: orders_details
    measures: [orders.discounted_gross_amount]
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
    listen:
      dashboard_date: orders.order_date
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
    listen:
      dashboard_date: orders.order_date
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

  - name: stock_kpi_last_stock_date
    title: Stock updated at
    note:
      text: this date is driven by the "Date" filter
      state: expanded
      display: hover
    type: single_value
    model: connected_car_localhost
    explore: stock
    measures: [stock.last_stock_date]
    listen:
      dashboard_date: stock.stock_date
    sorts: [stock.stock_date desc]
    limit: '1'
    query_timezone: Europe/London
    custom_color_enabled: true
    custom_color: '#8698c6'
    show_single_value_title: true


  - name: stock_kpi_stock
    title: Stock
    type: single_value
    model: connected_car_localhost
    explore: stock
    dimensions: [stock.stock_date]
    measures: [stock.qty_stock]
    listen:
      dashboard_date: stock.stock_date
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

  # - name: app_kpi_total_download
  #   title: APP Download
  #   type: single_value
  #   model: connected_car_localhost
  #   explore: app_download
  #   measures: [app_download.download_count]
  #   filters:
  #     app_download.download_date: 2017/04/01 to 2017/04/05
  #   sorts: [app_download.download_date]
  #   limit: '1'
  #   column_limit: '50'
  #   query_timezone: Europe/London
  #   custom_color_enabled: true
  #   custom_color: '#8698c6'
  #   show_single_value_title: true
  #   show_comparison: false
  #   font_size: small
  #   label_density: 25
  #   legend_position: center
  #   series_types: {}

  # - name: app_kpi_total_update
  #   title: APP Update
  #   type: single_value
  #   model: connected_car_localhost
  #   explore: app_download
  #   measures: [app_download.updates_count]
  #   filters:
  #     app_download.download_date: 2017/04/01 to 2017/04/05
  #   sorts: [app_download.download_date]
  #   limit: '1'
  #   column_limit: '50'
  #   query_timezone: Europe/London
  #   custom_color_enabled: true
  #   custom_color: '#8698c6'
  #   show_single_value_title: true
  #   show_comparison: false
  #   font_size: small
  #   label_density: 25
  #   legend_position: center
  #   series_types: {}

  # - name: app_kpi_total_ratings
  #   title: APP Ratings
  #   type: single_value
  #   model: connected_car_localhost
  #   explore: app_ratings
  #   measures: [app_ratings.rating_count]
  #   filters:
  #     app_ratings.rating_date: 2017/04/01 to 2017/04/05
  #   sorts: [app_ratings.rating_date]
  #   limit: '1'
  #   column_limit: '50'
  #   query_timezone: Europe/London
  #   custom_color_enabled: true
  #   custom_color: '#8698c6'
  #   show_single_value_title: true
  #   show_comparison: false
  #   font_size: small
  #   label_density: 25
  #   legend_position: center
  #   series_types: {}

  # - name: app_kpi_avg_ratings
  #   title: APP Average Rating Score
  #   type: single_value
  #   model: connected_car_localhost
  #   explore: app_ratings
  #   measures: [app_ratings.avg_rating]
  #   filters:
  #     app_ratings.rating_date: 2017/04/01 to 2017/04/05
  #   sorts: [app_ratings.rating_date]
  #   limit: '1'
  #   column_limit: '50'
  #   query_timezone: Europe/London
  #   custom_color_enabled: true
  #   custom_color: '#8698c6'
  #   show_single_value_title: true
  #   show_comparison: false
  #   font_size: small
  #   label_density: 25
  #   legend_position: center
  #   series_types: {}


  # - name: map
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
