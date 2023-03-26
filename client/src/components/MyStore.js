import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { Button } from "../styles";


function MyStore() {
  const [items, setItems] = useState([]);

  useEffect(() => {
    fetch("/items")
      .then((r) => r.json())
      .then(setItems);
  }, []);

  return (
    <div style={{columnCount: "4"}}>
      {items.length > 0 ? (
        items.map((item) => (
          <div>
            <h2>{item.name}</h2>
            <img src={item.image_url} alt=""/>
            <p>{item.description}</p>
            <p>{item.condition}</p>
            <p>{item.size}</p>
            <p>{item.price}</p>
            <p>{item.stock}</p>
          </div>
        ))
      ) : (
        <>
          <h2>No Items Found</h2>
          <Button as={Link} to="/new">
            Add new item
          </Button>
        </>
      )}
    </div>
  );
}



export default MyStore;
