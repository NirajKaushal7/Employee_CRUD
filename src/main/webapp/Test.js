function myFunction() {
			
	var inputValue = document.getElementById("id1").value;
            var intValue = parseInt(inputValue);

            if (!isNaN(intValue)) {
                console.log("Input is an integer: " + intValue);
            } else {
                console.log("Input is not an integer");
            }
}

function testValidEmployeeData()
{
			var id = document.getElementById("id1").value;
			if(Number.isInteger(id))
			{
            }
            else
            {
				   alert("Ram");				         
			}
	
}