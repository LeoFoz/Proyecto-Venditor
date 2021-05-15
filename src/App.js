import './App.css';
import React , {useState,useEffect} from 'react';
import Axios from 'axios'
import * as ReactBootstrap from "react-bootstrap";




function App() {
  const [movieName,setmovie] = useState('')
  const [review,setreview] = useState('')  
  const [productos,setProd] = useState([]);
  const [mejoresV,setMejoresV] = useState([]);

  async function componentf(){
    const url = 'http://localhost:3002/ofertas';
    const response = await fetch(url)
    const data = await response.json()    
    console.log(data)
    setMejoresV(data[0]);
    g();    
   }


  async function verProd(){
    const url = 'http://localhost:3002/MejoresVenditors';
    const response = await fetch(url)
    const data = await response.json()    
    setProd(data); 
    g();
   }
   const renderVenditors = (venditor,index)=> {
     return (
       <tr> 
        <td> {venditor['Venditor looking for bid']}</td>        
        <td> {venditor['Description']}</td>   
        <td> {venditor['MinimalPrice']}</td>        
        <td> {venditor['User that started the bid']}</td>     
      </tr>
     )
   }
  
  const renderProducts = (products,index)=> {
    return (
      <tr key={`${products.ProductCategoryId}`} > 
       <td> {products['Name']}</td>
       <td> {products.Category}</td>       
       <td> {products.SoldAmount}</td>       
     </tr>
    )
  }
  function g() {
    var myVar = setTimeout(alertFunc, 5000);
  }
  
  function alertFunc() {    
    setProd([]);
    setMejoresV([]);
  }
  
  return (
    <div className="App">            
      <h1> Venditor Demo</h1>
      <div className = 'form'>        
        </div>        
        <button onClick= {componentf}>Ver Mejores Bids para vendedor</button>  
        <table className = "table table-dark">
          <thead>
              <tr>
              <th>Vendedor buscando subasta</th>
                <th>Descripción</th>
                <th>Precio mínimo</th>
                <th>Usuario que la publicó</th>
              </tr>
          </thead>
          <tbody>
              {mejoresV.map(renderVenditors)}
          </tbody>
       </table>
       <button onClick= {verProd}>Ver mejores vendedores por categoría </button>      
       <table className = "table table-dark">
          <thead>
              <tr>                
                <th>Nombre</th>      
                <th>Categoría</th>      
                <th>Cantidad vendida</th>                        
              </tr>
          </thead>
          <tbody>       
            {productos.map(renderProducts)}       
          </tbody>
       </table>
       
      </div>
  );
}

export default App;
