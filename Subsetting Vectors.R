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

Selection: 6

|                                                                     |   0%

| In this lesson, we'll see how to extract elements from a vector based on
| some conditions that we specify.

...

  |==                                                                   |   3%
| For example, we may only be interested in the first 20 elements of a vector,
| or only the elements that are not NA, or only those that are positive or
| correspond to a specific variable of interest. By the end of this lesson,
| you'll know how to handle each of these scenarios.

...

|====                                                                 |   5%
| I've created for you a vector called x that contains a random ordering of 20
| numbers (from a standard normal distribution) and 20 NAs. Type x now to see
| what it looks like.

> x
 [1]          NA          NA          NA          NA  2.30488914  1.26806145
 [7]          NA          NA          NA  2.07279379 -0.94591269 -0.15111388
[13]          NA          NA          NA  0.02894584          NA -0.20082575
[19]  0.89996680  1.24079631  0.46651722 -0.83184729          NA          NA
[25]          NA  0.78894808 -1.50105694  0.02681853  0.18154125          NA
[31]  0.08417625 -1.37909628  0.57214369  0.13839234          NA          NA
[37]          NA -0.02850521          NA          NA

| Perseverance, that's the answer.

|=====                                                                |   8%
| The way you tell R that you want to select some particular elements (i.e. a
                                                                       | 'subset') from a vector is by placing an 'index vector' in square brackets
| immediately following the name of the vector.

...

|=======                                                              |  10%
| For a simple example, try x[1:10] to view the first ten elements of x.

> x[1:10] 
[1]       NA       NA       NA       NA 2.304889 1.268061       NA       NA
[9]       NA 2.072794

| That's correct!

  |=========                                                            |  13%
| Index vectors come in four different flavors -- logical vectors, vectors of
| positive integers, vectors of negative integers, and vectors of character
| strings -- each of which we'll cover in this lesson.

...

|===========                                                          |  15%
| Let's start by indexing with logical vectors. One common scenario when
| working with real-world data is that we want to extract all elements of a
| vector that are not NA (i.e. missing data). Recall that is.na(x) yields a
| vector of logical values the same length as x, with TRUEs corresponding to
| NA values in x and FALSEs corresponding to non-NA values in x.

...

  |============                                                         |  18%
| What do you think x[is.na(x)] will give you?

1: A vector of all NAs
2: A vector of length 0
3: A vector of TRUEs and FALSEs
4: A vector with no NAs

Selection: 1

| Nice work!

  |==============                                                       |  21%
| Prove it to yourself by typing x[is.na(x)].

