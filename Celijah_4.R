

# Assignment4_Heart Start Production_Celijah_4.R


library(lpSolveAPI)

lprec <- read.lp("HS4.lp")

solve(lprec)

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec)


# make an lp object with 0 constraints and 6 decision variables
lprec <- make.lp(0, 6)

# Now create the objective function. The default is a minimization problem. 
set.objfn(lprec, c(622, 614, 630, 641, 645, 649))

# As the default is a minimization problem, don't change the direction to maximization
lp.control(lprec,sense='min')

# Add the plant and capacity constraints
add.constraint(lprec, c(1, 0, 0, 1, 0, 0), ">=", 80)
add.constraint(lprec, c(0, 1, 0, 0, 1, 0), ">=", 60)
add.constraint(lprec, c(0, 0, 1, 0, 0, 1), ">=", 70)
add.constraint(lprec, c(1, 1, 1, 0, 0, 0), "<=", 100)
add.constraint(lprec, c(0, 0, 0, 1, 1, 1), "<=", 120)


# To identify the variables and constraints, we can
# set variable names and name the constraints
ColNames <- c("Plant 1 Warehouse 1", "Plant 1 Warehouse 2", "Plant 1 Warehouse 3", "Plant 2 Warehouse 1", "Plant 2 Warehouse 2", "Plant 2 Warehouse 3")
RowNames <- c("Warehouse 1 Demand", "Warehouse 2 Demand", "Warehouse 3 Demand", "Plant A Capacity", "Plant B Capacity")
dimnames(lprec) <- list(RowNames, ColNames)

# Now, print out the model
lprec

# The model can also be saved to a file
write.lp(lprec, filename = "celijah_4.lp", type = "lp")


#Solve the minimization problem
solve(lprec)

#Get the Results of the model
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)



# create an lp object x
lprec <- read.lp("HS4.lp")
x <- read.lp("HS4.lp")
# display x
x                          


#Solve the lp model
solve(x)

# get objective value
get.objective(x)

# get values of decision variables
get.variables(x) 

# get constraint RHS values
get.constraints(x)  



# Get Primal Solution
get.primal.solution
get.primal.solution(lprec, orig = TRUE)
#Get Right-Hand-Side
get.rhs 


#Get Sensitivity: Objective Extended
solve(x)
get.sensitivity.obj(x)



#shadow prices and reduced costs command
get.sensitivity.rhs(x) 


#Details on the output (to read result meaning)
?get.sensitivity.rhs 

cbind(get.sensitivity.rhs(x))
get.sensitivity.rhs(x)




