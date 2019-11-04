connection: "thelook"

# include all the views
include: "/views/**/*.view"

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