> x[is.na(x)]
 [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

| You are amazing!

  |================                                                     |  23%
| Recall that `!` gives us the negation of a logical expression, so !is.na(x)
| can be read as 'is not NA'. Therefore, if we want to create a vector called
| y that contains all of the non-NA values from x, we can use y <-
| x[!is.na(x)]. Give it a try.

> y <-x[!is.na(x)]

| All that hard work is paying off!

  |==================                                                   |  26%
| Print y to the console.

> y
 [1]  2.30488914  1.26806145  2.07279379 -0.94591269 -0.15111388  0.02894584
 [7] -0.20082575  0.89996680  1.24079631  0.46651722 -0.83184729  0.78894808
[13] -1.50105694  0.02681853  0.18154125  0.08417625 -1.37909628  0.57214369
[19]  0.13839234 -0.02850521

| Nice work!

  |===================                                                  |  28%
| Now that we've isolated the non-missing values of x and put them in y, we
| can subset y as we please.

...

|=====================                                                |  31%
| Recall that the expression y > 0 will give us a vector of logical values the
| same length as y, with TRUEs corresponding to values of y that are greater
| than zero and FALSEs corresponding to values of y that are less than or
| equal to zero. What do you think y[y > 0] will give you?
  
  1: A vector of all the positive elements of y
2: A vector of TRUEs and FALSEs
3: A vector of length 0
4: A vector of all the negative elements of y
5: A vector of all NAs

Selection: 1

| You nailed it! Good job!
  
  |=======================                                              |  33%
| Type y[y > 0] to see that we get all of the positive elements of y, which
| are also the positive elements of our original vector x.

> y[y > 0]
[1] 2.30488914 1.26806145 2.07279379 0.02894584 0.89996680 1.24079631
[7] 0.46651722 0.78894808 0.02681853 0.18154125 0.08417625 0.57214369
[13] 0.13839234

| Excellent work!
  
  |=========================                                            |  36%
| You might wonder why we didn't just start with x[x > 0] to isolate the
| positive elements of x. Try that now to see why.

> x[x > 0]
 [1]         NA         NA         NA         NA 2.30488914 1.26806145
 [7]         NA         NA         NA 2.07279379         NA         NA
[13]         NA 0.02894584         NA 0.89996680 1.24079631 0.46651722
[19]         NA         NA         NA 0.78894808 0.02681853 0.18154125
[25]         NA 0.08417625 0.57214369 0.13839234         NA         NA
[31]         NA         NA         NA

| Excellent work!

  |===========================                                          |  38%
| Since NA is not a value, but rather a placeholder for an unknown quantity,
| the expression NA > 0 evaluates to NA. Hence we get a bunch of NAs mixed in
| with our positive numbers when we do this.

...

  |============================                                         |  41%
| Combining our knowledge of logical operators with our new knowledge of
| subsetting, we could do this -- x[!is.na(x) & x > 0]. Try it out.

> x[!is.na(x) & x > 0]
 [1] 2.30488914 1.26806145 2.07279379 0.02894584 0.89996680 1.24079631
 [7] 0.46651722 0.78894808 0.02681853 0.18154125 0.08417625 0.57214369
[13] 0.13839234

| That's a job well done!
  
  |==============================                                       |  44%
| In this case, we request only values of x that are both non-missing AND
| greater than zero.

...

|================================                                     |  46%
| I've already shown you how to subset just the first ten values of x using
| x[1:10]. In this case, we're providing a vector of positive integers inside
| of the square brackets, which tells R to return only the elements of x
| numbered 1 through 10.

...

|==================================                                   |  49%
| Many programming languages use what's called 'zero-based indexing', which
| means that the first element of a vector is considered element 0. R uses
| 'one-based indexing', which (you guessed it!) means the first element of a
| vector is considered element 1.

...

  |===================================                                  |  51%
| Can you figure out how we'd subset the 3rd, 5th, and 7th elements of x? Hint
| -- Use the c() function to specify the element numbers as a numeric vector.

> x[c(3,5,7)]
[1]       NA 2.304889       NA

| You are really on a roll!
  
  |=====================================                                |  54%
| It's important that when using integer vectors to subset our vector x, we
| stick with the set of indexes {1, 2, ..., 40} since x only has 40 elements.
| What happens if we ask for the zeroth element of x (i.e. x[0])? Give it a
| try.

> x[0]
numeric(0)

| That's the answer I was looking for.

|=======================================                              |  56%
| As you might expect, we get nothing useful. Unfortunately, R doesn't prevent
| us from doing this. What if we ask for the 3000th element of x? Try it out.

> x[3000]
[1] NA

| You are doing so well!

  |=========================================                            |  59%
| Again, nothing useful, but R doesn't prevent us from asking for it. This
| should be a cautionary tale. You should always make sure that what you are
| asking for is within the bounds of the vector you're working with.

...

  |==========================================                           |  62%
| What if we're interested in all elements of x EXCEPT the 2nd and 10th? It
| would be pretty tedious to construct a vector containing all numbers 1
| through 40 EXCEPT 2 and 10.

...

|============================================                         |  64%
| Luckily, R accepts negative integer indexes. Whereas x[c(2, 10)] gives us
| ONLY the 2nd and 10th elements of x, x[c(-2, -10)] gives us all elements of
| x EXCEPT for the 2nd and 10 elements.  Try x[c(-2, -10)] now to see this.

> x[c(-2, -10)] 
[1]          NA          NA          NA  2.30488914  1.26806145          NA
[7]          NA          NA -0.94591269 -0.15111388          NA          NA
[13]          NA  0.02894584          NA -0.20082575  0.89996680  1.24079631
[19]  0.46651722 -0.83184729          NA          NA          NA  0.78894808
[25] -1.50105694  0.02681853  0.18154125          NA  0.08417625 -1.37909628
[31]  0.57214369  0.13839234          NA          NA          NA -0.02850521
[37]          NA          NA

| You are amazing!
  
  |==============================================                       |  67%
| A shorthand way of specifying multiple negative numbers is to put the
| negative sign out in front of the vector of positive numbers. Type x[-c(2,
                                                                          | 10)] to get the exact same result.

> x[-c(2, 10)]
[1]          NA          NA          NA  2.30488914  1.26806145          NA
[7]          NA          NA -0.94591269 -0.15111388          NA          NA
[13]          NA  0.02894584          NA -0.20082575  0.89996680  1.24079631
[19]  0.46651722 -0.83184729          NA          NA          NA  0.78894808
[25] -1.50105694  0.02681853  0.18154125          NA  0.08417625 -1.37909628
[31]  0.57214369  0.13839234          NA          NA          NA -0.02850521
[37]          NA          NA

| Nice work!
  
  |================================================                     |  69%
| So far, we've covered three types of index vectors -- logical, positive
| integer, and negative integer. The only remaining type requires us to
| introduce the concept of 'named' elements.

...

  |==================================================                   |  72%
| Create a numeric vector with three named elements using vect <- c(foo = 11,
| bar = 2, norf = NA).

> vect <- c(foo = 11,bar = 2, norf = NA)

| All that practice is paying off!

  |===================================================                  |  74%
| When we print vect to the console, you'll see that each element has a name.
| Try it out.

> vect
foo  bar norf 
11    2   NA 

| Excellent job!
  
  |=====================================================                |  77%
| We can also get the names of vect by passing vect as an argument to the
| names() function. Give that a try.

> names(vect) 
[1] "foo"  "bar"  "norf"

| Perseverance, that's the answer.

  |=======================================================              |  79%
| Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA). Do
| that now.

