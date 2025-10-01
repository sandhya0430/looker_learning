view: user_dynamic {
  sql_table_name: `elastic-pocs.Super_Store_Sales.Users` ;;
  parameter: metric_choice{
    label: "choose metric"
    type: string
    default_value: "user_name"
    allowed_value: {label:"Total User" value:"user_name"}
    allowed_value: {label:"Email" value:"email"}
    allowed_value: {label:"User Id" value:"id"}

  }
  #Base measure
  measure: total_user {type:count sql: ${TABLE}.UserName;; label:"Total User"}
  measure: total_email {type:count sql: ${TABLE}.Email ;; label:" Total Email"}
  measure: total_id {type:count sql: ${TABLE}.Id;;label: "Total Id"}

  measure: dynamic_metric {
    type: number
    sql:
    CASE
    WHEN{ %parameter meteric_choice %} = 'user_name' THEN ${total_user};;
  }


 }
