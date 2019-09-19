

# Assignment2/3_Weigelt Production_Celijah_3.R

### Weigelt Production
  
  library(lpSolveAPI)
  
  lprec <- read.lp("weigelt.lp")
  
  solve(lprec)
  
  get.objective(lprec)
  
  get.variables(lprec)
  
  get.constraints(lprec)
  
  
  # make an lp object with 0 constraints and 9 decision variables
  lprec <- make.lp(0, 9)
  
  # Now create the objective function. The default is a minimization problem. 
  set.objfn(lprec, c(420, 420, 420, 360, 360, 360, 300, 300, 300))
  
  # As the default is a minimization problem, we change the direction to set maximization
  lp.control(lprec,sense='max')
  
  # Add the plant and capacity constraints
  add.constraint(lprec, c(1, 0, 0, 1, 0, 0, 1, 0, 0), "<=", 750)
  add.constraint(lprec, c(0, 1, 0, 0, 1, 0, 0, 1, 0), "<=", 900)
  add.constraint(lprec, c(0, 0, 1, 0, 0, 1, 0, 0, 1), "<=", 450)
  add.constraint(lprec, c(20, 0, 0, 15, 0, 0, 12, 0, 0), "<=", 13000)
  add.constraint(lprec, c(0, 20, 0, 0, 15, 0, 0, 12, 0), "<=", 12000)
  add.constraint(lprec, c(0, 0, 20, 0, 0, 15, 0, 0, 12), "<=", 5000)
  add.constraint(lprec, c(1, 1, 1, 0, 0, 0, 0, 0, 0), "<=", 900)
  add.constraint(lprec, c(0, 0, 0, 1, 1, 1, 0, 0, 0), "<=", 1200)
  add.constraint(lprec, c(0, 0, 0, 0, 0, 0, 1, 1, 1), "<=", 750)
  add.constraint(lprec, c(0, +0, +0, +900, + 900,  + 900, - 750, - 750, - 750), "<=", 0)
  add.constraint(lprec, c(450, + 450,  + 450, +0, +0, +0,- 750, - 750, - 750), "<=", 0)
  
  
  # To identify the variables and constraints, we can set variable names and name the constraints
  ColNames <- c("Large Product Plant 1", "Large Product Plant 2", "Large Product Plant 3", "Medium Product Plant 1", "Medium Product Plant 2", "Medium Product Plant 3", "Small Product Plant 1", "Small Product Plant 2", "Small Product Plant 3")
  RowNames <- c("Plant 1 capacity", "Plant 2 capacity", "Plant 3 capacity", "Plant 1 sq ft", "Plant 2 sq ft", "Plant 3 sq ft", "Large Product Forecast", "Medium Product Forecast", "Small Product Forecast", "Product percentage capacity_R", "Product percentage capacity_L")
  dimnames(lprec) <- list(RowNames, ColNames)
  
  # Now, print out the model
  lprec
  
  # The model can also be saved to a file
  write.lp(lprec, filename = "celijah_2_Assign3.lp", type = "lp")
  
  
  #Solve the maximization problem
  solve(lprec)
  
  #Get the Results of the model
  get.objective(lprec)
  get.variables(lprec)
  get.constraints(lprec)
  
  
  
  # create an lp object x
  lprec <- read.lp("weigelt.lp")
  x <- read.lp("weigelt.lp")
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

  

  
