/*1*/
SELECT CompanyName AS"Société",ContactName AS"contact",
ContactTitle AS"Fonction",Phone AS"Téléphone" FROM customers
WHERE Country LIKE"France"

/*2*/
SELECT ProductName AS"Produit",UnitPrice AS"Prix" FROM Products
INNER JOIN Suppliers ON Suppliers.SupplierID=Products.SupplierID
WHERE companyname LIKE"exotic liquids"

/*3*/
SELECT companyname AS"Fournisseur",count(productname) AS"Nbre produits" FROM suppliers
INNER JOIN products ON products.SupplierID=suppliers.SupplierID
WHERE country LIKE"france"
GROUP BY companyname
ORDER BY count(productname) desc

/*4*/
SELECT companyname,COUNT(orderid) FROM customers
INNER JOIN orders ON orders.CustomerID=customers.CustomerID
WHERE country LIKE"france" 
GROUP BY companyname
HAVING COUNT(orderid)>10
ORDER BY companyname

/*5*/
SELECT companyname AS"Client",SUM(unitprice*quantity) AS"CA",country AS"Pays" FROM orders
INNER JOIN customers ON customers.CustomerID=orders.CustomerID
INNER JOIN order_details ON order_details.orderid=orders.orderid
GROUP BY companyname
HAVING SUM(unitprice*quantity)>30000
ORDER BY SUM(unitprice*quantity) desc

/*6*/
SELECT customers.Country AS"Pays" FROM customers
INNER JOIN orders ON orders.CustomerID=customers.CustomerID
JOIN order_details ON order_details.OrderID=orders.OrderID
JOIN products ON products.ProductID=order_details.ProductID
JOIN suppliers ON suppliers.SupplierID=products.SupplierID
WHERE suppliers.CompanyName LIKE"exotic liquids"
group BY customers.Country asc

/*7*/
SELECT SUM(unitprice*quantity) AS "Montant vente 97" FROM order_details
INNER JOIN orders ON orders.OrderID=order_details.OrderID
WHERE orders.OrderDate BETWEEN "1997-01-01 00:00:00" AND "1997-12-31-00:00:"

/*8*/
SELECT MONTH (orders.OrderDate) AS"mois", sum(unitprice*quantity) AS "Montant vente" FROM order_details
INNER JOIN orders ON orders.OrderID=order_details.OrderID
WHERE orders.OrderDate BETWEEN "1997-01-01 00:00:00" AND "1997-12-31-00:00:00"
GROUP BY mois

/*9*/
SELECT orders.OrderDate AS"date de derniere commande" FROM orders
INNER JOIN customers ON customers.CustomerID=orders.CustomerID
WHERE companyname LIKE"du monde entier"
GROUP BY orders.OrderDate DESC
LIMIT 1

/*10*/
SELECT TRUNCATE(AVG(TIMESTAMPDIFF(DAY, OrderDate, ShippedDate)), 0) AS "Délai moyen de livraison en jours"
 FROM orders