// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TilapiaSupplyChain {

    enum Status { Created, InTransit, Delivered }

    struct Product {
        uint256 productId;
        string name;
        uint256 quantity;
        string origin;
        uint256 dateCreated;
        address currentOwner;
        Status status;
    }

    struct History {
        address from;
        address to;
        uint256 timestamp;
        Status status;
    }

    mapping(uint256 => Product) public products;
    mapping(uint256 => History[]) public productHistory;

    address public owner;

    mapping(address => bool) public farmers;
    mapping(address => bool) public distributors;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    modifier onlyFarmer() {
        require(farmers[msg.sender], "Not authorized farmer");
        _;
    }

    modifier onlyDistributor() {
        require(distributors[msg.sender], "Not authorized distributor");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // ========================
    // ACCESS CONTROL
    // ========================

    function addFarmer(address _farmer) public onlyOwner {
        farmers[_farmer] = true;
    }

    function addDistributor(address _distributor) public onlyOwner {
        distributors[_distributor] = true;
    }

    // ========================
    // PRODUCT REGISTRATION
    // ========================

    function registerProduct(
        uint256 _productId,
        string memory _name,
        uint256 _quantity,
        string memory _origin
    ) public onlyFarmer {

        require(products[_productId].productId == 0, "Product already exists");

        products[_productId] = Product({
            productId: _productId,
            name: _name,
            quantity: _quantity,
            origin: _origin,
            dateCreated: block.timestamp,
            currentOwner: msg.sender,
            status: Status.Created
        });

        productHistory[_productId].push(History({
            from: address(0),
            to: msg.sender,
            timestamp: block.timestamp,
            status: Status.Created
        }));
    }

    // ========================
    // TRANSFER OWNERSHIP
    // ========================

    function transferToDistributor(
        uint256 _productId,
        address _distributor
    ) public onlyFarmer {

        require(products[_productId].productId != 0, "Product not found");
        require(distributors[_distributor], "Invalid distributor");

        Product storage product = products[_productId];

        require(product.currentOwner == msg.sender, "Not owner");

        product.currentOwner = _distributor;
        product.status = Status.InTransit;

        productHistory[_productId].push(History({
            from: msg.sender,
            to: _distributor,
            timestamp: block.timestamp,
            status: Status.InTransit
        }));
    }

    function confirmDelivery(uint256 _productId) public onlyDistributor {

        Product storage product = products[_productId];

        require(product.currentOwner == msg.sender, "Not owner");

        product.status = Status.Delivered;

        productHistory[_productId].push(History({
            from: msg.sender,
            to: msg.sender,
            timestamp: block.timestamp,
            status: Status.Delivered
        }));
    }

    // ========================
    // DATA RETRIEVAL
    // ========================

    function getProduct(uint256 _productId)
        public
        view
        returns (
            uint256,
            string memory,
            uint256,
            string memory,
            uint256,
            address,
            Status
        )
    {
        Product memory p = products[_productId];

        return (
            p.productId,
            p.name,
            p.quantity,
            p.origin,
            p.dateCreated,
            p.currentOwner,
            p.status
        );
    }

    function getHistory(uint256 _productId)
        public
        view
        returns (History[] memory)
    {
        return productHistory[_productId];
    }
}