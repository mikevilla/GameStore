"GameStore App"
by Mike Villa Sept 2010

[Setup]
1) create gamestore_developement database in MySQL
2) update the database.yml file to use newly created database and enter credentials to access 
3) rake db:migrate
- run db:migrate in order to create the schema in the database
4) rake db:fixtures:load
- load the sample data into the database
5) ruby script/server
start Rails application



[FrontPage - List of Games to purchase ] http://localhost:3000/home
1) Hit http://localhost:3000/home to see the list of games that you can add to the cart
2) Click "Add to Cart" button to add game to the shopping cart.
3) Brings you to http://localhost:3000/home/show_cart where you can either 
- continue shopping
- remove items from your cart
- empty the entire cart
- continue to checkout

* you can also keep adding the same item and it will increment the "Qty". You can also decrement the qty of items.

[Administration Page]
http://localhost:3000/admin/menu


604.496.2487


What is REST Routing (New, update, delete )
method_missing
closure - underling ideas for jquery
what is a namespace
inner join outer join



Get a
- github account
- rails 3.x just jump into Rails 3.x learn all of the new features