window/addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
   

    const addTaxDom  = document.getElementById("add-tax-price");
    add_value =(inputValue * 0.1)
    addTaxDom.innerHTML = Math.floor(add_value)
    console.log(add_value);
    
    
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = Math.floor(inputValue - add_value)
    console.log(profitNumber);
    
  })
});