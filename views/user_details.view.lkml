view: user_details {
  sql_table_name: `elastic-pocs.Super_Store_Sales.user_details` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: region_id {
    type: number
    sql: ${TABLE}.Region_ID ;;
  }
  dimension: user_name {
    type: string
    sql: ${TABLE}.UserName ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user_name]
  }
}
