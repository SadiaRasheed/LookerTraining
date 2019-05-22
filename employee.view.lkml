view: employee {
  sql_table_name: public.employee ;;

  dimension: assigned_branch_id {
    type: number
    sql: ${TABLE}.assigned_branch_id ;;
  }

  dimension: dept_id {
    type: number
    sql: ${TABLE}.dept_id ;;
  }

  dimension: emp_id {
    type: number
    sql: ${TABLE}.emp_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
 dimension: fullname{
   type: string
   sql:  ${first_name} || ''||${last_name} ;;
 }
  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: superior_emp_id {
    type: number
    sql: ${TABLE}.superior_emp_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
