#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

PASSWD=akadem13
LOGIN=akadem13

#zadefinovanie QUERY hned na zaciatku , zjednodu3enie testov
_query(){
 declare QUERY=$1 #parameter "SELECT FROM to bude brat z  riadku ktory je v teste
 echo "$QUERY" | sqlplus -S "$LOGIN"/"$PASSWD"@chinook @ config.sql
 }




@test "when imported, then number of tracks is 3505" {
#QUERY="SELECT count(*) FROM track;" toto iba presunieme o riadok nizsie
assert_equal 3505 $(_query "SELECT count(*) FROM track;") # uz to netreba pisat lebo to berie y horneho riadku ktor7 sme si napisali  echo "$QUERY" | sqlplus -S "$LOGIN"/"$PASSWD"@chinook @ config.sql)

}

@test "when imported, then number of albums is xxx" {
QUERY="SELECT count (*) FROM album;"  
assert_equal 347  $(echo "$QUERY" | sqlplus -S "$LOGIN"/"$PASSWD"@chinook @config.sql)
}

@test "when imported, then number of customers  is 59" {
QUERY="SELECT count (*) FROM customer;"
assert_equal 59 $(echo "$QUERY" | sqlplus -S "$LOGIN"/"$PASSWD"@chinook @config.sql)

}

@test "when imported, then number of employee is 8" {
assert_equal 8 $(_query "SELECT count(*) FROM employee;")
}

@test "when imported, then number of artist is 275" {
assert_equal 275 $(_query "SELECT count(*) FROM artist;")
}



@test "when imported, then number of songs in Heavy Metal Classic playlist is 26" {
assert_equal 26 $(_query "SELECT COUNT (*) FROM TRACK tr INNER JOIN PLAYLISTTRACK ON tr.TRACKID=playlisttrack.TRACKID INNER JOIN PLAYLIST ON playlist.PLAYLISTID=playlisttrack.PLAYLISTID AND playlist.NAME = 'Heavy Metal Classic';")
}


@test "when imported, then no invoice has total less or equals to 0" {
assert_equal 0 $(_query "SELECT count(*) FROM INVOICE WHERE TOTAL < 0;")
}

@test "when imported, then we have 5 specific media types" {
assert_equal 0 $(_query "SELECT count(*) FROM MEDIATYPE WHERE name NOT IN ('MPEG audio file', 'Protected AAC audio file', 'Protected MPEG-4 video file', 'Purchased AAC audio file', 'AAC audio file');")
}

@test "when imported, then country is valid" {
assert_equal 0 $(_query "SELECT count (COUNTRY) FROM CUSTOMER WHERE COUNTRY NOT IN('Brazil','Denmark','Ireland','Poland','United Kingdom','Chile','Norway','Austria','Germany','USA','France','Finland','Spain','India','Hungary','Australia','Canada','Belgium','Czech Republic','Sweden','Argentina','Portugal','Italy','Netherlands');")
}





@test "when imported, then number of mediatypes is 5" { 
assert_equal 5 $(_query "SELECT COUNT (*) FROM MEDIATYPE;")
}

#@test "when imported, then mediatype is MPEG audio file" {
#assert_equal 0 $(_query "SELECT * FROM MEDIATYPE WHERE MEDIATYPE = 1;")
#}


@test "when imported, then firstname is valid" {
for ENTRY in $(_query "SELECT FIRSTNAME FROM CUSTOMER;");do
assert_equal $ENTRY $(echo $ENTRY | egrep -o "^\"([A-Z][a-z0-9]+)\"$")

done
}


@test "when imported, then lastname is valid" {
for ENTRY in $(_query "SELECT LASTNAME FROM CUSTOMER;");do
assert_equal $ENTRY $(echo $ENTRY | egrep -o "^\"([A-Z][a-z0-9]+)\"$")
  
 done
}



@test "When imported, char value should be minimal 150" {
 assert_equal 1 $(_query "INSERT INTO TRACK (TRACKID, NAME, ALBUMID, MEDIATYPEID, GENREID, COMPOSER, MILLISECONDS, BYTES, UNITPRICE)
VALUES ('3504','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeew', '243','1', '1' , 'Patko Vrbovsky' , '222222', '6666666', '0.99'); 
SELECT COUNT(*) t.NAME FROM track.t
GROUP BY t.NAME
HAVING max(LENGHT(t.Name))>=150;
ROLLBACK";)


}
  


@test "check if bytes must be set" {
VAR=$(_query "SELECT MAX(TRACKID) +1 FROM TRACK";)
TRACK=$(_query "INSERT INTO TRACK (TRACKID, NAME, ALBUMID, MEDIATYPEID, GENREID, COMPOSER, MILLISECONDS, UNITPRICE) VALUES ('3503','Rockstar', '243','1', '1' , 'Ego' , '222222', '0.99')");
assert_equal [ ! "$TRACK"= ""]
}


@test "when sequence doesnt exists, then ok" {
QUERY=$(_query "SELECT track_seq.nextval FROM DUAL;")
assert [ ! "$QUERY" = "" ]

}



@test "When unitprice has default value, then ok" {

UNITPRICE=$(_query "SELECT UNITPRICE  FROM TRACK WHERE UNITPRICE = '2';")
TRACKID=$(_query "SELECT MAX(TRACKID) +1 FROM TRACK";)
QUERY=$(_query "INSERT INTO TRACK (TRACKID, NAME, ALBUMID, MEDIATYPEID, GENREID, COMPOSER, BYTES, MILLISECONDS, UNITPRICE) VALUES ('3506','Rockstar', '243','1','1','wewqeqw','222222','666666', '2');") 


assert_equal 2  "$UNITPRICE" 
}


