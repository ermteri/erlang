-module(server).
-export([start/0]).
start() ->
    io:fwrite("Starting~n",[]),
    {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0}, 
                                        {active, false}]),
    waitconnect(LSock),
    ok = gen_tcp:close(LSock).

waitconnect(ListenSock) ->
    {ok, Sock} = gen_tcp:accept(ListenSock),
    io:fwrite("New connection: ~w~n",[Sock]),
    spawn(fun() -> do_recv(Sock, [])
    end),
    waitconnect(ListenSock).

do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            io:fwrite("~s~n",[B]),
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            ok = gen_tcp:close(Sock),
            {ok, list_to_binary(Bs)}
    end.
