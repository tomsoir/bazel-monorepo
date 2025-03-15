const App = () => {
  const imageURL = new URL('../assets/images/image1.png', import.meta.url).href;
  const icon1URL = new URL('../assets/icons/icon1.svg', import.meta.url).href;
  const icon2URL = new URL('../assets/icons/icon2.svg', import.meta.url).href;

  return (
    <div className="app">
      <img src={imageURL} width="50" alt="hello" />
      <img src={icon1URL} width="50" alt="hello" />
      <img src={icon2URL} width="50" alt="hello" />
      <h1>
        <ul className="list">
          <li>+ TypeScript</li>
          <li>+ Webpack,</li>
          <li>+ React</li>
          <li>+ SCSS</li>
          <li>+ Tests</li>
          <li>+ Assets</li>
        </ul>
      </h1>
    </div>
  );
};

export default App;
