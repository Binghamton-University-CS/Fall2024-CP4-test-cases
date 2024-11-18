#!/usr/bin/env bash

# HOW TO RUN:
# 
# 1. Copy the bash file (cp4_test_helper.sh) and the expect file (interaction.exp) to the same directory as your executable (e.g., bin directory).
# 2. cd to the directory of your executable (e.g., bin directory).
# 3. Execute the following command: 
#    "bash cp4_test_helper.sh ./<executable> <testcase-number>"
# 4. Check if your program's output align with the 'EXPECTED OUTPUTS' output.

if [ $# -ne 2 ]; then
	echo "bash cp4_test_helper.sh ./<executable> <testcase-number>"
	exit 1
fi


# ================================================================================================
# Following are simple test cases for testing your program's overall functionality.

declare -A tests

# Test-case 1 : Add voter, call voted and support on the added voter
tests[1]="
voter Renolds Ryan 45
voter Renolds Ryan 45
voter Bird Earl 87
voted Bird Earl 87
support Renolds Ryan 25
quit
"

# Test-case 2 : Listen, favorite, and show listen time
tests[2]="
voter Lai Tulsi 16
voter Renolds Ryan 45
voter Bird Earl 87
voted Bird Earl 87
voted Bird Earl 87
support Renolds Ryan 25
quit
"

# ================================================================================================
# Expected outputs of above test-commands
declare -A expected_outputs

expected_outputs[1]="
[ Test-case 1 : Add voter, call voted and support on the added voter ]

New voter Ryan Renolds, age 45, added
Voter Ryan Renolds, age 45, already exists
New voter Earl Bird, age 87, added
Voter Earl Bird, age 87, voted
Support from Ryan Renolds increased by 25 strength points
"

expected_outputs[2]="
[ Test-case 2 : Incorrect inputs testing for a voter]

Voter age should be between 18 and 118
New voter Ryan Renolds, age 45, added
New voter Earl Bird, age 87, added
Voter Earl Bird, age 87, voted
Earl Bird already voted
Support from Ryan Renolds increased by 25 strength points
"



# INTERACTION
clear 
expect interaction.exp "$1" "${tests[$2]}" 2>&1
printf "\n\n--------- EXPECTED OUTPUTS (Don't have to be an exact match) --------- \n\n${expected_outputs[$2]}\n\n\n"


exit 0


