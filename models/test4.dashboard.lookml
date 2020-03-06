- dashboard: tes4
  title: tes4
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: project1
    explore: order_items
    type: looker_grid
    fields: [products.category, orders.created_year, orders.count]
    pivots: [orders.created_year]
    fill_fields: [orders.created_year]
    sorts: [orders.count desc 0, orders.created_year]
    limit: 500
    query_timezone: UTC
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
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
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#FFCA28",
        font_color: !!null '', color_application: {collection_id: b40c75b1-e794-482f-8fb6-9373a0052342,
          palette_id: b5320db1-1662-41cd-8487-43951541af4e, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: along a scale..., value: !!null '',
        background_color: "#FFCA28", font_color: !!null '', color_application: {collection_id: b40c75b1-e794-482f-8fb6-9373a0052342,
          palette_id: b5320db1-1662-41cd-8487-43951541af4e, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
