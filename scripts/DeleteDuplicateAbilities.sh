join_table_distinct = AbilitiesEmployee.select(:employee_id, :ability_id, :school_id).distinct()
AbilitiesEmployee.delete_all
join_table_distinct.each do |elem|
	AbilitiesEmployee.create(ability_id: elem[:ability_id], employee_id: elem[:employee_id], school_id: elem[:school_id])
end