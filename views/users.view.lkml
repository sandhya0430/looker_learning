view: users {
  sql_table_name: `elastic-pocs.Super_Store_Sales.Users` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
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
