import './App.css';
import { 
    BrowserRouter as Router, 
    Route, 
    Link, 
    Switch 
} from 'react-router-dom'; 
import Landing from './pages/landing.js'
import cRegister from './pages/companyRegister.js'
function App() {
  return (
  	<Router>
	  <Switch>
	  	<Route exact path="/" component={Landing} />
	  	<Route exact path="/regc" component={cRegister} />
	  </Switch>
	 </Router>
  );
}

export default App;
