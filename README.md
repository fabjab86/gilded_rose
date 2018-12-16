# Gilded Rose Project

This is a project and set of resources designed to help you learn good object
oriented design principles.

Given a codebase for a shop inventory system, that is completely functional and tested.
Improve the design of the codebase.



## The Shop

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime
location in a prominent city ran by a friendly innkeeper named Allison. We also
buy and sell only the finest goods. Unfortunately, our goods are constantly
degrading in quality as they approach their sell by date. We have a system in
place that updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add new
features to our system so that we can begin selling new categories of items.
First an introduction to our system:

* All items have a `sell_in` value which denotes the number of days we have to sell
  the item
* All items have a `quality` value which denotes how valuable the item is
* At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, `quality` degrades twice as fast
* The `quality` of an item is never negative
* "Aged Brie" actually increases in `quality` the older it gets
* The `quality` of an item is never more than 50
* "Sulfuras", being a legendary item, never has to be sold or decreases in
  `quality`
* "Backstage passes", like aged brie, increases in `quality` as its `sell_in` value approaches; `quality` increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but `quality` drops to 0 after the concert
* Just for clarification, an item can never have its Quality increase above 50,
however "Sulfuras" is a legendary item and as such its Quality is 80 and it
never alters.


### The first new feature

We have recently signed a supplier of conjured items. This requires an update to
our system:

* "Conjured" items degrade in `quality` twice as fast as normal items

### How to use

`git clone https://github.com/fabjab86/gilded_rose.git`
Open interactive Ruby Shell (IRB or irb) or pry   
`irb` or `pry`  
`require './lib/gilded_rose.rb'`  
`require './lib/generalitems.rb'`  
`require './lib/conjured.rb'`  
`gi = GeneralItems.new("Some general item",7,7)`  
`conj = Conjured.new("what is this", 8, 8)`  
`gilded = GildedRose.new([gi, conj])`   
`gilded.update_quality`  

> Or you can do it individually  

`require './lib/generalitems.rb'`  
`require './lib/conjured.rb'`  
`gi = GeneralItems.new("Some general item",7,7)`  
`conj = Conjured.new("what is this", 8, 8)`  
`gi.update_item`  
`conj.update_item`  



### How to test

`rspec`  
