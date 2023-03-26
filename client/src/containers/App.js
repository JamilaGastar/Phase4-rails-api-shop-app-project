import React, { useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import NavBar from "../components/NavBar";
import Login from "../components/Login";
import MyStore from "../components/MyStore";
import NewItem from "../components/NewItem";

function App() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    // auto-login
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
      }
    });
  }, []);

  if (!user) return <Login onLogin={setUser} />;

  return (
    <>
      <NavBar user={user} setUser={setUser} />
      <main>
        <Routes>
          <Route path="/new">
            <NewItem user={user} />
          </Route>
          <Route path="/">
            <MyStore />
          </Route>
        </Routes>
      </main>
    </>
  );
}

export default App;
