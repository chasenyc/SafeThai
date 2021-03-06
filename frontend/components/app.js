import React from 'react';
import { Link } from 'react-router';

const App = ({children}) => (
  <div>
    <header>
      <Link to="/" className="header-link"><h1>Safe Thai</h1></Link>
    </header>
    {children}
  </div>
);

export default App;
