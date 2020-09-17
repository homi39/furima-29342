function calc () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keydown', function() {
    const taxPrice = itemPrice.value;
    const tax = taxPrice * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${tax}`;
    const profit = taxPrice - tax;
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = `${profit}`;
  });
}
window.addEventListener('keydown', calc)