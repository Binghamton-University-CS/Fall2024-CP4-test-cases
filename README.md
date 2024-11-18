## CP4 test helper script with some test-cases

1. Copy the bash file (cp4_test_helper.sh) and the expect file (interaction.exp) to the same directory as your executable (e.g., bin directory).

2. cd to the directory of your executable (e.g., bin directory).

3. Execute the following command (testcase information are available in cp4_tester.sh):  
    **bash cp4_test_helper.sh ./&lt;executable&gt; &lt;testcase-number&gt;**

4.  Check if your program's output align with the 'EXPECTED OUTPUTS' output (Doesn't have to be exact while recommended).

**Please note that these test cases might not cover all the scenarios for grading. Feel free to ask if you have any questions or concerns about them.**


- In case you encounter an "spawn id exp4 not open" error, it indicates that the test-helper script tried to interact with an already-terminated process (in this case, your executable's). It may likely be a segmentation fault of your program.