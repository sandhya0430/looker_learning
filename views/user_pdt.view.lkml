
view: user_pdt {
  derived_table: {
    sql:
      SELECT
        ID,
        COUNT(UserName) AS number_of_users,
        COUNT(Email) AS number_of_emails,
        COUNT(*) AS user_count
      FROM `elastic-pocs.Super_Store_Sales.Users`
      GROUP BY ID
    ;;
    datagroup_trigger: user_datagroup
  }

  # Primary key
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  # Aggregated counts as numeric dimensions
  dimension: number_of_users {
    type: number
    sql: ${TABLE}.number_of_users ;;
  }

  dimension: number_of_emails {
    type: number
    sql: ${TABLE}.number_of_emails ;;
  }

  dimension: user_count {
    type: number
    sql: ${TABLE}.user_count ;;
  }
}
