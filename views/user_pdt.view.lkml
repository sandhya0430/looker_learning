view: user_pdt {
  derived_table: {
    sql: SELECT ID,
    SUM(user_name)AS number_of_users,
    SUM(email) AS number_of_email,
    COUNT (*) AS user_count
     FROM `elastic-pocs.Super_Store_Sales.Orders`
    GROUP BY:ID
    ;;
    datagroup_trigger:user_datagroup
  }

 }
