import React, {Component} from 'react';
import $ from 'jquery'


class cRegister extends Component {

	render() {
		return (
			<div id="company register">
				<div class="container mx-auto">
					<div class="h-full">
						<div class="py-10">
							
							<center>
								<input type="text" class="border-black border-b" id="companyName" placeholder="company name"></input>
								<button id="reg_btn" class="mx-4 roudned border-black border-2">Register</button>
							</center>
						</div>
						<div class="py-5">
							<div><a id="linkToShare"></a></div>
						</div>
					</div>
				</div>					

			</div>


		)
	}

}

export default cRegister;
