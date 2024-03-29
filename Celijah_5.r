
Celijah_5

library(lpSolveAPI)

## create IP object
cpm.ip <- make.lp(nrow = 9, ncol = 12) # nrow represents number of nodes, and ncol repesents numnber of arcs

# create names for nodes and arcs
arc.names <- c("x12", "x13", "x24", "x25", "x35", "x46", "x47", "x57", "x58", "x69", "x79", "x89")
node.names <- c("node1", "node2", "node3", "node4", "node5", "node6", "node7", "node8", "node9")

# rename the IP object
rownames(cpm.ip) <- node.names
colnames(cpm.ip) <- arc.names

## obj function
time <- c(5, 3, 4, 2, 3, 1, 4, 6, 2, 5, 4, 7)
set.objfn(cpm.ip, -1*time)  # default is min

## set constraints LHS
set.row(cpm.ip, 1, c(1, 1), indices = c(1, 2))     # node 1 (starting node)
set.row(cpm.ip, 2, c(1, -1, -1), indices = c(1, 4, 3))     # node 2 (intermediate node)
set.row(cpm.ip, 3, c(1, -1), indices = c(2, 5))  # node 3 (intermediate node)
set.row(cpm.ip, 4, c(1, -1, -1), indices = c(3, 6, 7))     # node 4 (intermediate node)
set.row(cpm.ip, 5, c(1, 1, -1, -1), indices = c(5, 4, 9, 8))         # node 5 (intermediate node)
set.row(cpm.ip, 6, c(1, -1), indices = c(6, 10))  # node 6 (intermediate node)
set.row(cpm.ip, 7, c(1, 1, -1), indices = c(7, 8, 11))  # node 7 (intermediate node)
set.row(cpm.ip, 8, c(1, -1), indices = c(9, 12))  # node 8 (intermediate node)
set.row(cpm.ip, 9, c(1, 1, 1), indices = c(10, 11, 12))  # node 9 (finish node)

## set constraints type
set.constr.type(cpm.ip, rep("="), 9)

## set constraint RHS
rhs <- c(1, rep(0, 7), 1)
set.rhs(cpm.ip, rhs)

## set all variables type to be binary
set.type(cpm.ip, 1:12, "binary")

## solve the IP problem
solve(cpm.ip)
get.objective(cpm.ip)
get.variables(cpm.ip)

# put optimal values beside of variable names for better understanding of th results
cbind(arc.names, get.variables(cpm.ip))



x <- read.lp("Assignment5_Q2_Pt1.lp")

solve(x)
get.objective(x)
get.variables(x)





x <- read.lp("Assignment5_Q2_Pt2.lp")

solve(x)
get.objective(x)
get.variables(x)

