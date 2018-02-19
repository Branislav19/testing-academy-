#!/usr/bin/env bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
 
PASSWD=akadem13
LOGIN=akadem13

_query(){
 declare QUERY=$1 
echo "$QUERY" | sqlplus -S "$LOGIN"/"$PASSWD"@chinook @ config.sql
 }

#1
@test  "when imported, then number of genre is 19" {
assert_equal 19 $(_query "SELECT count(*) FROM genre;")
}

#2
@test "when imported, then genre is valid" {
assert_equal 0 $(_query "SELECT count (NAME) FROM GENRE WHERE NAME NOT IN ('Adventure', 'Animation', 'Children', 'Comedy', 'Fantasy', 'Romance', 'Drama', 'Action', 'Crime', 'Thriller', 'Horror', 'Mystery', 'Sci-Fi', 'Documentary', 'IMAX', 'War', 'Musical', 'Western', 'Film-Noir');")
}

#4
@test "when imported, then number of movie with genre Sci-Fi is 656" {
assert_equal 656 $(_query "SELECT COUNT(*) FROM genre g INNER JOIN movie_genre mg ON g.ID=mg.GENREID WHERE NAME = 'Sci-Fi';")

}


#5 
@test "when imported, then number of all films is 6973" {
assert_equal 6973 $(_query "SELECT COUNT(*) FROM movie;")
}


#7
@test "when imported, number of movies from 1984 is 70" {
assert_equal 70 $(_query "SELECT COUNT(*)  FROM movie WHERE YEAR = '1984';")
}

#8
@test "when imported, then number of all action movies from 1990 is 23" {
assert_equal 23 $(_query "SELECT COUNT (*) FROM genre g INNER JOIN movie_genre mg ON g.ID=mg.GENREID INNER JOIN movie m ON mg.MOVIEID=m.ID WHERE YEAR = '1990' AND NAME = 'Action';")
}

#9
@test "movie between select" {
VAR=$(_query "SELECT count(*) FROM movie WHERE year < 1915 OR year > 2015;")
VAR=$?
assert_equal "0" "$VAR"
}

#@test "movie between insert" {
#_query "commit;"
#_query "set trannsaction meno"
#ID=$(_query "SELECT movie seq.nextval from DUAL;")
#(_query "INSERT INTO movie VALUES(movies seq.nextval, 'super meno', $ID)")
#VAR=$(_query "SELECT count (*) from movie where ID like $ID;")
#assert_equal "$VAR" "0"
#}


@test "movie name 20 chars" {
VAR=$(_query "DESC movie;")
LINE=$(echo "$VAR" | egrep -i "title")
NUMBER=$(echo "$LINE" | egrep -oi "\([0-9]+\)")
assert_equal "$NUMBER" "(20)"
}
