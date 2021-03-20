import React, {Component} from 'react';


class Landing extends Component {

	render() {
		return (
			<div id="landing" class="container mx-auto">
				<div class="h-screen">
					<div class="text-center text-3xl h-1/2" id="head">
						<h1 class="py-40">Coffee Time</h1>
					</div>
					<div class="h-1/2">
						<div class="grid grid-cols-2">
							<div id="about" class="h-full">
								<h2 class="text-2xl w-full text-center">About</h2>
								<p class="py-4 px-4">Coffee Time, is developing a mobile app to help employees at Accenture and other companies and teams working remotely to enjoy higher quality social interactions with co-workers via an algorithm that facilitates audio and video calls, both at random and based upon shared interests you never even knew existed.</p>
							</div>
							<div id="start">
								<h2 class="text-2xl w-full text-center">Start Here</h2>
								<div class="py-20">
									<center>
										<a href="/regc" class="rounded border border-black border-4 p-4">Start using Coffee Time in your company</a>
									</center>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		)
	}

}

export default Landing;
