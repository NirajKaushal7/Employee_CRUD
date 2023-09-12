package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import entity.Employee;

public class EmployeeService {

	List<Employee> empList = new ArrayList<>();

	public EmployeeService() {
		Employee e1 = new Employee(1, "Niraj", "Kaushal", "niraj", "123", true);
		Employee e2 = new Employee(2, "Ajay", "Rathore", "ajay", "321", false);
		Employee e3 = new Employee(3, "Ram", "Ji", "ram", "1234", false);
		empList.add(e1);
		empList.add(e2);
		empList.add(e3);
	}

	public List<Employee> getList() {
		return empList;
	}

	public Employee login(String userName, String password) {
	Optional<Employee> authenticEmployee  = empList.stream().filter(employee -> employee.getUserName().equals(userName)  && employee.getPassword().equals(password)).findFirst();	
	if(authenticEmployee.isPresent())
	{
	return 	authenticEmployee.get();
	}
		return null;
	}
}
