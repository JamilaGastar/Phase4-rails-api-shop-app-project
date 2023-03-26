import { useState } from "react";
import LoginForm from "../containers/LoginForm";
import SignUpForm from "../containers/SignUpForm";
import { Button } from "../styles";


function Login({ onLogin }) {
  const [showLogin, setShowLogin] = useState(true);

  return (
    <div className="container">
      <h1>Trifter</h1>
      {showLogin ? (
        <>
          <LoginForm onLogin={onLogin} />
          
          <p>
            Don't have an account? &nbsp;
            <Button color="secondary" onClick={() => setShowLogin(false)}>
              Sign Up
            </Button>
          </p>
        </>
      ) : (
        <>
          <SignUpForm onLogin={onLogin} />
          
          <p>
            Already have an account? &nbsp;
            <Button color="secondary" onClick={() => setShowLogin(true)}>
              Log In
            </Button>
          </p>
        </>
      )}
    </div>
  );
}



export default Login;
