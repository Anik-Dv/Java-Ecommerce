function addToCart(productId, productName, ProductPrice) {

	let cart = localStorage.getItem("cart");
	//when cart is null then create new cart
	if (cart == null) {
		// we have no cart yet, then create a new cart
		let products = [];
		let singleProduct = {
			pId: productId,
			pName: productName,
			pQuentity: 1,
			pPrice: ProductPrice
		}
		products.push(singleProduct);

		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product is added, first time.", products);
		
	} else {
		// otherwise cart is already present

		let productCart = JSON.parse(cart);

		let previousProduct = productCart.find((item) => item.pId == productId)
		console.log(previousProduct)

		// if the previous product is true then increase the product quentity
		if (previousProduct) {

			// increase the quentity
			previousProduct.pQuentity = previousProduct.pQuentity + 1

			productCart.map((item) => {

				if (item.pId == previousProduct.pId) {
					item.pQuentity = previousProduct.pQuentity;
				}

			})

			localStorage.setItem("cart", JSON.stringify(productCart));
			
		} else {

			// othetwise add the product to cart
			let singleProduct = { pId: productId, pName: productName, pQuentity: 1, pPrice: ProductPrice };
			productCart.push(singleProduct);

			localStorage.setItem("cart", JSON.stringify(productCart));
		}
		// console.log("cart is present")
	}
	
	updatecart();
}


// update Cart
function updatecart() {

	let stringCart = localStorage.getItem("cart");
	let cart = JSON.parse(stringCart);

	if (cart == null || cart.length == 0) {

		$(".cart-items").html("0");
		$(".cart-body").html("<h6>Cart Dosn't Have Any Items!</h6>")
		$(".checkout-button").addClass("disabled");
		console.log("cart is empty..!");
		
	} else {
		// otherwise cart have a product
		$(".cart-items").html(`${cart.length}`);

		let table = `<table class='table'>
					<thead class='thead-light'>
					<tr>
					<th>Product Id</th>
					<th>Name</th>
					<th>Quentity</th>
					<th>Price</th>
					<th>Total Price</th>
					<th>Action</th>
					</tr>
					</thead>
		 `;
		let totalPrice = 0;
		cart.map((item) => {

			table += `
			<tr>
					<td>${item.pId}</td>
					<td>${item.pName}</td>
					<td>${item.pQuentity}</td>
					<td>${item.pPrice}</td>
					<td>${item.pQuentity * item.pPrice}</td>
					<td><button class='btn btn-outline-danger' onClick='removeProductfromCart(${item.pId})'>Delete</button></td>
			</tr>
			`
			totalPrice += item.pPrice * item.pQuentity;

		})
		table = table + ` </table>
		<br>
		<p class='float-right'><b>TotalCost :</b> $ ${totalPrice}</p>`;
		$(".cart-body").html(table);
		$(".checkout-button").removeClass("disabled");
	}
}


// Remove product from cart
function removeProductfromCart(p_id) {
	// get item from localStorage in object
	let cart = JSON.parse(localStorage.getItem("cart"));
	// filtered all item and check if item product id is not equal to product id then
	// not delete cart item, but when is equal then deleted item from cart
	let newcart = cart.filter((item) => item.pId != p_id);
	// set localStorage newcart
	localStorage.setItem("cart", JSON.stringify(newcart));
	//when removed item in cart then cart is updated
	updatecart();
}

function checkout() {
	window.location = "Checkout.jsp";
}

$(document).ready(function() {
	updatecart();
})







