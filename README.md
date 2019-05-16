# microhardairlines

Feature Demonstration video: https://www.youtube.com/watch?v=YdtBB1Jvo0Q

Final year student group project. A web application for a commercial airline. This project was made by three final year university students; 
Paul Sweeney, Dean Farrelly and Gerard Hoey.

To run the project, use the database "microhard_airlines.sql" located in microhard_airlines\src\java\SQL.

To test administration features, change "privileges" field to 2 in your database editor after registering.

To test paying by card, use a fake card number that starts with 4 and is 16 numbers long, any valid date, and any 3 numbers for CVV.

To testing paying with PayPal (the application uses PayPal's developer sandbox, so all payments are fake), sign into PayPal with fake 
account username "paulsweeney98-buyer@gmail.com" with password "Password1".

Features:
The entire web application is available in both English and French.
A user can search for flights, book flights, book checked 
baggage for their flights, pay with either a credit/debit card or by PayPal (using PayPal API).
A user can also check into their flight using a specially designed check in page, and view their boarding passes for flights (each with a 
uniquely generated and working QR code).
The application also has the standard log in and register functions (all sensitive information is encrypted using Bcrypt), and a user can 
view their profile information and change it.
If a user forgets their password, they can answer the security question they set up when they registered.

There are a lot of features for administrators also, an administrator can add a flight, change flight details, remove a flight or even 
suspend a user's account.
An administrator can also archive all expired flights.
