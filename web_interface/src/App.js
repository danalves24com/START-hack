import './App.css';
import { 
    BrowserRouter as Router, 
    Route, 
    Link, 
    Switch 
} from 'react-router-dom'; 
import Landing from './pages/landing.js'

function App() {
  return (
  	<Router>
	  <Switch>
	  	<Route exact path="/" component={Landing} />
	  </Switch>
	 </Router>
  );
}

export default App;
