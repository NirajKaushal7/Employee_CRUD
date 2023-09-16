package service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import entity.Employee;

public class EmployeeService {

	List<Employee> empList = new ArrayList<>();
	static EmployeeService employeeService; 
	private EmployeeService() {
		Employee e1 = new Employee(1, "Niraj", "Kaushal", "niraj", "123", true);
		Employee e2 = new Employee(2, "Ajay", "Rathore", "ajay", "321", false);
		Employee e3 = new Employee(3, "Ram", "Ji", "ram", "1234", false);
		empList.add(e1);
		empList.add(e2);
		empList.add(e3);
	}
	

	public static EmployeeService getEmployeeService() {
		if(employeeService == null)
		{
			employeeService	= new EmployeeService();	
		}
		return employeeService;
	}
	public List<Employee> getList() {
		
		return empList.stream().sorted(Comparator.comparingInt(Employee::getId)).collect(Collectors.toList());
	}

	public Employee login(String userName, String password) 
	{
	Optional<Employee> authenticEmployee  = empList.stream().filter(employee -> employee.getUserName().equals(userName)  && employee.getPassword().equals(password)).findFirst();	
	if(authenticEmployee.isPresent())
	{
	return 	authenticEmployee.get();
	}
		return null;
	}

	public Employee getEmployeeById(int id) 
	{
	Optional<Employee> authenticEmployee  = empList.stream().filter(employee -> employee.getId() == id).findFirst();	
	if(authenticEmployee.isPresent())
	{
	return 	authenticEmployee.get();
	}
		return null;
	}
	
	public void addEmployee(int id, String firstName, String lastName, String userName, String password, boolean isAdmin)
	{
	Employee e = new Employee( id,  firstName,  lastName,  userName,  password, isAdmin);
	empList.add(e);
	}
	

	public void editEmployee(int id, String firstName, String lastName, String userName, String password, boolean isAdmin )
	{
		empList.forEach(employee -> {
            if (employee.getId() == id) {	
            employee.setFirstName(firstName);
            employee.setLastName(lastName);
            employee.setUserName(userName);
            employee.setPassword(password);
            if(!employee.isAdmin())
            {
            employee.setAdmin(isAdmin);
            }
               }
		});
	}
		

	public void deleteEmployee(int id)
	{	
	boolean isAdmin = empList.stream().anyMatch(e -> e.getId() == id && e.isAdmin());	
	if(!isAdmin)
	{
	empList.removeIf(employee -> employee.getId() == id);
	}
	}
}