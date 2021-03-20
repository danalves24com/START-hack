import React, {Component} from 'react';
import $ from 'jquery'
function addInterest()  {
	var data = $("#int")[0].value
	$("#interests").append(`<li>${data}</li>`)
	$("#int")[0].value = ""
	$("#int")[0].click()
		
}

function submit() {
	var interests = $("#interests")[0].innerText.split("\n").join(", ")
	var settings = {
	  "url": "http://localhost:8000/add/user",
	  "method": "POST",
	  "timeout": 0,
	  "headers": {
	    "Content-Type": "application/json"
	  },
	  "data": JSON.stringify({"name":$("#full_name")[0].value,"cc":window.location.search.split("=")[1],"interests":interests}),
	};
	console.log(settings['data'])

	
	$.ajax(settings).done(function (response) {
		console.log(response);
		$("#code")[0].append(`Use this code to sign-in using the app: ${response.payload.AUTH_KEY}`)
		
	});

}

class Signup extends Component {

	render() {
		return (
			<div id="landing">

				<div class="container mx-auto">
					<div class="h-full">
						<div class="py-10 text-center">
							<center>
								<input placeholder="Full name" id="full_name" class="border-b my-3 py-2"></input> <br></br>
								<input placeholder="email" type="email" id="email" class="border-b my-3 py-2"></input> <br></br>
								<input placeholder="interest" id="int"class="border-b my-3 py-2"></input><button class="rounded border p-2 border-black" onClick={addInterest}>Add</button>
								<h2 class="text-xl">Interests:</h2>
								<ul id="interests"></ul>
							</center>
						</div>
						<div class="py-4 text-center">
							<button class="rounded border border-black p-3 px-5" onClick={submit}>Join</button>
						</div>
						
						<div class="py-1 text-center">
							<div class="text-2xl" id="code"></div>
						</div>
					</div>
				</div>

			</div>


		)
	}

}

export default Signup;
