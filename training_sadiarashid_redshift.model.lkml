connection: "training-sadiarashid-redshift"

# include all the views
include: "*.view"

datagroup: training_sadiarashid_redshift_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: training_sadiarashid_redshift_default_datagroup

explore: acc_transaction {
  join: account {
    type: left_outer
    sql_on: ${acc_transaction.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }
}

explore: account {
  join: branch {
    type: left_outer
    sql_on: ${account.open_branch_id} = ${branch.branch_id} ;;
    relationship: many_to_one
  }
}

explore: branch {}

explore: business {}

explore: customer {}

explore: department {}

explore: employee {}

explore: individual {}

explore: officer {}

explore: product {}

explore: product_type {}
