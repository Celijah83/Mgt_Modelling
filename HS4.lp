/* Heart Start objective function */

Min: 622K11 + 614K12 + 630K13 + 641K21 + 645K22 + 649K23;

/* Constraints */

/* Demands in the three warehouse */
K11 + K21 >= 80;
K12 + K22 >= 60;
K13 + K23 >= 70;

/* Monthly production capacities in two plants  */
K11 +  K12 +  K13  <= 100;
K21 +  K22 +  K23  <= 120;


