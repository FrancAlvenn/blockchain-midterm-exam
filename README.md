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
0. **Setup Accounts**
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/67de0d6f-ebc2-4f4c-be85-3de633db2cc6" />

2. **Deploy Contract**
   - Use Account 1 (Owner)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/c894ebcb-3f61-4f7e-a55a-0ca9b5e6e494" />

3. **Add Roles**
   - Add Farmer (Account 2)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/26c2318f-641b-4f14-9426-6fbbe0c0181d" />

   - Add Distributor (Account 3)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/272e8964-6315-47e4-bec7-78892a9a3b6e" />


4. **Register Product (Farmer)**
   - registerProduct(1, "Tilapia Batch A", 100, "Pangasinan")
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/ab64a250-46f5-406e-b2cd-e07e1c456bd9" />


5. **Transfer to Distributor**
   - transferToDistributor(1, distributorAddress)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/d4917c5a-76e0-49cd-ace7-c1727d708c30" />

6. **Confirm Delivery (Distributor)**
   - confirmDelivery(1)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/69597366-0b8c-47b1-ac31-2288665fede8" />

7. **Retrieve Data**
   - getProduct(1)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/5867ae93-435a-4d7a-b46c-089bf59d46e6" />

   - getHistory(1)
<img width="361" height="606" alt="image" src="https://github.com/user-attachments/assets/63e99433-c772-4c0e-abff-fabf8c823d7e" />



## Video Capture

https://drive.google.com/file/d/1CwgBMXxYa8QlJHGJwimnPTrfHd4T4Ksr/view?usp=sharing







