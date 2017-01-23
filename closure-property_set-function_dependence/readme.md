goal: to get closure of property set and function dependence according to algorithm in database class  

1) to calculate closure of property set  

specific requirements:  
1. User inputs function dependence and input ends in 'End'  
2. The format of function dependence is like: AB->C, A->BE, etc..  
To simplify, we assume that every property is denoted as capital letter from A to Z.  
3. After user finishes input of all function dependence, display a hint 'please input property set to get closure' on screen.</br>
We need to calculate the corresponding closure when user inputs 1 or more properties.</br>
e.g. When user inputs A, we show the value of 'A+'. When user inputs AB, we show the value of 'AB+'.</br>
Repeat displaying a hint 'please input property set to get closure' until user inputs 'END'</br></br>

2) Based on the algorithm of calculating closure of property set above, calculate and display the closure of function dependence(denote as F+) user inputs</br></br>

command line interface</br>
language: C++</br>
