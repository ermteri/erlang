%%%-------------------------------------------------------------------
%%% @author Torsten
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. apr 2018 14:12
%%%-------------------------------------------------------------------
-module(hello).
-author("Torsten").
-export([hello_world/2]).
hello_world(Name,Age)->io:fwrite("HEJ ~w, ~s\n",[Age,Name]).
%% API

