window.addEventListener('load', function(){
  let calc = document.getElementById("item-price")
  calc.addEventListener('keyup', function(){
    let price = this.value;
    let fee = Math.ceil(price * 0.1);
    let test = Math.floor(price * 0.9);
    let tax1 = document.getElementById("add-tax-price")
    tax1.innerHTML = fee;
    profit.innerHTML = test;
  });
});