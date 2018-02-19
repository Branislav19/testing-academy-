#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

setup() {
export DIR=$(mktemp -du)
}

teardown() {
rm -rf "$DIR"
}


#TC1
@test "Test 1: when new folder with existing name is going to be created then error message is shown" {
    # setup

    mkdir "$DIR"
    run mkdir "$DIR"
    assert_equal [ $(output) "output" "mkdir: cannot create directory '$DIR': File exists" ]
    rmdir "DIR"    
    # test teardown
   
}



#TC2
@test "Test 2: when i create folder then folder is created" {
    # setup
    DIR=dirx
    mkdir ${DIR}
    mkdir ${DIR} && [[ -d ${DIR} ]] && [[ $(ls -a ${DIR} | wc -l) -eq 2 ]] || echo "failed: when i create new folder then folder is created"
    # test teardown
    rmdir ${DIR}
}


#TC3
@test "Test 3: when i create folder in bad directory then error" {
    # setup
    DIR="/bin"
     
    [[ $(mkdir ${DIR} 2>&1) = "mkdir: cannot create directory '${DIR}': No such file or directory" ]]

    # test teardown
}



#TC4
@test "Test 4: when i create folder has 0Kb then is error shown" {
    # setup
    DIR=dirx
    mkdir ${DIR}
    mkdir ${DIR} && [[ -d ${DIR} ]] && [[ $(du -hs ${DIR} | wc -l) -eq 0 ]] || echo "failed: when i create folder has 0Kb then is error shown"

    # test teardown
    rmdir ${DIR}
}



#TC5
@test "Test 5: when i create folder without name then is error shown" {
     # setup
     DIR=badname

     mkdir ${DIR} && [[ -d ${DIR} ]] || echo "failed: when i create folder without name is error shown"         

    # test teardown
    rmdir ${DIR}
}    

#TC6
@test "Test 6: when i create folder with long name then error shown" {
      # setup
    $DIR='aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
run mkdir "$DIR"
 assert_equal [ $(mkdir ${DIR} 2>&1) = "failed: File name too long" ] 
      # teardown
}




@test "when unknown option is given , then show error message" {
run mkdir -x
assert_equal "$output" "mkdir: invalid option -- 'x'
 Try 'mkdir-- help' for more information."  
}


@test "when new folder is created, then folder with given name exists" {
run mkdir "$DIR"
assert [ -d "$DIR" ] # test if new folder exists
}




@test "when new folder is created, then it is empty" {
  # setup
 mkdir ${DIR}
 [[ $(ls -a ${DIR} | wc -l ) -eq 2 ]]

  #teardown
 rmdir ${DIR}
 }

