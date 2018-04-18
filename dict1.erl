-module(dict1).
-export([new/0,store/3,find/2,erase/2]).

new()->
    [].

store(Name,Age,Dictionary)->
    Dictionary ++[{Name,Age}].

find(Name,[{N,A}|T]) when N /= Name ->
    find(Name,T);
find(Name,[{N,A}|T]) when N == Name ->
    A;
find(Name,[])->
    error.

erase(Name,Dictionary)->
    Dictionary -- [{Name,find(Name,Dictionary)}].
