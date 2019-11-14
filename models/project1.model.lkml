connection: "thelook"

# include all the views
include: "/views/**/*.view"

include: "*testheatmappt2.dashboard.lookml"

datagroup: project1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: project1_default_datagroup

explore: calendar_table {}

explore: connection_reg_r3 {}

explore: derived_test_table_3_20190510 {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: ints {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: schema_migrations {}

explore: test_img {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders_test {
  label: "Orders Test"
  from: orders
  view_name:  orders
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  sql_always_where: {% if orders.Month_selector._parameter_value == "'January'" %}
      ${orders.created_month_name} = "January"
      {% elsif orders.Month_selector._parameter_value == "'Current Month'" %}
      ((((${orders.created_raw}) >= ((TIMESTAMP(DATE_FORMAT(CURDATE(),'%Y-%m-01')))) AND (${orders.created_raw}) < ((DATE_ADD(TIMESTAMP(DATE_FORMAT(CURDATE(),'%Y-%m-01')),INTERVAL 1 month))))))
      {% else %}
      ${orders.created_month_name} = "February"
      {% endif %}
      ;;
}


view: derived_table_test {
  parameter: Select_Me{
    allowed_value: {
      label: "US"
      value: "US"
    }
    allowed_value: {
      label: "EU"
      value: "EU"
    }
  }

  parameter: give_me_value{
    type: number
  }
  derived_table: {
    sql: SELECT orders.created_at as Created, order_items.sale_price as Sale_Price, orders.user_id as User_ID, orders.status as Status
    FROM orders LEFT JOIN order_items ON orders.id = order_items.order_id;;
  }

  dimension_group: : created {
    sql: ${TABLE}.Created ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
  }
  dimension: parameterized_date {
    sql: ${created_date} ;;
    html: {% if Select_Me._parameter_value == "'EU'" %}
    {{ rendered_value | date: "%d/%m/%Y"}}
    {% elsif Select_Me._parameter_value == "'US'" %}
    {{ rendered_value | date: "%m/%d/%Y"}}
    {% endif %}
    ;;
  }

  measure: Sum_Sales{
    sql: ${TABLE}.Sale_Price;;
    type: sum
    value_format_name: usd_0
  }

  measure: test {
    sql: ${Sum_Sales}/${give_me_value};;
    type: number
  }

  dimension: status {
    sql: ${TABLE}.Status;;
    type: string
  }
}


explore: derived_table_test {}
