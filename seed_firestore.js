const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');

// Initialize Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Function to seed data
async function seedData() {
  // Seed 'users' and 'admins' collections (empty)
  await db.collection('users').doc('dummy').set({});
  await db.collection('admins').doc('dummy').set({});

  // Seed 'data' collection with 'orders' and 'products' documents
  const dataRef = db.collection('data');

  // Seed 'orders' document
  await dataRef.doc('orders').set({
    count: 0,
    ordersData: []
  });

  // Seed 'products' document with subcategories
  const productsRef = dataRef.doc('products');

  // Seed 'allProducts' subcategory with 'products' document
  await productsRef.collection('allProducts').doc('products').set({
    products: [{
                     "id": 84,
                     "title": "Gigabyte Aorus Men Tshirt",
                     "description": "The Gigabyte Aorus Men Tshirt is a cool and casual shirt for gaming enthusiasts. With the Aorus logo and sleek design, it's perfect for expressing your gaming style.",
                     "category": "mens-shirts",
                     "price": 24.99,
                     "rating": 4.95,
                     "stock": 400,
                     "discountPercentage": 12.6,
                     "tags": [
                       "clothing",
                       "men's t-shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/4.png"
                     ]
                   },
                   {
                     "id": 85,
                     "title": "Man Plaid Shirt",
                     "description": "The Man Plaid Shirt is a timeless and versatile men's shirt with a classic plaid pattern. Its comfortable fit and casual style make it a wardrobe essential for various occasions.",
                     "category": "mens-shirts",
                     "price": 34.99,
                     "rating": 3.66,
                     "stock": 65,
                     "discountPercentage": 17.53,
                     "tags": [
                       "clothing",
                       "men's shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/4.png"
                     ]
                   },
                   {
                     "id": 86,
                     "title": "Man Short Sleeve Shirt",
                     "description": "The Man Short Sleeve Shirt is a breezy and stylish option for warm days. With a comfortable fit and short sleeves, it's perfect for a laid-back yet polished look.",
                     "category": "mens-shirts",
                     "price": 19.99,
                     "rating": 4.62,
                     "stock": 0,
                     "discountPercentage": 8.65,
                     "tags": [
                       "clothing",
                       "men's shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/4.png"
                     ]
                   },
                   {
                     "id": 87,
                     "title": "Men Check Shirt",
                     "description": "The Men Check Shirt is a classic and versatile shirt featuring a stylish check pattern. Suitable for various occasions, it adds a smart and polished touch to your wardrobe.",
                     "category": "mens-shirts",
                     "price": 27.99,
                     "rating": 2.9,
                     "stock": 69,
                     "discountPercentage": 14.21,
                     "tags": [
                       "clothing",
                       "men's shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/4.png"
                     ]
                   },
                   {
                     "id": 88,
                     "title": "Nike Air Jordan 1 Red And Black",
                     "description": "The Nike Air Jordan 1 in Red and Black is an iconic basketball sneaker known for its stylish design and high-performance features, making it a favorite among sneaker enthusiasts and athletes.",
                     "category": "mens-shoes",
                     "price": 149.99,
                     "rating": 2.77,
                     "stock": 15,
                     "discountPercentage": 15.82,
                     "tags": [
                       "footwear",
                       "athletic shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/4.png"
                     ]
                   },
                   {
                     "id": 89,
                     "title": "Nike Baseball Cleats",
                     "description": "Nike Baseball Cleats are designed for maximum traction and performance on the baseball field. They provide stability and support for players during games and practices.",
                     "category": "mens-shoes",
                     "price": 79.99,
                     "rating": 4.01,
                     "stock": 34,
                     "discountPercentage": 11.4,
                     "tags": [
                       "footwear",
                       "sports cleats"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/4.png"
                     ]
                   },
                   {
                     "id": 90,
                     "title": "Puma Future Rider Trainers",
                     "description": "The Puma Future Rider Trainers offer a blend of retro style and modern comfort. Perfect for casual wear, these trainers provide a fashionable and comfortable option for everyday use.",
                     "category": "mens-shoes",
                     "price": 89.99,
                     "rating": 4.85,
                     "stock": 10,
                     "discountPercentage": 3.64,
                     "tags": [
                       "footwear",
                       "casual shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/4.png"
                     ]
                   },
                   {
                     "id": 91,
                     "title": "Sports Sneakers Off White & Red",
                     "description": "The Sports Sneakers in Off White and Red combine style and functionality, making them a fashionable choice for sports enthusiasts. The red and off-white color combination adds a bold and energetic touch.",
                     "category": "mens-shoes",
                     "price": 119.99,
                     "rating": 4.92,
                     "stock": 73,
                     "discountPercentage": 11.69,
                     "tags": [
                       "footwear",
                       "athletic shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/4.png"
                     ]
                   },
                   {
                     "id": 92,
                     "title": "Sports Sneakers Off White Red",
                     "description": "Another variant of the Sports Sneakers in Off White Red, featuring a unique design. These sneakers offer style and comfort for casual occasions.",
                     "category": "mens-shoes",
                     "price": 109.99,
                     "rating": 2.95,
                     "stock": 75,
                     "discountPercentage": 17.22,
                     "tags": [
                       "footwear",
                       "casual shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/4.png"
                     ]
                   },
                   {
                     "id": 93,
                     "title": "Brown Leather Belt Watch",
                     "description": "The Brown Leather Belt Watch is a stylish timepiece with a classic design. Featuring a genuine leather strap and a sleek dial, it adds a touch of sophistication to your look.",
                     "category": "mens-watches",
                     "price": 89.99,
                     "rating": 4.47,
                     "stock": 69,
                     "discountPercentage": 15.01,
                     "tags": [
                       "watches",
                       "leather watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/3.png"
                     ]
                   },
                   {
                     "id": 94,
                     "title": "Longines Master Collection",
                     "description": "The Longines Master Collection is an elegant and refined watch known for its precision and craftsmanship. With a timeless design, it's a symbol of luxury and sophistication.",
                     "category": "mens-watches",
                     "price": 1499.99,
                     "rating": 2.64,
                     "stock": 65,
                     "discountPercentage": 0.64,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/3.png"
                     ]
                   },
                   {
                     "id": 95,
                     "title": "Rolex Cellini Date Black Dial",
                     "description": "The Rolex Cellini Date with Black Dial is a classic and prestigious watch. With a black dial and date complication, it exudes sophistication and is a symbol of Rolex's heritage.",
                     "category": "mens-watches",
                     "price": 8999.99,
                     "rating": 3.61,
                     "stock": 84,
                     "discountPercentage": 14.28,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/3.png"
                     ]
                   },
                   {
                     "id": 96,
                     "title": "Rolex Cellini Moonphase",
                     "description": "The Rolex Cellini Moonphase is a masterpiece of horology, featuring a moon phase complication and exquisite design. It reflects Rolex's commitment to precision and elegance.",
                     "category": "mens-watches",
                     "price": 12999.99,
                     "rating": 4.52,
                     "stock": 33,
                     "discountPercentage": 5.7,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/3.png"
                     ]
                   },
                   {
                     "id": 97,
                     "title": "Rolex Datejust",
                     "description": "The Rolex Datejust is an iconic and versatile timepiece with a date window. Known for its timeless design and reliability, it's a symbol of Rolex's watchmaking excellence.",
                     "category": "mens-watches",
                     "price": 10999.99,
                     "rating": 4.94,
                     "stock": 11,
                     "discountPercentage": 9.69,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/3.png"
                     ]
                   },
                   {
                     "id": 98,
                     "title": "Rolex Submariner Watch",
                     "description": "The Rolex Submariner is a legendary dive watch with a rich history. Known for its durability and water resistance, it's a symbol of adventure and exploration.",
                     "category": "mens-watches",
                     "price": 13999.99,
                     "rating": 2.97,
                     "stock": 35,
                     "discountPercentage": 0.82,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/3.png"
                     ]
                   },
                   {
                     "id": 172,
                     "title": "Blue Women's Handbag",
                     "description": "The Blue Women's Handbag is a stylish and spacious accessory for everyday use. With a vibrant blue color and multiple compartments, it combines fashion and functionality.",
                     "category": "womens-bags",
                     "price": 49.99,
                     "rating": 3.37,
                     "stock": 76,
                     "discountPercentage": 5.24,
                     "tags": [
                       "fashion accessories",
                       "handbags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women's%20Handbag/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women's%20Handbag/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women's%20Handbag/3.png"
                     ]
                   },
                   {
                     "id": 173,
                     "title": "Heshe Women's Leather Bag",
                     "description": "The Heshe Women's Leather Bag is a luxurious and high-quality leather bag for the sophisticated woman. With a timeless design and durable craftsmanship, it's a versatile accessory.",
                     "category": "womens-bags",
                     "price": 129.99,
                     "rating": 2.62,
                     "stock": 9,
                     "discountPercentage": 7.74,
                     "tags": [
                       "fashion accessories",
                       "leather bags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women's%20Leather%20Bag/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women's%20Leather%20Bag/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women's%20Leather%20Bag/3.png"
                     ]
                   },
                   {
                     "id": 174,
                     "title": "Prada Women Bag",
                     "description": "The Prada Women Bag is an iconic designer bag that exudes elegance and luxury. Crafted with precision and featuring the Prada logo, it's a statement piece for fashion enthusiasts.",
                     "category": "womens-bags",
                     "price": 599.99,
                     "rating": 3.52,
                     "stock": 43,
                     "discountPercentage": 18.3,
                     "tags": [
                       "fashion accessories",
                       "designer bags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/3.png"
                     ]
                   },
                   {
                     "id": 175,
                     "title": "White Faux Leather Backpack",
                     "description": "The White Faux Leather Backpack is a trendy and practical backpack for the modern woman. With a sleek white design and ample storage space, it's perfect for both casual and on-the-go styles.",
                     "category": "womens-bags",
                     "price": 39.99,
                     "rating": 4.91,
                     "stock": 89,
                     "discountPercentage": 7.76,
                     "tags": [
                       "fashion accessories",
                       "backpacks"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/3.png"
                     ]
                   },
                   {
                     "id": 176,
                     "title": "Women Handbag Black",
                     "description": "The Women Handbag in Black is a classic and versatile accessory that complements various outfits. With a timeless black color and functional design, it's a must-have in every woman's wardrobe.",
                     "category": "womens-bags",
                     "price": 59.99,
                     "rating": 4.94,
                     "stock": 24,
                     "discountPercentage": 3.08,
                     "tags": [
                       "fashion accessories",
                       "handbags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/3.png"
                     ]
                   },
                   {
                     "id": 185,
                     "title": "Black & Brown Slipper",
                     "description": "The Black & Brown Slipper is a comfortable and stylish choice for casual wear. Featuring a blend of black and brown colors, it adds a touch of sophistication to your relaxation.",
                     "category": "womens-shoes",
                     "price": 19.99,
                     "rating": 4.13,
                     "stock": 80,
                     "discountPercentage": 13.62,
                     "tags": [
                       "footwear",
                       "slippers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/4.png"
                     ]
                   },
                   {
                     "id": 186,
                     "title": "Calvin Klein Heel Shoes",
                     "description": "Calvin Klein Heel Shoes are elegant and sophisticated, designed for formal occasions. With a classic design and high-quality materials, they complement your stylish ensemble.",
                     "category": "womens-shoes",
                     "price": 79.99,
                     "rating": 4.06,
                     "stock": 99,
                     "discountPercentage": 11.39,
                     "tags": [
                       "footwear",
                       "heel shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/4.png"
                     ]
                   },
                   {
                     "id": 187,
                     "title": "Golden Shoes Woman",
                     "description": "The Golden Shoes for Women are a glamorous choice for special occasions. Featuring a golden hue and stylish design, they add a touch of luxury to your outfit.",
                     "category": "womens-shoes",
                     "price": 49.99,
                     "rating": 4.82,
                     "stock": 99,
                     "discountPercentage": 14.93,
                     "tags": [
                       "footwear",
                       "women's shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/4.png"
                     ]
                   },
                   {
                     "id": 188,
                     "title": "Pampi Shoes",
                     "description": "Pampi Shoes offer a blend of comfort and style for everyday use. With a versatile design, they are suitable for various casual occasions, providing a trendy and relaxed look.",
                     "category": "womens-shoes",
                     "price": 29.99,
                     "rating": 3.01,
                     "stock": 36,
                     "discountPercentage": 0.3,
                     "tags": [
                       "footwear",
                       "casual shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/4.png"
                     ]
                   },
                   {
                     "id": 189,
                     "title": "Red Shoes",
                     "description": "The Red Shoes make a bold statement with their vibrant red color. Whether for a party or a casual outing, these shoes add a pop of color and style to your wardrobe.",
                     "category": "womens-shoes",
                     "price": 34.99,
                     "rating": 4.23,
                     "stock": 53,
                     "discountPercentage": 0.01,
                     "tags": [
                       "footwear",
                       "women's shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/4.png"
                     ]
                   },
                   {
                     "id": 190,
                     "title": "IWC Ingenieur Automatic Steel",
                     "description": "The IWC Ingenieur Automatic Steel watch is a durable and sophisticated timepiece. With a stainless steel case and automatic movement, it combines precision and style for watch enthusiasts.",
                     "category": "womens-watches",
                     "price": 4999.99,
                     "rating": 2.58,
                     "stock": 85,
                     "discountPercentage": 5.76,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/3.png"
                     ]
                   },
                   {
                     "id": 191,
                     "title": "Rolex Cellini Moonphase",
                     "description": "The Rolex Cellini Moonphase watch is a masterpiece of horology. Featuring a moon phase complication, it showcases the craftsmanship and elegance that Rolex is renowned for.",
                     "category": "womens-watches",
                     "price": 15999.99,
                     "rating": 3.41,
                     "stock": 66,
                     "discountPercentage": 18.76,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/3.png"
                     ]
                   },
                   {
                     "id": 192,
                     "title": "Rolex Datejust Women",
                     "description": "The Rolex Datejust Women's watch is an iconic timepiece designed for women. With a timeless design and a date complication, it offers both elegance and functionality.",
                     "category": "womens-watches",
                     "price": 10999.99,
                     "rating": 3.53,
                     "stock": 31,
                     "discountPercentage": 17.72,
                     "tags": [
                       "watches",
                       "luxury watches",
                       "women's watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/3.png"
                     ]
                   },
                   {
                     "id": 193,
                     "title": "Watch Gold for Women",
                     "description": "The Gold Women's Watch is a stunning accessory that combines luxury and style. Featuring a gold-plated case and a chic design, it adds a touch of glamour to any outfit.",
                     "category": "womens-watches",
                     "price": 799.99,
                     "rating": 3.03,
                     "stock": 94,
                     "discountPercentage": 6.37,
                     "tags": [
                       "watches",
                       "women's watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/3.png"
                     ]
                   },
                   {
                     "id": 194,
                     "title": "Women's Wrist Watch",
                     "description": "The Women's Wrist Watch is a versatile and fashionable timepiece for everyday wear. With a comfortable strap and a simple yet elegant design, it complements various styles.",
                     "category": "womens-watches",
                     "price": 129.99,
                     "rating": 2.93,
                     "stock": 55,
                     "discountPercentage": 17.34,
                     "tags": [
                       "watches",
                       "women's watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Women's%20Wrist%20Watch/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Women's%20Wrist%20Watch/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Women's%20Wrist%20Watch/3.png"
                     ]
                   },
                   {
                     "id": 177,
                     "title": "Black Women's Gown",
                     "description": "The Black Women's Gown is an elegant and timeless evening gown. With a sleek black design, it's perfect for formal events and special occasions, exuding sophistication and style.",
                     "category": "womens-dresses",
                     "price": 129.99,
                     "rating": 4.77,
                     "stock": 59,
                     "discountPercentage": 5.86,
                     "tags": [
                       "clothing",
                       "gowns"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/4.png"
                     ]
                   },
                   {
                     "id": 178,
                     "title": "Corset Leather With Skirt",
                     "description": "The Corset Leather With Skirt is a bold and edgy ensemble that combines a stylish corset with a matching skirt. Ideal for fashion-forward individuals, it makes a statement at any event.",
                     "category": "womens-dresses",
                     "price": 89.99,
                     "rating": 2.52,
                     "stock": 59,
                     "discountPercentage": 19.26,
                     "tags": [
                       "clothing",
                       "corsets",
                       "skirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/4.png"
                     ]
                   },
                   {
                     "id": 179,
                     "title": "Corset With Black Skirt",
                     "description": "The Corset With Black Skirt is a chic and versatile outfit that pairs a fashionable corset with a classic black skirt. It offers a trendy and coordinated look for various occasions.",
                     "category": "womens-dresses",
                     "price": 79.99,
                     "rating": 3,
                     "stock": 67,
                     "discountPercentage": 14.61,
                     "tags": [
                       "clothing",
                       "corsets",
                       "skirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/4.png"
                     ]
                   },
                   {
                     "id": 180,
                     "title": "Dress Pea",
                     "description": "The Dress Pea is a stylish and comfortable dress with a pea pattern. Perfect for casual outings, it adds a playful and fun element to your wardrobe, making it a great choice for day-to-day wear.",
                     "category": "womens-dresses",
                     "price": 49.99,
                     "rating": 2.92,
                     "stock": 29,
                     "discountPercentage": 9.81,
                     "tags": [
                       "clothing",
                       "dresses"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/4.png"
                     ]
                   },
                   {
                     "id": 181,
                     "title": "Marni Red & Black Suit",
                     "description": "The Marni Red & Black Suit is a sophisticated and fashion-forward suit ensemble. With a combination of red and black tones, it showcases a modern design for a bold and confident look.",
                     "category": "womens-dresses",
                     "price": 179.99,
                     "rating": 4.17,
                     "stock": 15,
                     "discountPercentage": 15.4,
                     "tags": [
                       "clothing",
                       "suits"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/4.png"
                     ]
                   },
                   {
                     "id": 138,
                     "title": "Baseball Ball",
                     "description": "The Baseball Ball is a standard baseball used in baseball games. It features a durable leather cover and is designed for pitching, hitting, and fielding in the game of baseball.",
                     "category": "sports-accessories",
                     "price": 8.99,
                     "rating": 4.76,
                     "stock": 71,
                     "discountPercentage": 13.72,
                     "tags": [
                       "sports equipment",
                       "baseball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 139,
                     "title": "Baseball Glove",
                     "description": "The Baseball Glove is a protective glove worn by baseball players. It is designed to catch and field the baseball, providing players with comfort and control during the game.",
                     "category": "sports-accessories",
                     "price": 24.99,
                     "rating": 2.72,
                     "stock": 43,
                     "discountPercentage": 16.27,
                     "tags": [
                       "sports equipment",
                       "baseball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/1.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/2.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/3.png"
                     ]
                   },
                   {
                     "id": 140,
                     "title": "Basketball",
                     "description": "The Basketball is a standard ball used in basketball games. It is designed for dribbling, shooting, and passing in the game of basketball, suitable for both indoor and outdoor play.",
                     "category": "sports-accessories",
                     "price": 14.99,
                     "rating": 4.15,
                     "stock": 100,
                     "discountPercentage": 18.05,
                     "tags": [
                       "sports equipment",
                       "basketball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Basketball/1.png"
                     ]
                   },
                   {
                     "id": 141,
                     "title": "Basketball Rim",
                     "description": "The Basketball Rim is a sturdy hoop and net assembly mounted on a basketball backboard. It provides a target for shooting and scoring in the game of basketball.",
                     "category": "sports-accessories",
                     "price": 39.99,
                     "rating": 4.98,
                     "stock": 57,
                     "discountPercentage": 6.02,
                     "tags": [
                       "sports equipment",
                       "basketball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Basketball%20Rim/1.png"
                     ]
                   },
                   {
                     "id": 142,
                     "title": "Cricket Ball",
                     "description": "The Cricket Ball is a hard leather ball used in the sport of cricket. It is bowled and batted in the game, and its hardness and seam contribute to the dynamics of cricket play.",
                     "category": "sports-accessories",
                     "price": 12.99,
                     "rating": 4.43,
                     "stock": 42,
                     "discountPercentage": 12.93,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 143,
                     "title": "Cricket Bat",
                     "description": "The Cricket Bat is an essential piece of cricket equipment used by batsmen to hit the cricket ball. It is made of wood and comes in various sizes and designs.",
                     "category": "sports-accessories",
                     "price": 29.99,
                     "rating": 3.07,
                     "stock": 3,
                     "discountPercentage": 9.03,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Bat/1.png"
                     ]
                   },
                   {
                     "id": 144,
                     "title": "Cricket Helmet",
                     "description": "The Cricket Helmet is a protective headgear worn by cricket players, especially batsmen and wicketkeepers. It provides protection against fast bowling and bouncers.",
                     "category": "sports-accessories",
                     "price": 44.99,
                     "rating": 3.34,
                     "stock": 31,
                     "discountPercentage": 10.75,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/1.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/2.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/3.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/4.png"
                     ]
                   },
                   {
                     "id": 145,
                     "title": "Cricket Wicket",
                     "description": "The Cricket Wicket is a set of three stumps and two bails, forming a wicket used in the sport of cricket. Batsmen aim to protect the wicket while scoring runs.",
                     "category": "sports-accessories",
                     "price": 29.99,
                     "rating": 4.16,
                     "stock": 31,
                     "discountPercentage": 8.79,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Wicket/1.png"
                     ]
                   },
                   {
                     "id": 146,
                     "title": "Feather Shuttlecock",
                     "description": "The Feather Shuttlecock is used in the sport of badminton. It features natural feathers and is designed for high-speed play, providing stability and accuracy during matches.",
                     "category": "sports-accessories",
                     "price": 5.99,
                     "rating": 3.95,
                     "stock": 17,
                     "discountPercentage": 10.24,
                     "tags": [
                       "sports equipment",
                       "badminton"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Feather%20Shuttlecock/1.png"
                     ]
                   },
                   {
                     "id": 147,
                     "title": "Football",
                     "description": "The Football, also known as a soccer ball, is the standard ball used in the sport of football (soccer). It is designed for kicking and passing in the game.",
                     "category": "sports-accessories",
                     "price": 17.99,
                     "rating": 3.94,
                     "stock": 66,
                     "discountPercentage": 0.59,
                     "tags": [
                       "sports equipment",
                       "football"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Football/1.png"
                     ]
                   },
                   {
                     "id": 148,
                     "title": "Golf Ball",
                     "description": "The Golf Ball is a small ball used in the sport of golf. It features dimples on its surface, providing aerodynamic lift and distance when struck by a golf club.",
                     "category": "sports-accessories",
                     "price": 9.99,
                     "rating": 4.84,
                     "stock": 45,
                     "discountPercentage": 19.38,
                     "tags": [
                       "sports equipment",
                       "golf"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Golf%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 149,
                     "title": "Iron Golf",
                     "description": "The Iron Golf is a type of golf club designed for various golf shots. It features a solid metal head and is used for approach shots, chipping, and other golfing techniques.",
                     "category": "sports-accessories",
                     "price": 49.99,
                     "rating": 4.87,
                     "stock": 7,
                     "discountPercentage": 3.32,
                     "tags": [
                       "sports equipment",
                       "golf"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Iron%20Golf/1.png"
                     ]
                   },
                   {
                     "id": 150,
                     "title": "Metal Baseball Bat",
                     "description": "The Metal Baseball Bat is a durable and lightweight baseball bat made from metal alloys. It is commonly used in baseball games for hitting and batting practice.",
                     "category": "sports-accessories",
                     "price": 29.99,
                     "rating": 4.11,
                     "stock": 37,
                     "discountPercentage": 2.55,
                     "tags": [
                       "sports equipment",
                       "baseball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Metal%20Baseball%20Bat/1.png"
                     ]
                   },
                   {
                     "id": 151,
                     "title": "Tennis Ball",
                     "description": "The Tennis Ball is a standard ball used in the sport of tennis. It is designed for bouncing and hitting with tennis rackets during matches or practice sessions.",
                     "category": "sports-accessories",
                     "price": 6.99,
                     "rating": 4.77,
                     "stock": 99,
                     "discountPercentage": 0.14,
                     "tags": [
                       "sports equipment",
                       "tennis"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Tennis%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 152,
                     "title": "Tennis Racket",
                     "description": "The Tennis Racket is an essential piece of equipment used in the sport of tennis. It features a frame with strings and a grip, allowing players to hit the tennis ball.",
                     "category": "sports-accessories",
                     "price": 49.99,
                     "rating": 3.82,
                     "stock": 86,
                     "discountPercentage": 15.8,
                     "tags": [
                       "sports equipment",
                       "tennis"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Tennis%20Racket/1.png"
                     ]
                   },
                   {
                     "id": 153,
                     "title": "Volleyball",
                     "description": "The Volleyball is a standard ball used in the sport of volleyball. It is designed for passing, setting, and spiking over the net during volleyball matches.",
                     "category": "sports-accessories",
                     "price": 11.99,
                     "rating": 4.08,
                     "stock": 0,
                     "discountPercentage": 2.2,
                     "tags": [
                       "sports equipment",
                       "volleyball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Volleyball/1.png"
                     ]
                   },
                   {
                     "id": 159,
                     "title": "iPad Mini 2021 Starlight",
                     "description": "The iPad Mini 2021 in Starlight is a compact and powerful tablet from Apple. Featuring a stunning Retina display, powerful A-series chip, and a sleek design, it offers a premium tablet experience.",
                     "category": "tablets",
                     "price": 499.99,
                     "rating": 3.87,
                     "stock": 32,
                     "discountPercentage": 19.48,
                     "tags": [
                       "electronics",
                       "tablets"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/1.png",
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/2.png",
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/3.png",
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/4.png"
                     ]
                   },
                   {
                     "id": 160,
                     "title": "Samsung Galaxy Tab S8 Plus Grey",
                     "description": "The Samsung Galaxy Tab S8 Plus in Grey is a high-performance Android tablet by Samsung. With a large AMOLED display, powerful processor, and S Pen support, it's ideal for productivity and entertainment.",
                     "category": "tablets",
                     "price": 599.99,
                     "rating": 3.43,
                     "stock": 76,
                     "discountPercentage": 8.11,
                     "tags": [
                       "electronics",
                       "tablets"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/1.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/2.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/3.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/4.png"
                     ]
                   },
                   {
                     "id": 161,
                     "title": "Samsung Galaxy Tab White",
                     "description": "The Samsung Galaxy Tab in White is a sleek and versatile Android tablet. With a vibrant display, long-lasting battery, and a range of features, it offers a great user experience for various tasks.",
                     "category": "tablets",
                     "price": 349.99,
                     "rating": 3.7,
                     "stock": 0,
                     "discountPercentage": 4.82,
                     "tags": [
                       "electronics",
                       "tablets"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/1.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/2.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/3.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/4.png"
                     ]
                   },
                   {
                     "id": 122,
                     "title": "iPhone 6",
                     "description": "The iPhone 6 is a stylish and capable smartphone with a larger display and improved performance. It introduced new features and design elements, making it a popular choice in its time.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 3.76,
                     "stock": 99,
                     "discountPercentage": 4.54,
                     "tags": [
                       "smartphones",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/3.png"
                     ]
                   },
                   {
                     "id": 123,
                     "title": "iPhone 13 Pro",
                     "description": "The iPhone 13 Pro is a cutting-edge smartphone with a powerful camera system, high-performance chip, and stunning display. It offers advanced features for users who demand top-notch technology.",
                     "category": "smartphones",
                     "price": 1099.99,
                     "rating": 3.42,
                     "stock": 26,
                     "discountPercentage": 18.3,
                     "tags": [
                       "smartphones",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/3.png"
                     ]
                   },
                   {
                     "id": 124,
                     "title": "iPhone X",
                     "description": "The iPhone X is a flagship smartphone featuring a bezel-less OLED display, facial recognition technology (Face ID), and impressive performance. It represents a milestone in iPhone design and innovation.",
                     "category": "smartphones",
                     "price": 899.99,
                     "rating": 4.96,
                     "stock": 99,
                     "discountPercentage": 14.19,
                     "tags": [
                       "smartphones",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/3.png"
                     ]
                   },
                   {
                     "id": 125,
                     "title": "Oppo A57",
                     "description": "The Oppo A57 is a mid-range smartphone known for its sleek design and capable features. It offers a balance of performance and affordability, making it a popular choice.",
                     "category": "smartphones",
                     "price": 249.99,
                     "rating": 3.1,
                     "stock": 76,
                     "discountPercentage": 12.17,
                     "tags": [
                       "smartphones",
                       "oppo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/3.png"
                     ]
                   },
                   {
                     "id": 126,
                     "title": "Oppo F19 Pro Plus",
                     "description": "The Oppo F19 Pro Plus is a feature-rich smartphone with a focus on camera capabilities. It boasts advanced photography features and a powerful performance for a premium user experience.",
                     "category": "smartphones",
                     "price": 399.99,
                     "rating": 2.57,
                     "stock": 92,
                     "discountPercentage": 15.62,
                     "tags": [
                       "smartphones",
                       "oppo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/3.png"
                     ]
                   },
                   {
                     "id": 127,
                     "title": "Oppo K1",
                     "description": "The Oppo K1 series offers a range of smartphones with various features and specifications. Known for their stylish design and reliable performance, the Oppo K1 series caters to diverse user preferences.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 3.39,
                     "stock": 61,
                     "discountPercentage": 14.58,
                     "tags": [
                       "smartphones",
                       "oppo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/3.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/4.png"
                     ]
                   },
                   {
                     "id": 128,
                     "title": "Realme C35",
                     "description": "The Realme C35 is a budget-friendly smartphone with a focus on providing essential features for everyday use. It offers a reliable performance and user-friendly experience.",
                     "category": "smartphones",
                     "price": 149.99,
                     "rating": 2.56,
                     "stock": 81,
                     "discountPercentage": 16.47,
                     "tags": [
                       "smartphones",
                       "realme"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/3.png"
                     ]
                   },
                   {
                     "id": 129,
                     "title": "Realme X",
                     "description": "The Realme X is a mid-range smartphone known for its sleek design and impressive display. It offers a good balance of performance and camera capabilities for users seeking a quality device.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 4.42,
                     "stock": 87,
                     "discountPercentage": 2.39,
                     "tags": [
                       "smartphones",
                       "realme"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/3.png"
                     ]
                   },
                   {
                     "id": 130,
                     "title": "Realme XT",
                     "description": "The Realme XT is a feature-rich smartphone with a focus on camera technology. It comes equipped with advanced camera sensors, delivering high-quality photos and videos for photography enthusiasts.",
                     "category": "smartphones",
                     "price": 349.99,
                     "rating": 4.14,
                     "stock": 53,
                     "discountPercentage": 3.03,
                     "tags": [
                       "smartphones",
                       "realme"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/3.png"
                     ]
                   },
                   {
                     "id": 131,
                     "title": "Samsung Galaxy S7",
                     "description": "The Samsung Galaxy S7 is a flagship smartphone known for its sleek design and advanced features. It features a high-resolution display, powerful camera, and robust performance.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 4.9,
                     "stock": 55,
                     "discountPercentage": 8.83,
                     "tags": [
                       "smartphones",
                       "samsung galaxy"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/3.png"
                     ]
                   },
                   {
                     "id": 132,
                     "title": "Samsung Galaxy S8",
                     "description": "The Samsung Galaxy S8 is a premium smartphone with an Infinity Display, offering a stunning visual experience. It boasts advanced camera capabilities and cutting-edge technology.",
                     "category": "smartphones",
                     "price": 499.99,
                     "rating": 3.69,
                     "stock": 75,
                     "discountPercentage": 2.69,
                     "tags": [
                       "smartphones",
                       "samsung galaxy"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/3.png"
                     ]
                   },
                   {
                     "id": 133,
                     "title": "Samsung Galaxy S10",
                     "description": "The Samsung Galaxy S10 is a flagship device featuring a dynamic AMOLED display, versatile camera system, and powerful performance. It represents innovation and excellence in smartphone technology.",
                     "category": "smartphones",
                     "price": 699.99,
                     "rating": 2.81,
                     "stock": 40,
                     "discountPercentage": 0.97,
                     "tags": [
                       "smartphones",
                       "samsung galaxy"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/3.png"
                     ]
                   },
                   {
                     "id": 134,
                     "title": "Vivo S1",
                     "description": "The Vivo S1 is a stylish and mid-range smartphone offering a blend of design and performance. It features a vibrant display, capable camera system, and reliable functionality.",
                     "category": "smartphones",
                     "price": 249.99,
                     "rating": 2.83,
                     "stock": 13,
                     "discountPercentage": 4.25,
                     "tags": [
                       "smartphones",
                       "vivo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/3.png"
                     ]
                   },
                   {
                     "id": 135,
                     "title": "Vivo V9",
                     "description": "The Vivo V9 is a smartphone known for its sleek design and emphasis on capturing high-quality selfies. It features a notch display, dual-camera setup, and a modern design.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 3.1,
                     "stock": 19,
                     "discountPercentage": 14.57,
                     "tags": [
                       "smartphones",
                       "vivo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/3.png"
                     ]
                   },
                   {
                     "id": 136,
                     "title": "Vivo X21",
                     "description": "The Vivo X21 is a premium smartphone with a focus on cutting-edge technology. It features an in-display fingerprint sensor, a high-resolution display, and advanced camera capabilities.",
                     "category": "smartphones",
                     "price": 499.99,
                     "rating": 2.75,
                     "stock": 0,
                     "discountPercentage": 7.32,
                     "tags": [
                       "smartphones",
                       "vivo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/3.png"
                     ]
                   },
                   {
                     "id": 99,
                     "title": "Amazon Echo Plus",
                     "description": "The Amazon Echo Plus is a smart speaker with built-in Alexa voice control. It features premium sound quality and serves as a hub for controlling smart home devices.",
                     "category": "mobile-accessories",
                     "price": 99.99,
                     "rating": 3.52,
                     "stock": 50,
                     "discountPercentage": 16.3,
                     "tags": [
                       "electronics",
                       "smart speakers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Amazon%20Echo%20Plus/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Amazon%20Echo%20Plus/2.png"
                     ]
                   },
                   {
                     "id": 100,
                     "title": "Apple Airpods",
                     "description": "The Apple Airpods offer a seamless wireless audio experience. With easy pairing, high-quality sound, and Siri integration, they are perfect for on-the-go listening.",
                     "category": "mobile-accessories",
                     "price": 129.99,
                     "rating": 4.38,
                     "stock": 93,
                     "discountPercentage": 4.82,
                     "tags": [
                       "electronics",
                       "wireless earphones"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/2.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/3.png"
                     ]
                   },
                   {
                     "id": 101,
                     "title": "Apple AirPods Max Silver",
                     "description": "The Apple AirPods Max in Silver are premium over-ear headphones with high-fidelity audio, adaptive EQ, and active noise cancellation. Experience immersive sound in style.",
                     "category": "mobile-accessories",
                     "price": 549.99,
                     "rating": 3.11,
                     "stock": 7,
                     "discountPercentage": 11.7,
                     "tags": [
                       "electronics",
                       "over-ear headphones"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/1.png"
                     ]
                   },
                   {
                     "id": 102,
                     "title": "Apple Airpower Wireless Charger",
                     "description": "The Apple AirPower Wireless Charger provides a convenient way to charge your compatible Apple devices wirelessly. Simply place your devices on the charging mat for effortless charging.",
                     "category": "mobile-accessories",
                     "price": 79.99,
                     "rating": 4.51,
                     "stock": 78,
                     "discountPercentage": 6.54,
                     "tags": [
                       "electronics",
                       "wireless chargers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpower%20Wireless%20Charger/1.png"
                     ]
                   },
                   {
                     "id": 103,
                     "title": "Apple HomePod Mini Cosmic Grey",
                     "description": "The Apple HomePod Mini in Cosmic Grey is a compact smart speaker that delivers impressive audio and integrates seamlessly with the Apple ecosystem for a smart home experience.",
                     "category": "mobile-accessories",
                     "price": 99.99,
                     "rating": 4.51,
                     "stock": 65,
                     "discountPercentage": 3.7,
                     "tags": [
                       "electronics",
                       "smart speakers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20HomePod%20Mini%20Cosmic%20Grey/1.png"
                     ]
                   },
                   {
                     "id": 104,
                     "title": "Apple iPhone Charger",
                     "description": "The Apple iPhone Charger is a high-quality charger designed for fast and efficient charging of your iPhone. Ensure your device stays powered up and ready to go.",
                     "category": "mobile-accessories",
                     "price": 19.99,
                     "rating": 3.03,
                     "stock": 4,
                     "discountPercentage": 1.01,
                     "tags": [
                       "electronics",
                       "chargers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20iPhone%20Charger/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20iPhone%20Charger/2.png"
                     ]
                   },
                   {
                     "id": 105,
                     "title": "Apple MagSafe Battery Pack",
                     "description": "The Apple MagSafe Battery Pack is a portable and convenient way to add extra battery life to your MagSafe-compatible iPhone. Attach it magnetically for a secure connection.",
                     "category": "mobile-accessories",
                     "price": 99.99,
                     "rating": 2.61,
                     "stock": 80,
                     "discountPercentage": 10.27,
                     "tags": [
                       "electronics",
                       "power banks"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20MagSafe%20Battery%20Pack/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20MagSafe%20Battery%20Pack/2.png"
                     ]
                   },
                   {
                     "id": 106,
                     "title": "Apple Watch Series 4 Gold",
                     "description": "The Apple Watch Series 4 in Gold is a stylish and advanced smartwatch with features like heart rate monitoring, fitness tracking, and a beautiful Retina display.",
                     "category": "mobile-accessories",
                     "price": 349.99,
                     "rating": 4.42,
                     "stock": 68,
                     "discountPercentage": 5.14,
                     "tags": [
                       "electronics",
                       "smartwatches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/2.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/3.png"
                     ]
                   },
                   {
                     "id": 107,
                     "title": "Beats Flex Wireless Earphones",
                     "description": "The Beats Flex Wireless Earphones offer a comfortable and versatile audio experience. With magnetic earbuds and up to 12 hours of battery life, they are ideal for everyday use.",
                     "category": "mobile-accessories",
                     "price": 49.99,
                     "rating": 4.17,
                     "stock": 49,
                     "discountPercentage": 8.27,
                     "tags": [
                       "electronics",
                       "wireless earphones"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Beats%20Flex%20Wireless%20Earphones/1.png"
                     ]
                   },
                   {
                     "id": 108,
                     "title": "iPhone 12 Silicone Case with MagSafe Plum",
                     "description": "The iPhone 12 Silicone Case with MagSafe in Plum is a stylish and protective case designed for the iPhone 12. It features MagSafe technology for easy attachment of accessories.",
                     "category": "mobile-accessories",
                     "price": 29.99,
                     "rating": 4.41,
                     "stock": 51,
                     "discountPercentage": 14.35,
                     "tags": [
                       "electronics",
                       "phone accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/2.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/3.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/4.png"
                     ]
                   },
                   {
                     "id": 109,
                     "title": "Monopod",
                     "description": "The Monopod is a versatile camera accessory for stable and adjustable shooting. Perfect for capturing selfies, group photos, and videos with ease.",
                     "category": "mobile-accessories",
                     "price": 19.99,
                     "rating": 2.99,
                     "stock": 96,
                     "discountPercentage": 11.62,
                     "tags": [
                       "electronics",
                       "camera accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Monopod/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Monopod/2.png"
                     ]
                   },
                   {
                     "id": 110,
                     "title": "Selfie Lamp with iPhone",
                     "description": "The Selfie Lamp with iPhone is a portable and adjustable LED light designed to enhance your selfies and video calls. Attach it to your iPhone for well-lit photos.",
                     "category": "mobile-accessories",
                     "price": 14.99,
                     "rating": 2.84,
                     "stock": 89,
                     "discountPercentage": 13.86,
                     "tags": [
                       "electronics",
                       "selfie accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Selfie%20Lamp%20with%20iPhone/1.png"
                     ]
                   },
                   {
                     "id": 111,
                     "title": "Selfie Stick Monopod",
                     "description": "The Selfie Stick Monopod is a extendable and foldable device for capturing the perfect selfie or group photo. Compatible with smartphones and cameras.",
                     "category": "mobile-accessories",
                     "price": 12.99,
                     "rating": 2.93,
                     "stock": 33,
                     "discountPercentage": 15.29,
                     "tags": [
                       "electronics",
                       "selfie accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Selfie%20Stick%20Monopod/1.png"
                     ]
                   },
                   {
                     "id": 112,
                     "title": "TV Studio Camera Pedestal",
                     "description": "The TV Studio Camera Pedestal is a professional-grade camera support system for smooth and precise camera movements in a studio setting. Ideal for broadcast and production.",
                     "category": "mobile-accessories",
                     "price": 499.99,
                     "rating": 4.05,
                     "stock": 45,
                     "discountPercentage": 10.28,
                     "tags": [
                       "electronics",
                       "camera accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/TV%20Studio%20Camera%20Pedestal/1.png"
                     ]
                   },
                   {
                     "id": 78,
                     "title": "Apple MacBook Pro 14 Inch Space Grey",
                     "description": "The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple's M1 Pro chip for exceptional performance and a stunning Retina display.",
                     "category": "laptops",
                     "price": 1999.99,
                     "rating": 3.13,
                     "stock": 39,
                     "discountPercentage": 9.25,
                     "tags": [
                       "laptops",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/3.png"
                     ]
                   },
                   {
                     "id": 79,
                     "title": "Asus Zenbook Pro Dual Screen Laptop",
                     "description": "The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.",
                     "category": "laptops",
                     "price": 1799.99,
                     "rating": 3.14,
                     "stock": 38,
                     "discountPercentage": 9.21,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/3.png"
                     ]
                   },
                   {
                     "id": 80,
                     "title": "Huawei Matebook X Pro",
                     "description": "The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.",
                     "category": "laptops",
                     "price": 1399.99,
                     "rating": 4.62,
                     "stock": 34,
                     "discountPercentage": 15.25,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/3.png"
                     ]
                   },
                   {
                     "id": 81,
                     "title": "Lenovo Yoga 920",
                     "description": "The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.",
                     "category": "laptops",
                     "price": 1099.99,
                     "rating": 2.98,
                     "stock": 71,
                     "discountPercentage": 7.77,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/3.png"
                     ]
                   },
                   {
                     "id": 82,
                     "title": "New DELL XPS 13 9300 Laptop",
                     "description": "The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.",
                     "category": "laptops",
                     "price": 1499.99,
                     "rating": 2.98,
                     "stock": 18,
                     "discountPercentage": 11.7,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/3.png"
                     ]
                   },
                   {
                     "id": 197,
                     "title": "Blue & Black Check Shirt",
                     "description": "The Blue & Black Check Shirt is a stylish and comfortable men's shirt featuring a classic check pattern. Made from high-quality fabric, it's suitable for both casual and semi-formal occasions.",
                     "category": "mens-shirts",
                     "price": 29.99,
                     "rating": 3.5,
                     "stock": 50,
                     "discountPercentage": 1.41,
                     "tags": [
                       "shirts"
                     ],
                     "images": [
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741131639/1_xkw2tp.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741131669/2_yh4svy.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741131709/3_kzajvi.png"
                     ]
                   },
                   {
                     "id": 198,
                     "title": "American Football",
                     "description": "The American Football is a classic ball used in American football games. It is designed for throwing and catching, making it an essential piece of equipment for the sport.",
                     "category": "american football",
                     "price": 19.99,
                     "rating": 3.5,
                     "stock": 50,
                     "discountPercentage": 10.28,
                     "tags": [
                       "american football"
                     ],
                     "images": [
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741133824/2_u8o3ja.png"
                     ]
                   },
                   {
                     "id": 199,
                     "title": "Iphone 5s",
                     "description": "The iPhone 5s is a classic smartphone known for its compact design and advanced features during its release. While it's an older model, it still provides a reliable user experience.",
                     "category": "smartphones",
                     "price": 199.99,
                     "rating": 3.5,
                     "stock": 50,
                     "discountPercentage": 10.88,
                     "tags": [
                       "smartphones"
                     ],
                     "images": [
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741134035/1_pz7is8.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741134046/2_ayvd1r.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741134048/3_pldyyu.png"
                     ]
                   }],
    total: 91,
    idCount: 199
  });

  // Seed 'fashion' subcategory with 'products' document
  await productsRef.collection('fashion').doc('products').set({
    products: [ {
                     "id": 84,
                     "title": "Gigabyte Aorus Men Tshirt",
                     "description": "The Gigabyte Aorus Men Tshirt is a cool and casual shirt for gaming enthusiasts. With the Aorus logo and sleek design, it's perfect for expressing your gaming style.",
                     "category": "mens-shirts",
                     "price": 24.99,
                     "rating": 4.95,
                     "stock": 400,
                     "discountPercentage": 12.6,
                     "tags": [
                       "clothing",
                       "men's t-shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/4.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1740830371/1_d03r9v.png"
                     ]
                   },
                   {
                     "id": 85,
                     "title": "Man Plaid Shirt",
                     "description": "The Man Plaid Shirt is a timeless and versatile men's shirt with a classic plaid pattern. Its comfortable fit and casual style make it a wardrobe essential for various occasions.",
                     "category": "mens-shirts",
                     "price": 34.99,
                     "rating": 3.66,
                     "stock": 65,
                     "discountPercentage": 17.53,
                     "tags": [
                       "clothing",
                       "men's shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/4.png"
                     ]
                   },
                   {
                     "id": 86,
                     "title": "Man Short Sleeve Shirt",
                     "description": "The Man Short Sleeve Shirt is a breezy and stylish option for warm days. With a comfortable fit and short sleeves, it's perfect for a laid-back yet polished look.",
                     "category": "mens-shirts",
                     "price": 19.99,
                     "rating": 4.62,
                     "stock": 0,
                     "discountPercentage": 8.65,
                     "tags": [
                       "clothing",
                       "men's shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/4.png"
                     ]
                   },
                   {
                     "id": 87,
                     "title": "Men Check Shirt",
                     "description": "The Men Check Shirt is a classic and versatile shirt featuring a stylish check pattern. Suitable for various occasions, it adds a smart and polished touch to your wardrobe.",
                     "category": "mens-shirts",
                     "price": 27.99,
                     "rating": 2.9,
                     "stock": 69,
                     "discountPercentage": 14.21,
                     "tags": [
                       "clothing",
                       "men's shirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/4.png"
                     ]
                   },
                   {
                     "id": 88,
                     "title": "Nike Air Jordan 1 Red And Black",
                     "description": "The Nike Air Jordan 1 in Red and Black is an iconic basketball sneaker known for its stylish design and high-performance features, making it a favorite among sneaker enthusiasts and athletes.",
                     "category": "mens-shoes",
                     "price": 149.99,
                     "rating": 2.77,
                     "stock": 15,
                     "discountPercentage": 15.82,
                     "tags": [
                       "footwear",
                       "athletic shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/4.png"
                     ]
                   },
                   {
                     "id": 89,
                     "title": "Nike Baseball Cleats",
                     "description": "Nike Baseball Cleats are designed for maximum traction and performance on the baseball field. They provide stability and support for players during games and practices.",
                     "category": "mens-shoes",
                     "price": 79.99,
                     "rating": 4.01,
                     "stock": 34,
                     "discountPercentage": 11.4,
                     "tags": [
                       "footwear",
                       "sports cleats"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/4.png"
                     ]
                   },
                   {
                     "id": 90,
                     "title": "Puma Future Rider Trainers",
                     "description": "The Puma Future Rider Trainers offer a blend of retro style and modern comfort. Perfect for casual wear, these trainers provide a fashionable and comfortable option for everyday use.",
                     "category": "mens-shoes",
                     "price": 89.99,
                     "rating": 4.85,
                     "stock": 10,
                     "discountPercentage": 3.64,
                     "tags": [
                       "footwear",
                       "casual shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/4.png"
                     ]
                   },
                   {
                     "id": 91,
                     "title": "Sports Sneakers Off White & Red",
                     "description": "The Sports Sneakers in Off White and Red combine style and functionality, making them a fashionable choice for sports enthusiasts. The red and off-white color combination adds a bold and energetic touch.",
                     "category": "mens-shoes",
                     "price": 119.99,
                     "rating": 4.92,
                     "stock": 73,
                     "discountPercentage": 11.69,
                     "tags": [
                       "footwear",
                       "athletic shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/4.png"
                     ]
                   },
                   {
                     "id": 92,
                     "title": "Sports Sneakers Off White Red",
                     "description": "Another variant of the Sports Sneakers in Off White Red, featuring a unique design. These sneakers offer style and comfort for casual occasions.",
                     "category": "mens-shoes",
                     "price": 109.99,
                     "rating": 2.95,
                     "stock": 75,
                     "discountPercentage": 17.22,
                     "tags": [
                       "footwear",
                       "casual shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/3.png",
                       "https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/4.png"
                     ]
                   },
                   {
                     "id": 93,
                     "title": "Brown Leather Belt Watch",
                     "description": "The Brown Leather Belt Watch is a stylish timepiece with a classic design. Featuring a genuine leather strap and a sleek dial, it adds a touch of sophistication to your look.",
                     "category": "mens-watches",
                     "price": 89.99,
                     "rating": 4.47,
                     "stock": 69,
                     "discountPercentage": 15.01,
                     "tags": [
                       "watches",
                       "leather watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/3.png"
                     ]
                   },
                   {
                     "id": 94,
                     "title": "Longines Master Collection",
                     "description": "The Longines Master Collection is an elegant and refined watch known for its precision and craftsmanship. With a timeless design, it's a symbol of luxury and sophistication.",
                     "category": "mens-watches",
                     "price": 1499.99,
                     "rating": 2.64,
                     "stock": 65,
                     "discountPercentage": 0.64,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/3.png"
                     ]
                   },
                   {
                     "id": 95,
                     "title": "Rolex Cellini Date Black Dial",
                     "description": "The Rolex Cellini Date with Black Dial is a classic and prestigious watch. With a black dial and date complication, it exudes sophistication and is a symbol of Rolex's heritage.",
                     "category": "mens-watches",
                     "price": 8999.99,
                     "rating": 3.61,
                     "stock": 84,
                     "discountPercentage": 14.28,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/3.png"
                     ]
                   },
                   {
                     "id": 96,
                     "title": "Rolex Cellini Moonphase",
                     "description": "The Rolex Cellini Moonphase is a masterpiece of horology, featuring a moon phase complication and exquisite design. It reflects Rolex's commitment to precision and elegance.",
                     "category": "mens-watches",
                     "price": 12999.99,
                     "rating": 4.52,
                     "stock": 33,
                     "discountPercentage": 5.7,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/3.png"
                     ]
                   },
                   {
                     "id": 97,
                     "title": "Rolex Datejust",
                     "description": "The Rolex Datejust is an iconic and versatile timepiece with a date window. Known for its timeless design and reliability, it's a symbol of Rolex's watchmaking excellence.",
                     "category": "mens-watches",
                     "price": 10999.99,
                     "rating": 4.94,
                     "stock": 11,
                     "discountPercentage": 9.69,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/3.png"
                     ]
                   },
                   {
                     "id": 98,
                     "title": "Rolex Submariner Watch",
                     "description": "The Rolex Submariner is a legendary dive watch with a rich history. Known for its durability and water resistance, it's a symbol of adventure and exploration.",
                     "category": "mens-watches",
                     "price": 13999.99,
                     "rating": 2.97,
                     "stock": 35,
                     "discountPercentage": 0.82,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/1.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/2.png",
                       "https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/3.png"
                     ]
                   },
                   {
                     "id": 172,
                     "title": "Blue Women's Handbag",
                     "description": "The Blue Women's Handbag is a stylish and spacious accessory for everyday use. With a vibrant blue color and multiple compartments, it combines fashion and functionality.",
                     "category": "womens-bags",
                     "price": 49.99,
                     "rating": 3.37,
                     "stock": 76,
                     "discountPercentage": 5.24,
                     "tags": [
                       "fashion accessories",
                       "handbags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women's%20Handbag/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women's%20Handbag/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women's%20Handbag/3.png"
                     ]
                   },
                   {
                     "id": 173,
                     "title": "Heshe Women's Leather Bag",
                     "description": "The Heshe Women's Leather Bag is a luxurious and high-quality leather bag for the sophisticated woman. With a timeless design and durable craftsmanship, it's a versatile accessory.",
                     "category": "womens-bags",
                     "price": 129.99,
                     "rating": 2.62,
                     "stock": 9,
                     "discountPercentage": 7.74,
                     "tags": [
                       "fashion accessories",
                       "leather bags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women's%20Leather%20Bag/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women's%20Leather%20Bag/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Heshe%20Women's%20Leather%20Bag/3.png"
                     ]
                   },
                   {
                     "id": 174,
                     "title": "Prada Women Bag",
                     "description": "The Prada Women Bag is an iconic designer bag that exudes elegance and luxury. Crafted with precision and featuring the Prada logo, it's a statement piece for fashion enthusiasts.",
                     "category": "womens-bags",
                     "price": 599.99,
                     "rating": 3.52,
                     "stock": 43,
                     "discountPercentage": 18.3,
                     "tags": [
                       "fashion accessories",
                       "designer bags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Prada%20Women%20Bag/3.png"
                     ]
                   },
                   {
                     "id": 175,
                     "title": "White Faux Leather Backpack",
                     "description": "The White Faux Leather Backpack is a trendy and practical backpack for the modern woman. With a sleek white design and ample storage space, it's perfect for both casual and on-the-go styles.",
                     "category": "womens-bags",
                     "price": 39.99,
                     "rating": 4.91,
                     "stock": 89,
                     "discountPercentage": 7.76,
                     "tags": [
                       "fashion accessories",
                       "backpacks"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/White%20Faux%20Leather%20Backpack/3.png"
                     ]
                   },
                   {
                     "id": 176,
                     "title": "Women Handbag Black",
                     "description": "The Women Handbag in Black is a classic and versatile accessory that complements various outfits. With a timeless black color and functional design, it's a must-have in every woman's wardrobe.",
                     "category": "womens-bags",
                     "price": 59.99,
                     "rating": 4.94,
                     "stock": 24,
                     "discountPercentage": 3.08,
                     "tags": [
                       "fashion accessories",
                       "handbags"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-bags/Women%20Handbag%20Black/3.png"
                     ]
                   },
                   {
                     "id": 185,
                     "title": "Black & Brown Slipper",
                     "description": "The Black & Brown Slipper is a comfortable and stylish choice for casual wear. Featuring a blend of black and brown colors, it adds a touch of sophistication to your relaxation.",
                     "category": "womens-shoes",
                     "price": 19.99,
                     "rating": 4.13,
                     "stock": 80,
                     "discountPercentage": 13.62,
                     "tags": [
                       "footwear",
                       "slippers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/4.png"
                     ]
                   },
                   {
                     "id": 186,
                     "title": "Calvin Klein Heel Shoes",
                     "description": "Calvin Klein Heel Shoes are elegant and sophisticated, designed for formal occasions. With a classic design and high-quality materials, they complement your stylish ensemble.",
                     "category": "womens-shoes",
                     "price": 79.99,
                     "rating": 4.06,
                     "stock": 99,
                     "discountPercentage": 11.39,
                     "tags": [
                       "footwear",
                       "heel shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/4.png"
                     ]
                   },
                   {
                     "id": 187,
                     "title": "Golden Shoes Woman",
                     "description": "The Golden Shoes for Women are a glamorous choice for special occasions. Featuring a golden hue and stylish design, they add a touch of luxury to your outfit.",
                     "category": "womens-shoes",
                     "price": 49.99,
                     "rating": 4.82,
                     "stock": 99,
                     "discountPercentage": 14.93,
                     "tags": [
                       "footwear",
                       "women's shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/4.png"
                     ]
                   },
                   {
                     "id": 188,
                     "title": "Pampi Shoes",
                     "description": "Pampi Shoes offer a blend of comfort and style for everyday use. With a versatile design, they are suitable for various casual occasions, providing a trendy and relaxed look.",
                     "category": "womens-shoes",
                     "price": 29.99,
                     "rating": 3.01,
                     "stock": 36,
                     "discountPercentage": 0.3,
                     "tags": [
                       "footwear",
                       "casual shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Pampi%20Shoes/4.png"
                     ]
                   },
                   {
                     "id": 189,
                     "title": "Red Shoes",
                     "description": "The Red Shoes make a bold statement with their vibrant red color. Whether for a party or a casual outing, these shoes add a pop of color and style to your wardrobe.",
                     "category": "womens-shoes",
                     "price": 34.99,
                     "rating": 4.23,
                     "stock": 53,
                     "discountPercentage": 0.01,
                     "tags": [
                       "footwear",
                       "women's shoes"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-shoes/Red%20Shoes/4.png"
                     ]
                   },
                   {
                     "id": 190,
                     "title": "IWC Ingenieur Automatic Steel",
                     "description": "The IWC Ingenieur Automatic Steel watch is a durable and sophisticated timepiece. With a stainless steel case and automatic movement, it combines precision and style for watch enthusiasts.",
                     "category": "womens-watches",
                     "price": 4999.99,
                     "rating": 2.58,
                     "stock": 85,
                     "discountPercentage": 5.76,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/IWC%20Ingenieur%20Automatic%20Steel/3.png"
                     ]
                   },
                   {
                     "id": 191,
                     "title": "Rolex Cellini Moonphase",
                     "description": "The Rolex Cellini Moonphase watch is a masterpiece of horology. Featuring a moon phase complication, it showcases the craftsmanship and elegance that Rolex is renowned for.",
                     "category": "womens-watches",
                     "price": 15999.99,
                     "rating": 3.41,
                     "stock": 66,
                     "discountPercentage": 18.76,
                     "tags": [
                       "watches",
                       "luxury watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Cellini%20Moonphase/3.png"
                     ]
                   },
                   {
                     "id": 192,
                     "title": "Rolex Datejust Women",
                     "description": "The Rolex Datejust Women's watch is an iconic timepiece designed for women. With a timeless design and a date complication, it offers both elegance and functionality.",
                     "category": "womens-watches",
                     "price": 10999.99,
                     "rating": 3.53,
                     "stock": 31,
                     "discountPercentage": 17.72,
                     "tags": [
                       "watches",
                       "luxury watches",
                       "women's watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Rolex%20Datejust%20Women/3.png"
                     ]
                   },
                   {
                     "id": 193,
                     "title": "Watch Gold for Women",
                     "description": "The Gold Women's Watch is a stunning accessory that combines luxury and style. Featuring a gold-plated case and a chic design, it adds a touch of glamour to any outfit.",
                     "category": "womens-watches",
                     "price": 799.99,
                     "rating": 3.03,
                     "stock": 94,
                     "discountPercentage": 6.37,
                     "tags": [
                       "watches",
                       "women's watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Watch%20Gold%20for%20Women/3.png"
                     ]
                   },
                   {
                     "id": 194,
                     "title": "Women's Wrist Watch",
                     "description": "The Women's Wrist Watch is a versatile and fashionable timepiece for everyday wear. With a comfortable strap and a simple yet elegant design, it complements various styles.",
                     "category": "womens-watches",
                     "price": 129.99,
                     "rating": 2.93,
                     "stock": 55,
                     "discountPercentage": 17.34,
                     "tags": [
                       "watches",
                       "women's watches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-watches/Women's%20Wrist%20Watch/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Women's%20Wrist%20Watch/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-watches/Women's%20Wrist%20Watch/3.png"
                     ]
                   },
                   {
                     "id": 177,
                     "title": "Black Women's Gown",
                     "description": "The Black Women's Gown is an elegant and timeless evening gown. With a sleek black design, it's perfect for formal events and special occasions, exuding sophistication and style.",
                     "category": "womens-dresses",
                     "price": 129.99,
                     "rating": 4.77,
                     "stock": 59,
                     "discountPercentage": 5.86,
                     "tags": [
                       "clothing",
                       "gowns"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women's%20Gown/4.png"
                     ]
                   },
                   {
                     "id": 178,
                     "title": "Corset Leather With Skirt",
                     "description": "The Corset Leather With Skirt is a bold and edgy ensemble that combines a stylish corset with a matching skirt. Ideal for fashion-forward individuals, it makes a statement at any event.",
                     "category": "womens-dresses",
                     "price": 89.99,
                     "rating": 2.52,
                     "stock": 59,
                     "discountPercentage": 19.26,
                     "tags": [
                       "clothing",
                       "corsets",
                       "skirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/4.png"
                     ]
                   },
                   {
                     "id": 179,
                     "title": "Corset With Black Skirt",
                     "description": "The Corset With Black Skirt is a chic and versatile outfit that pairs a fashionable corset with a classic black skirt. It offers a trendy and coordinated look for various occasions.",
                     "category": "womens-dresses",
                     "price": 79.99,
                     "rating": 3,
                     "stock": 67,
                     "discountPercentage": 14.61,
                     "tags": [
                       "clothing",
                       "corsets",
                       "skirts"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/4.png"
                     ]
                   },
                   {
                     "id": 180,
                     "title": "Dress Pea",
                     "description": "The Dress Pea is a stylish and comfortable dress with a pea pattern. Perfect for casual outings, it adds a playful and fun element to your wardrobe, making it a great choice for day-to-day wear.",
                     "category": "womens-dresses",
                     "price": 49.99,
                     "rating": 2.92,
                     "stock": 29,
                     "discountPercentage": 9.81,
                     "tags": [
                       "clothing",
                       "dresses"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/4.png"
                     ]
                   },
                   {
                     "id": 181,
                     "title": "Marni Red & Black Suit",
                     "description": "The Marni Red & Black Suit is a sophisticated and fashion-forward suit ensemble. With a combination of red and black tones, it showcases a modern design for a bold and confident look.",
                     "category": "womens-dresses",
                     "price": 179.99,
                     "rating": 4.17,
                     "stock": 15,
                     "discountPercentage": 15.4,
                     "tags": [
                       "clothing",
                       "suits"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/1.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/2.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/3.png",
                       "https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/4.png"
                     ]
                   },
                   {
                     "id": 197,
                     "title": "Blue & Black Check Shirt",
                     "description": "The Blue & Black Check Shirt is a stylish and comfortable men's shirt featuring a classic check pattern. Made from high-quality fabric, it's suitable for both casual and semi-formal occasions.",
                     "category": "mens-shirts",
                     "price": 29.99,
                     "rating": 3.5,
                     "stock": 50,
                     "discountPercentage": 1.41,
                     "tags": [
                       "shirts"
                     ],
                     "images": [
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741131639/1_xkw2tp.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741131669/2_yh4svy.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741131709/3_kzajvi.png"
                     ]
                   }],
    total: 36
  });

  // Seed 'sports' subcategory with 'products' document
  await productsRef.collection('sports').doc('products').set({
    products: [{
                     "id": 138,
                     "title": "Baseball Ball",
                     "description": "The Baseball Ball is a standard baseball used in baseball games. It features a durable leather cover and is designed for pitching, hitting, and fielding in the game of baseball.",
                     "category": "sports-accessories",
                     "price": 8.99,
                     "rating": 4.76,
                     "stock": 71,
                     "discountPercentage": 13.72,
                     "tags": [
                       "sports equipment",
                       "baseball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 139,
                     "title": "Baseball Glove",
                     "description": "The Baseball Glove is a protective glove worn by baseball players. It is designed to catch and field the baseball, providing players with comfort and control during the game.",
                     "category": "sports-accessories",
                     "price": 24.99,
                     "rating": 2.72,
                     "stock": 43,
                     "discountPercentage": 16.27,
                     "tags": [
                       "sports equipment",
                       "baseball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/1.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/2.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Baseball%20Glove/3.png"
                     ]
                   },
                   {
                     "id": 140,
                     "title": "Basketball",
                     "description": "The Basketball is a standard ball used in basketball games. It is designed for dribbling, shooting, and passing in the game of basketball, suitable for both indoor and outdoor play.",
                     "category": "sports-accessories",
                     "price": 14.99,
                     "rating": 4.15,
                     "stock": 100,
                     "discountPercentage": 18.05,
                     "tags": [
                       "sports equipment",
                       "basketball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Basketball/1.png"
                     ]
                   },
                   {
                     "id": 141,
                     "title": "Basketball Rim",
                     "description": "The Basketball Rim is a sturdy hoop and net assembly mounted on a basketball backboard. It provides a target for shooting and scoring in the game of basketball.",
                     "category": "sports-accessories",
                     "price": 39.99,
                     "rating": 4.98,
                     "stock": 57,
                     "discountPercentage": 6.02,
                     "tags": [
                       "sports equipment",
                       "basketball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Basketball%20Rim/1.png"
                     ]
                   },
                   {
                     "id": 142,
                     "title": "Cricket Ball",
                     "description": "The Cricket Ball is a hard leather ball used in the sport of cricket. It is bowled and batted in the game, and its hardness and seam contribute to the dynamics of cricket play.",
                     "category": "sports-accessories",
                     "price": 12.99,
                     "rating": 4.43,
                     "stock": 42,
                     "discountPercentage": 12.93,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 143,
                     "title": "Cricket Bat",
                     "description": "The Cricket Bat is an essential piece of cricket equipment used by batsmen to hit the cricket ball. It is made of wood and comes in various sizes and designs.",
                     "category": "sports-accessories",
                     "price": 29.99,
                     "rating": 3.07,
                     "stock": 3,
                     "discountPercentage": 9.03,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Bat/1.png"
                     ]
                   },
                   {
                     "id": 144,
                     "title": "Cricket Helmet",
                     "description": "The Cricket Helmet is a protective headgear worn by cricket players, especially batsmen and wicketkeepers. It provides protection against fast bowling and bouncers.",
                     "category": "sports-accessories",
                     "price": 44.99,
                     "rating": 3.34,
                     "stock": 31,
                     "discountPercentage": 10.75,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/1.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/2.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/3.png",
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/4.png"
                     ]
                   },
                   {
                     "id": 145,
                     "title": "Cricket Wicket",
                     "description": "The Cricket Wicket is a set of three stumps and two bails, forming a wicket used in the sport of cricket. Batsmen aim to protect the wicket while scoring runs.",
                     "category": "sports-accessories",
                     "price": 29.99,
                     "rating": 4.16,
                     "stock": 31,
                     "discountPercentage": 8.79,
                     "tags": [
                       "sports equipment",
                       "cricket"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Wicket/1.png"
                     ]
                   },
                   {
                     "id": 146,
                     "title": "Feather Shuttlecock",
                     "description": "The Feather Shuttlecock is used in the sport of badminton. It features natural feathers and is designed for high-speed play, providing stability and accuracy during matches.",
                     "category": "sports-accessories",
                     "price": 5.99,
                     "rating": 3.95,
                     "stock": 17,
                     "discountPercentage": 10.24,
                     "tags": [
                       "sports equipment",
                       "badminton"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Feather%20Shuttlecock/1.png"
                     ]
                   },
                   {
                     "id": 147,
                     "title": "Football",
                     "description": "The Football, also known as a soccer ball, is the standard ball used in the sport of football (soccer). It is designed for kicking and passing in the game.",
                     "category": "sports-accessories",
                     "price": 17.99,
                     "rating": 3.94,
                     "stock": 66,
                     "discountPercentage": 0.59,
                     "tags": [
                       "sports equipment",
                       "football"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Football/1.png"
                     ]
                   },
                   {
                     "id": 148,
                     "title": "Golf Ball",
                     "description": "The Golf Ball is a small ball used in the sport of golf. It features dimples on its surface, providing aerodynamic lift and distance when struck by a golf club.",
                     "category": "sports-accessories",
                     "price": 9.99,
                     "rating": 4.84,
                     "stock": 45,
                     "discountPercentage": 19.38,
                     "tags": [
                       "sports equipment",
                       "golf"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Golf%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 149,
                     "title": "Iron Golf",
                     "description": "The Iron Golf is a type of golf club designed for various golf shots. It features a solid metal head and is used for approach shots, chipping, and other golfing techniques.",
                     "category": "sports-accessories",
                     "price": 49.99,
                     "rating": 4.87,
                     "stock": 7,
                     "discountPercentage": 3.32,
                     "tags": [
                       "sports equipment",
                       "golf"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Iron%20Golf/1.png"
                     ]
                   },
                   {
                     "id": 150,
                     "title": "Metal Baseball Bat",
                     "description": "The Metal Baseball Bat is a durable and lightweight baseball bat made from metal alloys. It is commonly used in baseball games for hitting and batting practice.",
                     "category": "sports-accessories",
                     "price": 29.99,
                     "rating": 4.11,
                     "stock": 37,
                     "discountPercentage": 2.55,
                     "tags": [
                       "sports equipment",
                       "baseball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Metal%20Baseball%20Bat/1.png"
                     ]
                   },
                   {
                     "id": 151,
                     "title": "Tennis Ball",
                     "description": "The Tennis Ball is a standard ball used in the sport of tennis. It is designed for bouncing and hitting with tennis rackets during matches or practice sessions.",
                     "category": "sports-accessories",
                     "price": 6.99,
                     "rating": 4.77,
                     "stock": 99,
                     "discountPercentage": 0.14,
                     "tags": [
                       "sports equipment",
                       "tennis"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Tennis%20Ball/1.png"
                     ]
                   },
                   {
                     "id": 152,
                     "title": "Tennis Racket",
                     "description": "The Tennis Racket is an essential piece of equipment used in the sport of tennis. It features a frame with strings and a grip, allowing players to hit the tennis ball.",
                     "category": "sports-accessories",
                     "price": 49.99,
                     "rating": 3.82,
                     "stock": 86,
                     "discountPercentage": 15.8,
                     "tags": [
                       "sports equipment",
                       "tennis"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Tennis%20Racket/1.png"
                     ]
                   },
                   {
                     "id": 153,
                     "title": "Volleyball",
                     "description": "The Volleyball is a standard ball used in the sport of volleyball. It is designed for passing, setting, and spiking over the net during volleyball matches.",
                     "category": "sports-accessories",
                     "price": 11.99,
                     "rating": 4.08,
                     "stock": 0,
                     "discountPercentage": 2.2,
                     "tags": [
                       "sports equipment",
                       "volleyball"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/sports-accessories/Volleyball/1.png"
                     ]
                   },
                   {
                     "id": 198,
                     "title": "American Football",
                     "description": "The American Football is a classic ball used in American football games. It is designed for throwing and catching, making it an essential piece of equipment for the sport.",
                     "category": "american football",
                     "price": 19.99,
                     "rating": 3.5,
                     "stock": 50,
                     "discountPercentage": 10.28,
                     "tags": [
                       "american football"
                     ],
                     "images": [
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741133824/2_u8o3ja.png"
                     ]
                   }],
    total: 17
  });

  // Seed 'technology' subcategory with 'products' document
  await productsRef.collection('technology').doc('products').set({
    products: [{
                     "id": 122,
                     "title": "iPhone 6",
                     "description": "The iPhone 6 is a stylish and capable smartphone with a larger display and improved performance. It introduced new features and design elements, making it a popular choice in its time.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 3.76,
                     "stock": 99,
                     "discountPercentage": 4.54,
                     "tags": [
                       "smartphones",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/3.png"
                     ]
                   },
                   {
                     "id": 123,
                     "title": "iPhone 13 Pro",
                     "description": "The iPhone 13 Pro is a cutting-edge smartphone with a powerful camera system, high-performance chip, and stunning display. It offers advanced features for users who demand top-notch technology.",
                     "category": "smartphones",
                     "price": 1099.99,
                     "rating": 3.42,
                     "stock": 26,
                     "discountPercentage": 18.3,
                     "tags": [
                       "smartphones",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/3.png"
                     ]
                   },
                   {
                     "id": 124,
                     "title": "iPhone X",
                     "description": "The iPhone X is a flagship smartphone featuring a bezel-less OLED display, facial recognition technology (Face ID), and impressive performance. It represents a milestone in iPhone design and innovation.",
                     "category": "smartphones",
                     "price": 899.99,
                     "rating": 4.96,
                     "stock": 99,
                     "discountPercentage": 14.19,
                     "tags": [
                       "smartphones",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/3.png"
                     ]
                   },
                   {
                     "id": 125,
                     "title": "Oppo A57",
                     "description": "The Oppo A57 is a mid-range smartphone known for its sleek design and capable features. It offers a balance of performance and affordability, making it a popular choice.",
                     "category": "smartphones",
                     "price": 249.99,
                     "rating": 3.1,
                     "stock": 76,
                     "discountPercentage": 12.17,
                     "tags": [
                       "smartphones",
                       "oppo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20A57/3.png"
                     ]
                   },
                   {
                     "id": 126,
                     "title": "Oppo F19 Pro Plus",
                     "description": "The Oppo F19 Pro Plus is a feature-rich smartphone with a focus on camera capabilities. It boasts advanced photography features and a powerful performance for a premium user experience.",
                     "category": "smartphones",
                     "price": 399.99,
                     "rating": 2.57,
                     "stock": 92,
                     "discountPercentage": 15.62,
                     "tags": [
                       "smartphones",
                       "oppo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/3.png"
                     ]
                   },
                   {
                     "id": 127,
                     "title": "Oppo K1",
                     "description": "The Oppo K1 series offers a range of smartphones with various features and specifications. Known for their stylish design and reliable performance, the Oppo K1 series caters to diverse user preferences.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 3.39,
                     "stock": 61,
                     "discountPercentage": 14.58,
                     "tags": [
                       "smartphones",
                       "oppo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/3.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Oppo%20K1/4.png"
                     ]
                   },
                   {
                     "id": 128,
                     "title": "Realme C35",
                     "description": "The Realme C35 is a budget-friendly smartphone with a focus on providing essential features for everyday use. It offers a reliable performance and user-friendly experience.",
                     "category": "smartphones",
                     "price": 149.99,
                     "rating": 2.56,
                     "stock": 81,
                     "discountPercentage": 16.47,
                     "tags": [
                       "smartphones",
                       "realme"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20C35/3.png"
                     ]
                   },
                   {
                     "id": 129,
                     "title": "Realme X",
                     "description": "The Realme X is a mid-range smartphone known for its sleek design and impressive display. It offers a good balance of performance and camera capabilities for users seeking a quality device.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 4.42,
                     "stock": 87,
                     "discountPercentage": 2.39,
                     "tags": [
                       "smartphones",
                       "realme"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20X/3.png"
                     ]
                   },
                   {
                     "id": 130,
                     "title": "Realme XT",
                     "description": "The Realme XT is a feature-rich smartphone with a focus on camera technology. It comes equipped with advanced camera sensors, delivering high-quality photos and videos for photography enthusiasts.",
                     "category": "smartphones",
                     "price": 349.99,
                     "rating": 4.14,
                     "stock": 53,
                     "discountPercentage": 3.03,
                     "tags": [
                       "smartphones",
                       "realme"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Realme%20XT/3.png"
                     ]
                   },
                   {
                     "id": 131,
                     "title": "Samsung Galaxy S7",
                     "description": "The Samsung Galaxy S7 is a flagship smartphone known for its sleek design and advanced features. It features a high-resolution display, powerful camera, and robust performance.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 4.9,
                     "stock": 55,
                     "discountPercentage": 8.83,
                     "tags": [
                       "smartphones",
                       "samsung galaxy"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S7/3.png"
                     ]
                   },
                   {
                     "id": 132,
                     "title": "Samsung Galaxy S8",
                     "description": "The Samsung Galaxy S8 is a premium smartphone with an Infinity Display, offering a stunning visual experience. It boasts advanced camera capabilities and cutting-edge technology.",
                     "category": "smartphones",
                     "price": 499.99,
                     "rating": 3.69,
                     "stock": 75,
                     "discountPercentage": 2.69,
                     "tags": [
                       "smartphones",
                       "samsung galaxy"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S8/3.png"
                     ]
                   },
                   {
                     "id": 133,
                     "title": "Samsung Galaxy S10",
                     "description": "The Samsung Galaxy S10 is a flagship device featuring a dynamic AMOLED display, versatile camera system, and powerful performance. It represents innovation and excellence in smartphone technology.",
                     "category": "smartphones",
                     "price": 699.99,
                     "rating": 2.81,
                     "stock": 40,
                     "discountPercentage": 0.97,
                     "tags": [
                       "smartphones",
                       "samsung galaxy"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Samsung%20Galaxy%20S10/3.png"
                     ]
                   },
                   {
                     "id": 134,
                     "title": "Vivo S1",
                     "description": "The Vivo S1 is a stylish and mid-range smartphone offering a blend of design and performance. It features a vibrant display, capable camera system, and reliable functionality.",
                     "category": "smartphones",
                     "price": 249.99,
                     "rating": 2.83,
                     "stock": 13,
                     "discountPercentage": 4.25,
                     "tags": [
                       "smartphones",
                       "vivo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20S1/3.png"
                     ]
                   },
                   {
                     "id": 135,
                     "title": "Vivo V9",
                     "description": "The Vivo V9 is a smartphone known for its sleek design and emphasis on capturing high-quality selfies. It features a notch display, dual-camera setup, and a modern design.",
                     "category": "smartphones",
                     "price": 299.99,
                     "rating": 3.1,
                     "stock": 19,
                     "discountPercentage": 14.57,
                     "tags": [
                       "smartphones",
                       "vivo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20V9/3.png"
                     ]
                   },
                   {
                     "id": 136,
                     "title": "Vivo X21",
                     "description": "The Vivo X21 is a premium smartphone with a focus on cutting-edge technology. It features an in-display fingerprint sensor, a high-resolution display, and advanced camera capabilities.",
                     "category": "smartphones",
                     "price": 499.99,
                     "rating": 2.75,
                     "stock": 0,
                     "discountPercentage": 7.32,
                     "tags": [
                       "smartphones",
                       "vivo"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/1.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/2.png",
                       "https://cdn.dummyjson.com/products/images/smartphones/Vivo%20X21/3.png"
                     ]
                   },
                   {
                     "id": 159,
                     "title": "iPad Mini 2021 Starlight",
                     "description": "The iPad Mini 2021 in Starlight is a compact and powerful tablet from Apple. Featuring a stunning Retina display, powerful A-series chip, and a sleek design, it offers a premium tablet experience.",
                     "category": "tablets",
                     "price": 499.99,
                     "rating": 3.87,
                     "stock": 32,
                     "discountPercentage": 19.48,
                     "tags": [
                       "electronics",
                       "tablets"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/1.png",
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/2.png",
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/3.png",
                       "https://cdn.dummyjson.com/products/images/tablets/iPad%20Mini%202021%20Starlight/4.png"
                     ]
                   },
                   {
                     "id": 160,
                     "title": "Samsung Galaxy Tab S8 Plus Grey",
                     "description": "The Samsung Galaxy Tab S8 Plus in Grey is a high-performance Android tablet by Samsung. With a large AMOLED display, powerful processor, and S Pen support, it's ideal for productivity and entertainment.",
                     "category": "tablets",
                     "price": 599.99,
                     "rating": 3.43,
                     "stock": 76,
                     "discountPercentage": 8.11,
                     "tags": [
                       "electronics",
                       "tablets"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/1.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/2.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/3.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20S8%20Plus%20Grey/4.png"
                     ]
                   },
                   {
                     "id": 161,
                     "title": "Samsung Galaxy Tab White",
                     "description": "The Samsung Galaxy Tab in White is a sleek and versatile Android tablet. With a vibrant display, long-lasting battery, and a range of features, it offers a great user experience for various tasks.",
                     "category": "tablets",
                     "price": 349.99,
                     "rating": 3.7,
                     "stock": 0,
                     "discountPercentage": 4.82,
                     "tags": [
                       "electronics",
                       "tablets"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/1.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/2.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/3.png",
                       "https://cdn.dummyjson.com/products/images/tablets/Samsung%20Galaxy%20Tab%20White/4.png"
                     ]
                   },
                   {
                     "id": 99,
                     "title": "Amazon Echo Plus",
                     "description": "The Amazon Echo Plus is a smart speaker with built-in Alexa voice control. It features premium sound quality and serves as a hub for controlling smart home devices.",
                     "category": "mobile-accessories",
                     "price": 99.99,
                     "rating": 3.52,
                     "stock": 50,
                     "discountPercentage": 16.3,
                     "tags": [
                       "electronics",
                       "smart speakers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Amazon%20Echo%20Plus/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Amazon%20Echo%20Plus/2.png"
                     ]
                   },
                   {
                     "id": 100,
                     "title": "Apple Airpods",
                     "description": "The Apple Airpods offer a seamless wireless audio experience. With easy pairing, high-quality sound, and Siri integration, they are perfect for on-the-go listening.",
                     "category": "mobile-accessories",
                     "price": 129.99,
                     "rating": 4.38,
                     "stock": 93,
                     "discountPercentage": 4.82,
                     "tags": [
                       "electronics",
                       "wireless earphones"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/2.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/3.png"
                     ]
                   },
                   {
                     "id": 101,
                     "title": "Apple AirPods Max Silver",
                     "description": "The Apple AirPods Max in Silver are premium over-ear headphones with high-fidelity audio, adaptive EQ, and active noise cancellation. Experience immersive sound in style.",
                     "category": "mobile-accessories",
                     "price": 549.99,
                     "rating": 3.11,
                     "stock": 7,
                     "discountPercentage": 11.7,
                     "tags": [
                       "electronics",
                       "over-ear headphones"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/1.png"
                     ]
                   },
                   {
                     "id": 102,
                     "title": "Apple Airpower Wireless Charger",
                     "description": "The Apple AirPower Wireless Charger provides a convenient way to charge your compatible Apple devices wirelessly. Simply place your devices on the charging mat for effortless charging.",
                     "category": "mobile-accessories",
                     "price": 79.99,
                     "rating": 4.51,
                     "stock": 78,
                     "discountPercentage": 6.54,
                     "tags": [
                       "electronics",
                       "wireless chargers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpower%20Wireless%20Charger/1.png"
                     ]
                   },
                   {
                     "id": 103,
                     "title": "Apple HomePod Mini Cosmic Grey",
                     "description": "The Apple HomePod Mini in Cosmic Grey is a compact smart speaker that delivers impressive audio and integrates seamlessly with the Apple ecosystem for a smart home experience.",
                     "category": "mobile-accessories",
                     "price": 99.99,
                     "rating": 4.51,
                     "stock": 65,
                     "discountPercentage": 3.7,
                     "tags": [
                       "electronics",
                       "smart speakers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20HomePod%20Mini%20Cosmic%20Grey/1.png"
                     ]
                   },
                   {
                     "id": 104,
                     "title": "Apple iPhone Charger",
                     "description": "The Apple iPhone Charger is a high-quality charger designed for fast and efficient charging of your iPhone. Ensure your device stays powered up and ready to go.",
                     "category": "mobile-accessories",
                     "price": 19.99,
                     "rating": 3.03,
                     "stock": 4,
                     "discountPercentage": 1.01,
                     "tags": [
                       "electronics",
                       "chargers"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20iPhone%20Charger/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20iPhone%20Charger/2.png"
                     ]
                   },
                   {
                     "id": 105,
                     "title": "Apple MagSafe Battery Pack",
                     "description": "The Apple MagSafe Battery Pack is a portable and convenient way to add extra battery life to your MagSafe-compatible iPhone. Attach it magnetically for a secure connection.",
                     "category": "mobile-accessories",
                     "price": 99.99,
                     "rating": 2.61,
                     "stock": 80,
                     "discountPercentage": 10.27,
                     "tags": [
                       "electronics",
                       "power banks"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20MagSafe%20Battery%20Pack/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20MagSafe%20Battery%20Pack/2.png"
                     ]
                   },
                   {
                     "id": 106,
                     "title": "Apple Watch Series 4 Gold",
                     "description": "The Apple Watch Series 4 in Gold is a stylish and advanced smartwatch with features like heart rate monitoring, fitness tracking, and a beautiful Retina display.",
                     "category": "mobile-accessories",
                     "price": 349.99,
                     "rating": 4.42,
                     "stock": 68,
                     "discountPercentage": 5.14,
                     "tags": [
                       "electronics",
                       "smartwatches"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/2.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Watch%20Series%204%20Gold/3.png"
                     ]
                   },
                   {
                     "id": 107,
                     "title": "Beats Flex Wireless Earphones",
                     "description": "The Beats Flex Wireless Earphones offer a comfortable and versatile audio experience. With magnetic earbuds and up to 12 hours of battery life, they are ideal for everyday use.",
                     "category": "mobile-accessories",
                     "price": 49.99,
                     "rating": 4.17,
                     "stock": 49,
                     "discountPercentage": 8.27,
                     "tags": [
                       "electronics",
                       "wireless earphones"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Beats%20Flex%20Wireless%20Earphones/1.png"
                     ]
                   },
                   {
                     "id": 108,
                     "title": "iPhone 12 Silicone Case with MagSafe Plum",
                     "description": "The iPhone 12 Silicone Case with MagSafe in Plum is a stylish and protective case designed for the iPhone 12. It features MagSafe technology for easy attachment of accessories.",
                     "category": "mobile-accessories",
                     "price": 29.99,
                     "rating": 4.41,
                     "stock": 51,
                     "discountPercentage": 14.35,
                     "tags": [
                       "electronics",
                       "phone accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/2.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/3.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/iPhone%2012%20Silicone%20Case%20with%20MagSafe%20Plum/4.png"
                     ]
                   },
                   {
                     "id": 109,
                     "title": "Monopod",
                     "description": "The Monopod is a versatile camera accessory for stable and adjustable shooting. Perfect for capturing selfies, group photos, and videos with ease.",
                     "category": "mobile-accessories",
                     "price": 19.99,
                     "rating": 2.99,
                     "stock": 96,
                     "discountPercentage": 11.62,
                     "tags": [
                       "electronics",
                       "camera accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Monopod/1.png",
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Monopod/2.png"
                     ]
                   },
                   {
                     "id": 110,
                     "title": "Selfie Lamp with iPhone",
                     "description": "The Selfie Lamp with iPhone is a portable and adjustable LED light designed to enhance your selfies and video calls. Attach it to your iPhone for well-lit photos.",
                     "category": "mobile-accessories",
                     "price": 14.99,
                     "rating": 2.84,
                     "stock": 89,
                     "discountPercentage": 13.86,
                     "tags": [
                       "electronics",
                       "selfie accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Selfie%20Lamp%20with%20iPhone/1.png"
                     ]
                   },
                   {
                     "id": 111,
                     "title": "Selfie Stick Monopod",
                     "description": "The Selfie Stick Monopod is a extendable and foldable device for capturing the perfect selfie or group photo. Compatible with smartphones and cameras.",
                     "category": "mobile-accessories",
                     "price": 12.99,
                     "rating": 2.93,
                     "stock": 33,
                     "discountPercentage": 15.29,
                     "tags": [
                       "electronics",
                       "selfie accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/Selfie%20Stick%20Monopod/1.png"
                     ]
                   },
                   {
                     "id": 112,
                     "title": "TV Studio Camera Pedestal",
                     "description": "The TV Studio Camera Pedestal is a professional-grade camera support system for smooth and precise camera movements in a studio setting. Ideal for broadcast and production.",
                     "category": "mobile-accessories",
                     "price": 499.99,
                     "rating": 4.05,
                     "stock": 45,
                     "discountPercentage": 10.28,
                     "tags": [
                       "electronics",
                       "camera accessories"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/mobile-accessories/TV%20Studio%20Camera%20Pedestal/1.png"
                     ]
                   },
                   {
                     "id": 78,
                     "title": "Apple MacBook Pro 14 Inch Space Grey",
                     "description": "The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple's M1 Pro chip for exceptional performance and a stunning Retina display.",
                     "category": "laptops",
                     "price": 1999.99,
                     "rating": 3.13,
                     "stock": 39,
                     "discountPercentage": 9.25,
                     "tags": [
                       "laptops",
                       "apple"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/3.png"
                     ]
                   },
                   {
                     "id": 79,
                     "title": "Asus Zenbook Pro Dual Screen Laptop",
                     "description": "The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.",
                     "category": "laptops",
                     "price": 1799.99,
                     "rating": 3.14,
                     "stock": 38,
                     "discountPercentage": 9.21,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/3.png"
                     ]
                   },
                   {
                     "id": 80,
                     "title": "Huawei Matebook X Pro",
                     "description": "The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.",
                     "category": "laptops",
                     "price": 1399.99,
                     "rating": 4.62,
                     "stock": 34,
                     "discountPercentage": 15.25,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/3.png"
                     ]
                   },
                   {
                     "id": 81,
                     "title": "Lenovo Yoga 920",
                     "description": "The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.",
                     "category": "laptops",
                     "price": 1099.99,
                     "rating": 2.98,
                     "stock": 71,
                     "discountPercentage": 7.77,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/3.png"
                     ]
                   },
                   {
                     "id": 82,
                     "title": "New DELL XPS 13 9300 Laptop",
                     "description": "The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.",
                     "category": "laptops",
                     "price": 1499.99,
                     "rating": 2.98,
                     "stock": 18,
                     "discountPercentage": 11.7,
                     "tags": [
                       "laptops"
                     ],
                     "images": [
                       "https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/1.png",
                       "https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/2.png",
                       "https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/3.png"
                     ]
                   },
                   {
                     "id": 199,
                     "title": "Iphone 5s",
                     "description": "The iPhone 5s is a classic smartphone known for its compact design and advanced features during its release. While it's an older model, it still provides a reliable user experience.",
                     "category": "smartphones",
                     "price": 199.99,
                     "rating": 3.5,
                     "stock": 50,
                     "discountPercentage": 10.88,
                     "tags": [
                       "smartphones"
                     ],
                     "images": [
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741134035/1_pz7is8.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741134046/2_ayvd1r.png",
                       "https://res.cloudinary.com/dv8yk7rxn/image/upload/v1741134048/3_pldyyu.png"
                     ]
                   }],
    total: 37
  });

  console.log('Data seeded successfully!');
}

// Run the function to seed data
seedData().catch(console.error);
