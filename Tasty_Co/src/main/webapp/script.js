// Polyfill for localStorage if not available (rarely needed in modern browsers)
if (typeof localStorage === "undefined" || localStorage === null) {
    var localStorage = {
      _data: {},
      setItem: function(id, val) { this._data[id] = String(val); },
      getItem: function(id) { return this._data.hasOwnProperty(id) ? this._data[id] : null; },
      removeItem: function(id) { delete this._data[id]; },
      clear: function() { this._data = {}; },
    };
  }
  
  // Load the cart from localStorage if available, otherwise initialize a new cart
  const cart = JSON.parse(localStorage.getItem("cart")) || {};
  
  // Attach event listeners to all "Add to Cart" buttons
  document.querySelectorAll(".add-to-cart").forEach((button) => {
    button.addEventListener("click", (event) => {
      const card = event.target.closest(".item-card");
      const itemName = card.getAttribute("data-name");
      const price = parseFloat(card.getAttribute("data-price"));
  
      if (cart[itemName]) {
        cart[itemName].quantity++;
      } else {
        cart[itemName] = { price: price, quantity: 1 };
      }
      updateCart();
    });
  });
  
  function updateCart() {
    const cartList = document.getElementById("cartList");
    cartList.innerHTML = "";
    let totalPrice = 0;
  
    for (let item in cart) {
      totalPrice += cart[item].price * cart[item].quantity;
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${item}</td>
        <td>₹${cart[item].price.toFixed(2)}</td>
        <td>
          <button class="minus-btn" data-item="${item}">-</button>
          ${cart[item].quantity}
          <button class="plus-btn" data-item="${item}">+</button>
        </td>
      `;
      cartList.appendChild(row);
    }
  
    document.getElementById("totalPrice").textContent = `Total: ₹${totalPrice.toFixed(2)}`;
    console.log(totalPrice);
     sessionStorage.setItem("totalAmount", totalPrice);
   // sessionStorage.setItem("userName", userName);
  
    // Save the current cart state to localStorage
    localStorage.setItem("cart", JSON.stringify(cart));
  
    // Attach event listeners for minus and plus buttons
    document.querySelectorAll(".minus-btn").forEach((button) => {
      button.addEventListener("click", (event) => {
        const item = event.target.getAttribute("data-item");
        if (cart[item].quantity > 1) {
          cart[item].quantity--;
        } else {
          delete cart[item];
        }
        updateCart();
      });
    });
  
    document.querySelectorAll(".plus-btn").forEach((button) => {
      button.addEventListener("click", (event) => {
        const item = event.target.getAttribute("data-item");
        cart[item].quantity++;
        updateCart();
      });
    });
  }
  
  // Initial cart update on page load
  updateCart();
  
  // Order button event handler to clear the cart when the order is placed
  document.getElementById("orderNow").addEventListener("click", () => {
    if (Object.keys(cart).length === 0) {
        alert("Your cart is empty! Please add some items.");
    } else {
        let orderData = [];
        for (let item in cart) {
            orderData.push({
                item_name: item,
                price: cart[item].price,
                quantity: cart[item].quantity
            });
            
        }
        console.log(JSON.stringify(orderData));
        

        fetch("OrderServlet", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(orderData)
        })
        .then(response => response.text())
        .then(data => {
            alert(data);
            localStorage.removeItem("cart");
            updateCart();
            window.location.href = "transac.jsp";
        })
        .catch(error => console.error("Error:", error));
    }
});

// Clear the cart data
/*      for (let key in cart) {
        delete cart[key];
      }
      localStorage.removeItem("cart");
      updateCart();
*/

