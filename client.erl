-module(client).
-export([client/0]).
client() ->
    {ok,S} = gen_tcp:connect({127,0,0,1}, 5678,[binary, {active,true}]),
    Message = "Hello world!",
    io:fwrite("Sending ~s~n",[Message]),
    gen_tcp:send(S,Message),
    gen_tcp:close(S),
    exit(0).
