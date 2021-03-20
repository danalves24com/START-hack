import React, {Component} from 'react';
import $ from 'jquery'

function generateKey() {
	var name = $("#name")[0].value;
	if(name.length > 0) {
		
		var settings = {
		  "url": "http://localhost:8000/add/company/"+name,
		  "method": "GET",
		  "timeout": 0,
		};

		console.log(name)

		$.ajax(settings).done(function (response) {
		  console.log(response);
			if(response.status == "success") 
			{
				var id = response.payload.company_UID, link = window.location.origin+"/signup";
				var sum = link+"?c="+id;
				$("#linkToShare").html(sum)			
				$("#linkToShare").attr("href", sum)						
			}
		});
	}
}

class cRegister extends Component {

	render() {
		return (
			<div id="company register">
				<div class="container mx-auto">
					<div class="h-full">
						<div class="py-10">
							
							<center>
								<input id="name" type="text" class="border-black border-b" placeholder="company name"></input>
								<button id="reg_btn" class="mx-4 roudned border-black border-2" onClick={generateKey}>Register</button>
							</center>
						</div>
						<div class="py-5">
							<div class="text-center"><a id="linkToShare"></a></div>
						</div>
					</div>
				</div>					

			</div>


		)
	}

}

export default cRegister;
