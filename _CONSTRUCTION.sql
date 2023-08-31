CREATE DATABASE PRIME;
USING PRIME;

CREATE TABLE Dish{
	dishID INT AUTO_INCREMENT NOT NULL,
	dishName VARCHAR(40) NOT NULL,
	dishPrice DECIMAL(13,2) NOT NULL,
	dishDescription VARCHAR(200),
	PRIMARY KEY dishID
	}

CREATE TABLE dishXingredient{
	dishID INT NOT NULL,
	ingredientID INT NOT NULL,
	PRIMARY KEY (dishID,ingredientID),
	FOREIGN KEY dishID REFERENCES Dish(dishID),
	FOREIGN KEY ingredientID REFERENCES Ingredient(ingredientID)
	}

CREATE TABLE Ingredient{
	ingredientID INT AUTO_INCREMENT NOT NULL,
	ingredientName VARCHAR(40) NOT NULL,
	PRIMARY KEY ingredientID
	}

CREATE TABLE Product{
	productID INT AUTO_INCREMENT NOT NULL,
	ingredientID INT NOT NULL,
	productName VARCHAR(40) NOT NULL,
	merchantID VARCHAR(40) NOT NULL,
	productQuantity INT NOT NULL,
	productCost DECIMAL(13,2),
	productSize INT,
	PRIMARY KEY productID,
	FOREIGN KEY ingredientID REFERENCES Ingredient(ingredientID),
	FOREIGN KEY merchantID REFERENCES Merchant(merchantID)
	}
	
CREATE TABLE productXmerchant{
	productID INT NOT NULL,
	merchantID INT NOT NULL,
	PRIMARY KEY (productID,merchantID),
	FOREIGN KEY productID REFERENCES product(productID),
	FOREIGN KEY merchantID REFERENCES merchant(merchantID)
	}
	
CREATE TABLE Merchant{
	merchantID INT AUTO_INCREMENT NOT NULL,
	merchantName VARCHAR(40) NOT NULL,
	}

CREATE TABLE Location{
	locationID INT AUTO_INCREMENT NOT NULL,
	locationName VARCHAR(40) NOT NULL,
	locationShelfCount INT,
	PRIMARY KEY locationID
	}

CREATE TABLE Shelf{
	shelfID INT AUTO_INCREMENT NOT NULL,
	locationID INT NOT NULL,
	shelfLevels INT,
	PRIMARY KEY ShelfID,
	FOREIGN KEY locationID REFERENCES Location(locationID)
	}

CREATE TABLE Layer{
	layerNo INT NOT NULL,
	shelfID INT NOT NULL,
	PRIMARY KEY (shelfID,layerNo),
	FOREIGN KEY shelfID REFERENCES Shelf(shelfID)
	}
	
CREATE TABLE Slot{
	slotID INT AUTO_INCREMENT NOT NULL,
	slotNo INT NOT NULL,
	layerNo INT NOT NULL,
	shelfID INT NOT NULL,
	PRIMARY KEY slotID,
	FOREIGN KEY layerNo REFERENCES Layer(layerNo),
	FOREIGN KEY shelfID REFERENCES Shelf(shelfID)

CREATE TABLE slotXproduct{
	slotID INT NOT NULL,
	productID INT NOT NULL,
	PRIMARY KEY (slotID,productID),
	FOREIGN KEY slotID REFERENCES Slot(slotID),
	FOREIGN KEY productID REFERENCES Product(productID)
	}
	
CREATE TABLE Invoice{
	invoiceID INT AUTO_INCREMENT NOT NULL,
	invoiceDate DATE,
	PRIMARY KEY invoiceID
	}
	
CREATE TABLE invoiceXproduct{
	invoiceID INT NOT NULL,
	productID INT NOT NULL,
	PRIMARY KEY (invoiceID,productID),
	FOREIGN KEY invoiceID REFERENCES Invoice(invoiceID),
	FOREIGN KEY productID REFERENCES Product(productID)
	}

CREATE TABLE Shipment{
	shipmentID INT AUTO_INCREMENT NOT NULL,
	shiptmentExpected DATE,
	shipmentReceived DATE,
	PRIMARY KEY shipmentID
	}
	
CREATE TABLE shipmentXinvoice{
	shipmentID INT NOT NULL,
	invoiceID INT NOT NULL,
	PRIMARY KEY (shipmentID,invoiceID),
	FOREIGN KEY shipmentID REFERENCES Shipment(shipmentID),
	FOREIGN KEY invoiceID REFERENCES Invoice(invoiceID)
	}