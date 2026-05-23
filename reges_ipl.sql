use ipl_practice_db;
select * from players;

# Show all players whose name starts with S.
select player_name from players where player_name regexp "^[Ss]";

# Show all players whose name starts with R.
select player_name from players where player_name regexp "^[Rr]";

# Show all players whose name ends with n.
select player_name from players where player_name regexp "[Nn]$";

# Show all players whose name ends with a.
select player_name from players where player_name regexp "[Aa]$";

# Show all players whose name contains the letter k.
select player_name from players where player_name regexp "[k]";

# Show all players whose name contains sh.
select player_name from players where regexp_like(player_name, "sh", "c");

# Show all players whose name contains Khan.
select player_name from players where player_name regexp "[Kk]han";

# Show all players whose name contains either Virat, Rohit, or Dhoni.
select player_name from players where player_name regexp "Virat|Rohit|Dhoni";

# Show all players whose first name starts with A.
select player_name from players where player_name regexp "^A";

# Show all players whose last name starts with P.
select player_name from players where player_name regexp "^P";

# Show all players whose name contains double letters, like ll, rr, tt, etc.
select player_name from players where player_name regexp "(.)\\1";

# Show all players whose name contains only alphabets and spaces.
select player_name from players where player_name regexp "^[A-Za-z ]*$";

# Show all players whose name has more than 12 characters.
select player_name from players where length(player_name) > 12;

# Show all teams whose team name starts with Mumbai.
select team_name from teams where team_name regexp "^Mumbai";

# Show all teams whose team name contains the word Kings.
select team_name from teams where team_name regexp "Kings";

# Show all teams whose team name ends with s.
select team_name from teams where team_name regexp "s$";

# Show all teams whose short name has exactly 3 letters.
select short_name from teams where short_name regexp "^[A-Za-z]{3}$";

# Show all teams whose short name starts with R.
select short_name from teams where short_name regexp "^R";
