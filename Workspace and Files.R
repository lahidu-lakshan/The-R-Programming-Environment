Selection: 9

|                                                                     |   0%

| In this lesson, you'll learn how to examine your local workspace in R and
| begin to explore the relationship between your workspace and the file system
| of your machine.

...

  |==                                                                   |   3%
| Because different operating systems have different conventions with regards
| to things like file paths, the outputs of these commands may vary across
| machines.

...

  |====                                                                 |   5%
| However it's important to note that R provides a common API (a common set of
                                                               | commands) for interacting with files, that way your code will work across
| different kinds of computers.

...

|=====                                                                |   8%
| Let's jump right in so you can get a feel for how these special functions
| work!

...

  |=======                                                              |  11%
| Determine which directory your R session is using as its current working
| directory using getwd().

> getwd()
[1] "E:/applide science degree/coursera/r/swirl/The-R-Programming-Environment"

| You're the best!
  
  |=========                                                            |  13%
| List all the objects in your local workspace using ls().

> ls()
[1] "ints"

| You got it right!
  
  |===========                                                          |  16%
| Some R commands are the same as their equivalents commands on Linux or on a
| Mac. Both Linux and Mac operating systems are based on an operating system
| called Unix. It's always a good idea to learn more about Unix!

...

  |=============                                                        |  18%
| Assign 9 to x using x <- 9.

> x <- 9

| You are quite good my friend!

  |===============                                                      |  21%
| Now take a look at objects that are in your workspace using ls().

> ls
function (name, pos = -1L, envir = as.environment(pos), all.names = FALSE, 
    pattern, sorted = TRUE) 
{
    if (!missing(name)) {
        pos <- tryCatch(name, error = function(e) e)
        if (inherits(pos, "error")) {
            name <- substitute(name)
            if (!is.character(name)) 
                name <- deparse(name)
            warning(gettextf("%s converted to character string", 
                sQuote(name)), domain = NA)
            pos <- name
        }
    }
    all.names <- .Internal(ls(envir, all.names, sorted))
    if (!missing(pattern)) {
        if ((ll <- length(grep("[", pattern, fixed = TRUE))) && 
            ll != length(grep("]", pattern, fixed = TRUE))) {
            if (pattern == "[") {
                pattern <- "\\["
                warning("replaced regular expression pattern '[' by  '\\\\['")
            }
            else if (length(grep("[^\\\\]\\[<-", pattern))) {
                pattern <- sub("\\[<-", "\\\\\\[<-", 
                  pattern)
                warning("replaced '[<-' by '\\\\[<-' in regular expression pattern")
            }
        }
        grep(pattern, all.names, value = TRUE)
    }
    else all.names
}
<bytecode: 0x00000277e14cdc90>
<environment: namespace:base>

| That's not exactly what I'm looking for. Try again. Or, type info() for more
| options.

| Type ls() to view all the objects in your workspace.

> ls()
[1] "ints" "x"   

| Great job!

  |================                                                     |  24%
| List all the files in your working directory using list.files() or dir().

> list.files() 
[1] "Logic.R"                             "The-R-Programming-Environment.Rproj"

| You're the best!
  
  |==================                                                   |  26%
| As we go through this lesson, you should be examining the help page for each
| new function. Check out the help page for list.files with the command
| ?list.files.

> ?list.files

| Excellent work!
  
  |====================                                                 |  29%
| One of the most helpful parts of any R help file is the See Also section.
| Read that section for list.files. Some of these functions may be used in
| later portions of this lesson.

...

|======================                                               |  32%
| Using the args() function on a function name is also a handy way to see what
| arguments a function can take.

...

|========================                                             |  34%
| Use the args() function to determine the arguments to list.files().

> args(list.files())
NULL

| One more time. You can do it! Or, type info() for more options.

| Type args(list.files) to see the arguments to list.files.

> args(list.files)
function (path = ".", pattern = NULL, all.files = FALSE, 
          full.names = FALSE, recursive = FALSE, ignore.case = FALSE, 
          include.dirs = FALSE, no.. = FALSE) 
  NULL

| You got it!
  
  |=========================                                            |  37%
| Assign the value of the current working directory to a variable called
| "old.dir".

> old.dir <- getwd()

| You're the best!

  |===========================                                          |  39%
| We will use old.dir at the end of this lesson to move back to the place that
| we started. A lot of query functions like getwd() have the useful property
| that they return the answer to the question as a result of the function.

...

  |=============================                                        |  42%
| Use dir.create() to create a directory in the current working directory
| called "testdir".

> dir.create("testdir")

| Keep up the great work!

  |===============================                                      |  45%
| We will do all our work in this new directory and then delete it after we
| are done. This is the R analog to "Take only pictures, leave only
| footprints."

...

  |=================================                                    |  47%
| Set your working directory to "testdir" with the setwd() command.

> setwd(testdir) 
Error in setwd(testdir) : object 'testdir' not found
> setwd("testdir")

| All that practice is paying off!

  |==================================                                   |  50%
