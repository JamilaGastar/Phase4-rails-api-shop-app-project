import React from "react";
import { Link } from "react-router-dom";
import { Button } from "../styles";
import Nav from 'react-bootstrap/Nav';

function NavBar({ user, setUser }) {
  function handleLogoutClick() {
    fetch("/logout", { method: "DELETE" }).then((r) => {
      if (r.ok) {
        setUser(null);
      }
    });
  }

  return (
    <div className="container">
      <h1>Trifter</h1>
      <Nav>
        <Button as={Link} to="/new">
          New Item
        </Button>
        <Button variant="outline" onClick={handleLogoutClick}>
          Logout
        </Button>
      </Nav>
    </div>
  );
}

export default NavBar;
