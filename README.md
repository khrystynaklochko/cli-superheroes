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