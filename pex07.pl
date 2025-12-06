% pex5.pl
% USAFA UFO Sightings 2024
%
% name: John Halcli
%
% Documentation: I used HW 7 to help with this.
%
day(tuesday).
day(wednesday).
day(thursday).
day(friday).

cadet(smith).
cadet(garcia).
cadet(chen).
cadet(jones).

ufo(weather_balloon).
ufo(kite).
ufo(fighter_aircraft).
ufo(cloud).

solve :-
cadet(TuesCadet), cadet(WedCadet), cadet(ThursCadet), cadet(FriCadet),
all_different([TuesCadet, WedCadet, ThursCadet, FriCadet]),

ufo(TuesUfo), ufo(WedUfo), ufo(ThursUfo), ufo(FriUfo),
all_different([TuesUfo, WedUfo, ThursUfo, FriUfo]),

Triples = [ [tuesday, TuesCadet, TuesUfo],
[wednesday, WedCadet, WedUfo],
[thursday, ThursCadet, ThursUfo],
[friday, FriCadet, FriUfo] ],

% 1. C4C Smith did not see a weather balloon, nor kite.
\+ member([_, smith, weather_balloon], Triples),
\+ member([_, smith, kite], Triples),

% 2. The one who saw the kite isn’t C4C Garcia.
\+ member([_, garcia, kite], Triples),

% 3. Friday’s sighting was made by either C4C Chen or the one who saw the fighter aircraft.
(   member([friday, chen, _], Triples);
member([friday, _, fighter_aircraft], Triples)),

% 4. The kite was not sighted on Tuesday.
\+ member([tuesday, _, kite], Triples),

% 5. Neither C4C Garcia nor C4C Jones saw the weather balloon.
\+ member([_, garcia, weather_balloon], Triples),
\+ member([_, jones, weather_balloon], Triples),

% 6. C4C Jones did not make their sighting on Tuesday.
\+ member([tuesday, jones, _], Triples),
    
% 7. C4C Smith saw an object that turned out to be a cloud.
member([_, smith, cloud], Triples),

% 8. The fighter aircraft was spotted on Friday.
member([friday, _, fighter_aircraft], Triples),   
    
% 9. The weather balloon was not spotted on Wednesday.
\+ member([wednesday, _, weather_balloon], Triples), 
    
tell(tuesday, TuesCadet, TuesUfo),
tell(wednesday, WedCadet, WedUfo),
tell(thursday, ThursCadet, ThursUfo),
tell(friday, FriCadet, FriUfo).

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :-
write('On '), write(X), write(' C4C '), write(Y),
write(' saw the '), write(Z), write('.'), nl.
% The query to get the answer(s) or that there is no answer
% ?- solve.


