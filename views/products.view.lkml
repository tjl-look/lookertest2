view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    link: {
      label: "Drill to Dashboard B"
      url: "/dashboards/5?Brand={{ value | url_encode }}&Date={{ _filters['orders.created_date'] | url_encode }}
      &Department={{ products.department | url_encode }}"
    }
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    link: {
      label: "Drill to Explore"
      url: "https://localhost:9999/explore/project1/products?
 fields=products.id,products.brand
 ,products.item_name,products.retail_price
 ,products.department,products.category
 &f[products.brand]={{ products.brand | url_encode }}"
    }
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
