view: user_pdt {
  derived_table: {
    sql: SELECT ID,
    COUNT(DISTINCT user_name) AS number_of_users,
        COUNT(DISTINCT email) AS number_of_emails,
        COUNT(*) AS user_count
     FROM `elastic-pocs.Super_Store_Sales.Users`
    GROUP BY ID
    ;;
    datagroup_trigger: user_datagroup
  }

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