> vect2 <-c(11, 2, NA)

| Excellent work!

  |=========================================================            |  82%
| Then, we can add the `names` attribute to vect2 after the fact with
| names(vect2) <- c("foo", "bar", "norf"). Go ahead.

> names(vect2) <- c("foo", "bar", "norf")

| Keep up the great work!

  |==========================================================           |  85%
| Now, let's check that vect and vect2 are the same by passing them as
| arguments to the identical() function.

> identical(vect,vect2 )
[1] TRUE

| You are quite good my friend!
  
  |============================================================         |  87%
| Indeed, vect and vect2 are identical named vectors.

...

|==============================================================       |  90%
| Now, back to the matter of subsetting a vector by named elements. Which of
| the following commands do you think would give us the second element of
| vect?
  
  1: vect[bar]
2: vect["2"]
3: vect["bar"]

Selection: 2

| Keep trying!
  
  | If we want the element named "bar" (i.e. the second element of vect), which
| command would get us that?
  
  1: vect["bar"]
2: vect["2"]
3: vect[bar]

Selection: 1

| That's the answer I was looking for.

  |================================================================     |  92%
| Now, try it out.

> vect["bar"]
bar 
  2 

| Keep working like that and you'll get there!
  
  |=================================================================    |  95%
| Likewise, we can specify a vector of names with vect[c("foo", "bar")]. Try
| it out.

> vect[c("foo", "bar")]
foo bar 
11   2 

| Excellent work!
  
  |===================================================================  |  97%
| Now you know all four methods of subsetting data from vectors. Different
| approaches are best in different scenarios and when in doubt, try it out!
  
  ...

|=====================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?
  
  1: Yes
2: No
3: Generate Code
