CREATE DATABASE PRIME;
USING PRIME;

CREATE TABLE Dish{
	dishID INT,
	dishName VARCHAR(40),
	dishPrice DECIMAL(13,2),
	dishDescription VARCHAR(200),
	PRIMARY KEY dishID
	}

CREATE TABLE dishXingredient{
	dishID INT,
	ingredientID INT,
	PRIMARY KEY (dishID,ingredientID),
	FOREIGN KEY dishID REFERENCES Dish(dishID),
	FOREIGN KEY ingredientID REFERENCES Ingredient(ingredientID)
	}

CREATE TABLE Ingredient{
	ingredientID INT,
	ingredientName VARCHAR(40),
	PRIMARY KEY ingredientID
	}

CREATE TABLE Product{
	productID INT,
	ingredientID INT,
	productName VARCHAR(40),
	merchantID VARCHAR(40),
	productQuantity INT,
	productCost DECIMAL(13,2),
	productSize INT,
	PRIMARY KEY productID,
	FOREIGN KEY ingredientID REFERENCES Ingredient(ingredientID),
	FOREIGN KEY merchantID REFERENCES Merchant(merchantID)
	}
	
CREATE TABLE productXmerchant{
	productID INT,
	merchantID INT,
	PRIMARY KEY (productID,merchantID),
	FOREIGN KEY productID REFERENCES product(productID),
	FOREIGN KEY merchantID REFERENCES merchant(merchantID)
	}
	
CREATE TABLE Merchant{
	merchantID INT,
	merchantName VARCHAR(40),
	}

CREATE TABLE Location{
	locationID INT,
	locationName VARCHAR(40),
	locationShelfCount INT,
	PRIMARY KEY locationID
	}

CREATE TABLE Shelf{
	shelfID INT,
	locationID INT,
	shelfLevels INT,
	PRIMARY KEY ShelfID,
	FOREIGN KEY locationID REFERENCES Location(locationID)
	}

CREATE TABLE Layer{
	layerNo INT,
	shelfID INT,
	PRIMARY KEY (shelfID,layerNo),
	FOREIGN KEY shelfID REFERENCES Shelf(shelfID)
	}
	
CREATE TABLE Slot{
	slotID INT,
	slotNo INT,
	layerNo INT,
	shelfID INT,
	PRIMARY KEY slotID,
	FOREIGN KEY layerNo REFERENCES Layer(layerNo),
	FOREIGN KEY shelfID REFERENCES Shelf(shelfID)

CREATE TABLE slotXproduct{
	slotID INT,
	productID INT,
	PRIMARY KEY (slotID,productID),
	FOREIGN KEY slotID REFERENCES Slot(slotID),
	FOREIGN KEY productID REFERENCES Product(productID)
	}
