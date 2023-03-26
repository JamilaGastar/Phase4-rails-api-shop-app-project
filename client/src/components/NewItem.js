import { useState } from "react";
import { useNavigate } from "react-router";
import { Button, Error, FormField, Input, Label, Textarea } from "../styles";

function NewItem({ user }) {
  const [name, setName] = useState("New Item");
  const [image_url, setImageUrl] = useState("");
  const [description, setDescription] = useState("");
  const [condition, setCondition] = useState("");
  const [size, setSize] = useState("");
  const [price, setPrice] = useState("");
  const [stock, setStock] = useState("");
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const history = useNavigate();

  function handleSubmit(e) {
    e.preventDefault();
    setIsLoading(true);
    fetch("/items", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name,
        image_url,
        description,
        condition,
        size,
        price,
        stock,
      }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        history.push("/");
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

  return (
    <div>
      <div>
        <h2>Add New Item</h2>
        <form onSubmit={handleSubmit}>
          <FormField>
            <Label htmlFor="name">Name</Label>
            <Input
              type="text"
              id="name"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="image_url">Image</Label>
            <Input
              type="text"
              id="image_url"
              value={image_url}
              onChange={(e) => setImageUrl(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="description">description</Label>
            <Textarea
              id="description"
              rows="10"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="condition">Condition</Label>
            <Input
              type="text"
              id="condition"
              value={condition}
              onChange={(e) => setCondition(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="size">Size</Label>
            <Input
              type="number"
              id="size"
              value={size}
              onChange={(e) => setSize(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="price">Price</Label>
            <Input
              type="number"
              id="price"
              value={price}
              onChange={(e) => setPrice(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="stock">Stock</Label>
            <Input
              type="number"
              id="stock"
              value={stock}
              onChange={(e) => setStock(e.target.value)}
            />
          </FormField>
          <FormField>
            <Button color="primary" type="submit">
              {isLoading ? "Loading..." : "Add New Item"}
            </Button>
          </FormField>
          <FormField>
            {errors.map((err) => (
              <Error key={err}>{err}</Error>
            ))}
          </FormField>
        </form>
      </div>
      <div>
            <h2>{name}</h2>
            <img src={image_url} alt=""/>
            <p>{description}</p>
            <p>{condition}</p>
            <p>{size}</p>
            <p>{price}</p>
            <p>{stock}</p>
      </div>
    </div>
  );
}


export default NewItem;
