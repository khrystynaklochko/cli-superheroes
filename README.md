I am using yajl-ruby for parsing Json file, since I don't want to create instance objects and serialization and can query directly on a parsed set of objects. I decided not to create instance objects because the list of attributes for each card was not give, hence not important.

CLI tool which provide you following commands:
-cards-set A list of Cards grouped by set.
-cards-set-rarity A list of Cards grouped by set and within each set grouped by rarity.
-cards-ktk A list of cards from the Khans of Tarkir (KTK) set that ONLY have the colours red AND blue

To run use:

ruby main.rb <command>

Example:
ruby main.rb -cards-set 

By running following command you will receive a list of cards grouped by set.

Http connector class provides an ability to save json response in a file for later parsing.
Contains Tests.