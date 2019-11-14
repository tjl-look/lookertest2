- dashboard: heatmapbug_test2
  title: heatmapbug test2
  layout: newspaper
  elements:
  - title: heatmapbug test2
    name: heatmapbug test2
    model: project1
    explore: order_items
    type: looker_grid
    fields: [products.category, orders.created_year, orders.count]
    pivots: [orders.created_year]
    fill_fields: [orders.created_year]
    sorts: [orders.count desc 0, orders.created_year]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      orders.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: true, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 0
    width: 8
