interface User {
  name: string;
  age: number;
}

const greet = (user: User) => {
  console.log(`Hello, ${user.name}`);
};

greet({ name: 'Alice', age: 25 });