| In general, you will want your working directory to be someplace sensible,
| perhaps created for the specific project that you are working on. In fact,
| organizing your work in R packages using RStudio is an excellent option.
| Check out RStudio at http://www.rstudio.com/

...

  |====================================                                 |  53%
| Create a file in your working directory called "mytest.R" using the
| file.create() function.

> file.create(mytest.R)
Error in file.create(mytest.R) : object 'mytest.R' not found
> file.create("mytest.R")
[1] TRUE

| That's the answer I was looking for.

|======================================                               |  55%
| This should be the only file in this newly created directory. Let's check
| this by listing all the files in the current directory.

> list.files()
[1] "mytest.R"

| All that practice is paying off!

  |========================================                             |  58%
| Check to see if "mytest.R" exists in the working directory using the
| file.exists() function.

> file.exists("mytest.R")
[1] TRUE

| Great job!

  |==========================================                           |  61%
| These sorts of functions are excessive for interactive use. But, if you are
| running a program that loops through a series of files and does some
| processing on each one, you will want to check to see that each exists
| before you try to process it.

...

  |============================================                         |  63%
| Access information about the file "mytest.R" by using file.info().

> file.info("mytest.R")
         size isdir mode               mtime               ctime
mytest.R    0 FALSE  666 2020-08-07 18:12:40 2020-08-07 18:12:40
                       atime exe
mytest.R 2020-08-07 18:12:40  no

| Nice work!

  |=============================================                        |  66%
| You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab
| specific items.

...

  |===============================================                      |  68%
| Change the name of the file "mytest.R" to "mytest2.R" by using
| file.rename().

> file.rename("mytest.R", "mytest2.R")
[1] TRUE

| That's the answer I was looking for.

|=================================================                    |  71%
| Your operating system will provide simpler tools for these sorts of tasks,
| but having the ability to manipulate files programatically is useful. You
| might now try to delete mytest.R using file.remove('mytest.R'), but that
| won't work since mytest.R no longer exists. You have already renamed it.

...

  |===================================================                  |  74%
| Make a copy of "mytest2.R" called "mytest3.R" using file.copy().

> file.copy("mytest2.R", "mytest3.R")
[1] TRUE

| That's the answer I was looking for.

|=====================================================                |  76%
| You now have two files in the current directory. That may not seem very
| interesting. But what if you were working with dozens, or millions, of
| individual files? In that case, being able to programatically act on many
| files would be absolutely necessary. Don't forget that you can, temporarily,
| leave the lesson by typing play() and then return by typing nxt().

...

  |======================================================               |  79%
| Provide the relative path to the file "mytest3.R" by using file.path().

> file.path("mytest3.R")
[1] "mytest3.R"

| Great job!

  |========================================================             |  82%
| You can use file.path to construct file and directory paths that are
| independent of the operating system your R code is running on. Pass
| 'folder1' and 'folder2' as arguments to file.path to make a
| platform-independent pathname.

> file.path("folder1", "folder2")
[1] "folder1/folder2"

| You got it right!

  |==========================================================           |  84%
| Take a look at the documentation for dir.create by entering ?dir.create .
| Notice the 'recursive' argument. In order to create nested directories,
| 'recursive' must be set to TRUE.

> ?dir.create

| Perseverance, that's the answer.

|============================================================         |  87%
| Create a directory in the current working directory called "testdir2" and a
| subdirectory for it called "testdir3", all in one command by using
| dir.create() and file.path().

> dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)

| You nailed it! Good job!
  
  |==============================================================       |  89%
| Go back to your original working directory using setwd(). (Recall that we
                                                             | created the variable old.dir with the full path for the orginal working
                                                             | directory at the start of these questions.)

> unlink('testdir2', recursive = TRUE)

| That's not exactly what I'm looking for. Try again. Or, type info() for more
| options.

| Use setwd(old.dir).

> setwd(old.dir)

| Great job!
  
  |================================================================     |  92%
| It is often helpful to save the settings that you had before you began an
| analysis and then go back to them at the end. This trick is often used
| within functions; you save, say, the par() settings that you started with,
| mess around a bunch, and then set them back to the original values at the
| end. This isn't the same as what we have done here, but it seems similar
| enough to mention.

...

  |=================================================================    |  95%
| Take nothing but results. Leave nothing but assumptions. That sounds like
| 'Take nothing but pictures. Leave nothing but footprints.' But it makes no
| sense! Surely our readers can come up with a better motto . . .

...

  |===================================================================  |  97%
| In this lesson, you learned how to examine your R workspace and work with
| the file system of your machine from within R. Thanks for playing!

...

  |=====================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?

1: Generate Code
2: No
3: Yes

Selection: 1
Submit the following code as the answer
to a quiz question on Coursera.

#########################

pUftcwzlHdBmRsXkTDrn

#########################

| Keep working like that and you'll get there!
  
  | You've reached the end of this lesson! Returning to the main menu...

| Please choose a course, or type 0 to exit swirl.

1: R Programming
2: The R Programming Environment
3: Take me to the swirl course repository!

Selection: