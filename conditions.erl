-module(conditions).

-export([print/0,print2/0,echo/0,doubleD/1,echo/1]).

echo()->
    io:fwrite("~w~n",[print()]).

echo(T)->
    io:fwrite("~w~n",[doubleD(T)]).

print()->
    People = [{torsten,arsta,64},{ming,lidingo,60},{mattias,svedmyra,25},{stewe,arsta,50}],
    [{Name,Age} || {Name,Place,Age}<-People,(Place==arsta) or (Age>=60)].

print2()->
    RestaurantMenu = [{steak, 5.99}, {beer, 3.99}, {poutine, 3.50}, {kitten, 20.99}, {water, 0.00}],
    [{Item, Price*1.07} || {Item, Price} <- RestaurantMenu, Price >= 3, Price =< 10].

doubleD([H|T])->
    [2*H|doubleD(T)];
doubleD([])->
    [].
