# 🐟 Tilapia Supply Chain Smart Contract

## 📌 Selected Farm Business
Tilapia Farming

---

## 📖 Project Description
This project implements a blockchain-based supply chain system that tracks tilapia products from farmers to distributors. The goal is to ensure **transparency**, **traceability**, and **data integrity** by recording all transactions on the blockchain using a smart contract.

Each product is registered by a farmer and can be transferred to a distributor, with all ownership changes and status updates recorded permanently.

---

## ⚙️ Contract Features

### 🔹 Product Registration
- Farmers can register new products
- Stores:
  - Product ID
  - Product name/type
  - Quantity
  - Origin (farm location)
  - Date created (timestamp)

### 🔹 Ownership Tracking
- Tracks the current owner of each product
- Maintains a full ownership history

### 🔹 Status Updates
Each product has a status:
- `Created`
- `In Transit`
- `Delivered`

### 🔹 Transfer Function
- Allows transfer of ownership from Farmer → Distributor
- Automatically updates product status
- Records transaction history

### 🔹 Access Control
- Only authorized **farmers** can register products
- Only authorized **distributors** can confirm delivery
- Only **contract owner** can assign roles

### 🔹 Data Retrieval
- View product details
- View ownership history
- View current status

---

## 🧪 Sample Test Steps (Remix IDE)

1. **Deploy Contract**
   - Use Account 1 (Owner)

2. **Add Roles**
   - Add Farmer (Account 2)
   - Add Distributor (Account 3)

3. **Register Product (Farmer)**
   - registerProduct(1, "Tilapia Batch A", 100, "Pangasinan")

4. **Transfer to Distributor**
   - transferToDistributor(1, distributorAddress)

5. **Confirm Delivery (Distributor)**
   - confirmDelivery(1)
   
6. **Retrieve Data**
   - getProduct(1)
   - getHistory(1)



## Screenshots of Steps
 
1. Deploy Contract:









