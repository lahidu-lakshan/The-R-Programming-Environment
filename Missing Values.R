Selection: 2

| Please choose a lesson, or type 0 to return to course menu.

1: Setting Up Swirl              2: Basic Building Blocks      
3: Sequences of Numbers          4: Vectors                    
5: Missing Values                6: Subsetting Vectors         
7: Matrices and Data Frames      8: Logic                      
9: Workspace and Files          10: Reading Tabular Data       
11: Looking at Data              12: Data Manipulation          
13: Text Manipulation Functions  14: Regular Expressions        
15: The stringr Package          

Selection: 5

|                                                                     |   0%

| Missing values play an important role in statistics and data analysis.
| Often, missing values must not be ignored, but rather they should be
| carefully studied to see if there's an underlying pattern or cause for their
| missingness.

...

  |===                                                                  |   5%
| In R, NA is used to represent any value that is 'not available' or 'missing'
| (in the statistical sense). In this lesson, we'll explore missing values
| further.

...

|=======                                                              |  10%
| Any operation involving NA generally yields NA as the result. To illustrate,
| let's create a vector c(44, NA, 5, NA) and assign it to a variable x.

> 
> x<- c(44, NA, 5, NA) 

| Great job!

  |==========                                                           |  15%
| Now, let's multiply x by 3.

> x*3
[1] 132  NA  15  NA

| You're the best!

  |==============                                                       |  20%
| Notice that the elements of the resulting vector that correspond with the NA
| values in x are also NA.

...

  |=================                                                    |  25%
| To make things a little more interesting, lets create a vector containing
| 1000 draws from a standard normal distribution with y <- rnorm(1000).

> y <- rnorm(1000)

| Keep up the great work!

  |=====================                                                |  30%
| Next, let's create a vector containing 1000 NAs with z <- rep(NA, 1000).

> z <- rep(NA, 1000)

| Keep up the great work!
  
  |========================                                             |  35%
| Finally, let's select 100 elements at random from these 2000 values
| (combining y and z) such that we don't know how many NAs we'll wind up with
| or what positions they'll occupy in our final vector -- my_data <-
  | sample(c(y, z), 100).

> my_data <-sample(c(y, z), 100)

| You are doing so well!
  
  |============================                                         |  40%
| Let's first ask the question of where our NAs are located in our data. The
| is.na() function tells us whether each element of a vector is NA. Call
| is.na() on my_data and assign the result to my_na.

> my_na<-is.na(my_data)

| Great job!

  |===============================                                      |  45%
| Now, print my_na to see what you came up with.

> my_na
  [1] FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE
 [13] FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
 [25] FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
 [37]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
 [49] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE
 [61]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
 [73]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE
 [85]  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE
 [97] FALSE FALSE  TRUE  TRUE

| Excellent work!

  |==================================                                   |  50%
| Everywhere you see a TRUE, you know the corresponding element of my_data is
| NA. Likewise, everywhere you see a FALSE, you know the corresponding element
| of my_data is one of our random draws from the standard normal distribution.

...

  |======================================                               |  55%
| In our previous discussion of logical operators, we introduced the `==`
| operator as a method of testing for equality between two objects. So, you
| might think the expression my_data == NA yields the same results as is.na().
| Give it a try.

> my_data == NA 
  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [25] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [49] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [73] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [97] NA NA NA NA

| That's correct!
  
  |=========================================                            |  60%
| The reason you got a vector of all NAs is that NA is not really a value, but
| just a placeholder for a quantity that is not available. Therefore the
| logical expression is incomplete and R has no choice but to return a vector
| of the same length as my_data that contains all NAs.

...

|=============================================                        |  65%
| Don't worry if that's a little confusing. The key takeaway is to be cautious
| when using logical expressions anytime NAs might creep in, since a single NA
| value can derail the entire thing.

...

|================================================                     |  70%
| So, back to the task at hand. Now that we have a vector, my_na, that has a
| TRUE for every NA and FALSE for every numeric value, we can compute the
| total number of NAs in our data.

...

|====================================================                 |  75%
| The trick is to recognize that underneath the surface, R represents TRUE as
| the number 1 and FALSE as the number 0. Therefore, if we take the sum of a
| bunch of TRUEs and FALSEs, we get the total number of TRUEs.

...

|=======================================================              |  80%
| Let's give that a try here. Call the sum() function on my_na to count the
| total number of TRUEs in my_na, and thus the total number of NAs in my_data.
| Don't assign the result to a new variable.

> sum(my_data)
[1] NA

| Nice try, but that's not exactly what I was hoping for. Try again. Or, type
| info() for more options.

| Use sum(my_na) to count the number NAs in the data.

> sum(my_na)
[1] 54

| You got it right!

  |===========================================================          |  85%
| Pretty cool, huh? Finally, let's take a look at the data to convince
| ourselves that everything 'adds up'. Print my_data to the console.

> my_data 
[1] -0.06393728          NA          NA          NA  0.62554830  0.37381763
[7] -1.30669590          NA -1.01378625          NA          NA -0.63277531
[13] -0.61779978  0.54726662          NA -1.33735064  1.26632304 -0.08985251
[19]          NA          NA  0.30954035          NA          NA          NA
[25]  1.10277933  0.86144446 -0.02848862          NA          NA          NA
[31]  1.01570117          NA          NA  0.47926389          NA          NA
[37]          NA          NA          NA          NA          NA  0.12532806
[43]          NA  0.83824052          NA  1.23858328  0.60653201  0.21388072
[49] -0.54061220  1.19970837  0.56158122          NA  0.50325859 -0.38622000
[55] -0.83442002 -0.22331694          NA          NA  0.14500065          NA
[61]          NA          NA          NA          NA -0.43884821 -0.24162151
[67]          NA -0.03318373          NA          NA          NA  0.22887576
[73]          NA          NA          NA -0.78826519          NA          NA
[79] -1.23788992          NA -1.85360190 -0.43760705          NA          NA
[85]          NA          NA  2.15319919          NA -1.00916161 -1.08121099
[91] -0.72286984          NA -0.44962829  1.77152705          NA          NA
[97] -1.27540355 -1.30724493          NA          NA

| You are really on a roll!
  
  |==============================================================       |  90%
| Now that we've got NAs down pat, let's look at a second type of missing
| value -- NaN, which stands for 'not a number'. To generate NaN, try dividing
| (using a forward slash) 0 by 0 now.

> 0/0
[1] NaN

| All that hard work is paying off!
  
  |==================================================================   |  95%
| Let's do one more, just for fun. In R, Inf stands for infinity. What happens
| if you subtract Inf from Inf?

> Inf-Inf
[1] NaN

| Nice work!

  |=====================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?

1: Yes
2: No
3: Generate Code