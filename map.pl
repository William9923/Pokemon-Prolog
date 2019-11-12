/* Map size */
edge([1,26],[1,26]). %Map size;
edgeOffset([X1,X2],[Y1,Y2]) :- 
    edge([XEdge1,XEdge2],[YEdge1,YEdge2]),
    X1 is XEdge1-1, X2 is XEdge2+1,
    Y1 is YEdge1-1, Y2 is YEdge2+1.


/*****************************************/
/*Initializing an initial map condition*/terrain(mountain, 1 , 25 ).
    terrain(mountain, 2 , 25 ).
    terrain(mountain, 3 , 25 ).
    terrain(mountain, 4 , 25 ).
    terrain(mountain, 5 , 25 ).
    terrain(mountain, 6 , 25 ).
    terrain(mountain, 7 , 25 ).
    terrain(mountain, 8 , 25 ).
    terrain(mountain, 9 , 25 ).
    terrain(mountain, 10 , 25 ).
    terrain(mountain, 11 , 25 ).
    terrain(mountain, 12 , 25 ).
    terrain(mountain, 13 , 25 ).
    terrain(mountain, 14 , 25 ).
    terrain(mountain, 15 , 25 ).
    terrain(mountain, 16 , 25 ).
    terrain(mountain, 17 , 25 ).
    terrain(river, 18 , 25 ).
    terrain(mountain, 19 , 25 ).
    terrain(grassland, 20 , 25 ).
    terrain(grassland, 21 , 25 ).
    terrain(river, 22 , 25 ).
    terrain(wasteland, 23 , 25 ).
    terrain(wasteland, 24 , 25 ).
    terrain(wasteland, 25 , 25 ).
    terrain(mountain, 1 , 24 ).
    terrain(lava, 2 , 24 ).
    terrain(lava, 3 , 24 ).
    terrain(lava, 4 , 24 ).
    terrain(lava, 5 , 24 ).
    terrain(lava, 6 , 24 ).
    terrain(lava, 7 , 24 ).
    terrain(lava, 8 , 24 ).
    terrain(lava, 9 , 24 ).
    terrain(mountain, 10 , 24 ).
    terrain(mountain, 11 , 24 ).
    terrain(river, 12 , 24 ).
    terrain(river, 13 , 24 ).
    terrain(river, 14 , 24 ).
    terrain(river, 15 , 24 ).
    terrain(river, 16 , 24 ).
    terrain(river, 17 , 24 ).
    terrain(grassland, 18 , 24 ).
    terrain(grassland, 19 , 24 ).
    terrain(grassland, 20 , 24 ).
    terrain(river, 21 , 24 ).
    terrain(wasteland, 22 , 24 ).
    terrain(wasteland, 23 , 24 ).
    terrain(wasteland, 24 , 24 ).
    terrain(wasteland, 25 , 24 ).
    terrain(mountain, 1 , 23 ).
    terrain(lava, 2 , 23 ).
    terrain(lava, 3 , 23 ).
    terrain(lava, 4 , 23 ).
    terrain(lava, 5 , 23 ).
    terrain(mountain, 6 , 23 ).
    terrain(mountain, 7 , 23 ).
    terrain(mountain, 8 , 23 ).
    terrain(mountain, 9 , 23 ).
    terrain(mountain, 10 , 23 ).
    terrain(mountain, 11 , 23 ).
    terrain(mountain, 12 , 23 ).
    terrain(mountain, 13 , 23 ).
    terrain(grassland, 14 , 23 ).
    terrain(grassland, 15 , 23 ).
    terrain(grassland, 16 , 23 ).
    terrain(grassland, 17 , 23 ).
    terrain(wasteland, 18 , 23 ).
    terrain(wasteland, 19 , 23 ).
    terrain(river, 20 , 23 ).
    terrain(wasteland, 21 , 23 ).
    terrain(cave, 22 , 23 ).
    terrain(wasteland, 23 , 23 ).
    terrain(wasteland, 24 , 23 ).
    terrain(wasteland, 25 , 23 ).
    terrain(mountain, 1 , 22 ).
    terrain(lava, 2 , 22 ).
    terrain(lava, 3 , 22 ).
    terrain(mountain, 4 , 22 ).
    terrain(mountain, 5 , 22 ).
    terrain(mountain, 6 , 22 ).
    terrain(mountain, 7 , 22 ).
    terrain(mountain, 8 , 22 ).
    terrain(mountain, 9 , 22 ).
    terrain(grassland, 10 , 22 ).
    terrain(river, 11 , 22 ).
    terrain(grassland, 12 , 22 ).
    terrain(grassland, 13 , 22 ).
    terrain(grassland, 14 , 22 ).
    terrain(grassland, 15 , 22 ).
    terrain(grassland, 16 , 22 ).
    terrain(grassland, 17 , 22 ).
    terrain(wasteland, 18 , 22 ).
    terrain(wasteland, 19 , 22 ).
    terrain(river, 20 , 22 ).
    terrain(wasteland, 21 , 22 ).
    terrain(wasteland, 22 , 22 ).
    terrain(wasteland, 23 , 22 ).
    terrain(wasteland, 24 , 22 ).
    terrain(wasteland, 25 , 22 ).
    terrain(mountain, 1 , 21 ).
    terrain(lava, 2 , 21 ).
    terrain(mountain, 3 , 21 ).
    terrain(grassland, 4 , 21 ).
    terrain(forest, 5 , 21 ).
    terrain(forest, 6 , 21 ).
    terrain(forest, 7 , 21 ).
    terrain(grassland, 8 , 21 ).
    terrain(grassland, 9 , 21 ).
    terrain(river, 10 , 21 ).
    terrain(grassland, 11 , 21 ).
    terrain(grassland, 12 , 21 ).
    terrain(grassland, 13 , 21 ).
    terrain(grassland, 14 , 21 ).
    terrain(grassland, 15 , 21 ).
    terrain(grassland, 16 , 21 ).
    terrain(wasteland, 17 , 21 ).
    terrain(wasteland, 18 , 21 ).
    terrain(wasteland, 19 , 21 ).
    terrain(wasteland, 20 , 21 ).
    terrain(river, 21 , 21 ).
    terrain(wasteland, 22 , 21 ).
    terrain(wasteland, 23 , 21 ).
    terrain(wasteland, 24 , 21 ).
    terrain(wasteland, 25 , 21 ).
    terrain(mountain, 1 , 20 ).
    terrain(lava, 2 , 20 ).
    terrain(mountain, 3 , 20 ).
    terrain(grassland, 4 , 20 ).
    terrain(forest, 5 , 20 ).
    terrain(forest, 6 , 20 ).
    terrain(grassland, 7 , 20 ).
    terrain(grassland, 8 , 20 ).
    terrain(river, 9 , 20 ).
    terrain(grassland, 10 , 20 ).
    terrain(grassland, 11 , 20 ).
    terrain(grassland, 12 , 20 ).
    terrain(grassland, 13 , 20 ).
    terrain(grassland, 14 , 20 ).
    terrain(grassland, 15 , 20 ).
    terrain(grassland, 16 , 20 ).
    terrain(grassland, 17 , 20 ).
    terrain(grassland, 18 , 20 ).
    terrain(wasteland, 19 , 20 ).
    terrain(wasteland, 20 , 20 ).
    terrain(river, 21 , 20 ).
    terrain(wasteland, 22 , 20 ).
    terrain(wasteland, 23 , 20 ).
    terrain(wasteland, 24 , 20 ).
    terrain(wasteland, 25 , 20 ).
    terrain(mountain, 1 , 19 ).
    terrain(mountain, 2 , 19 ).
    terrain(grassland, 3 , 19 ).
    terrain(forest, 4 , 19 ).
    terrain(forest, 5 , 19 ).
    terrain(forest, 6 , 19 ).
    terrain(forest, 7 , 19 ).
    terrain(grassland, 8 , 19 ).
    terrain(river, 9 , 19 ).
    terrain(grassland, 10 , 19 ).
    terrain(grassland, 11 , 19 ).
    terrain(grassland, 12 , 19 ).
    terrain(grassland, 13 , 19 ).
    terrain(grassland, 14 , 19 ).
    terrain(grassland, 15 , 19 ).
    terrain(grassland, 16 , 19 ).
    terrain(wasteland, 17 , 19 ).
    terrain(wasteland, 18 , 19 ).
    terrain(wasteland, 19 , 19 ).
    terrain(wasteland, 20 , 19 ).
    terrain(river, 21 , 19 ).
    terrain(wasteland, 22 , 19 ).
    terrain(wasteland, 23 , 19 ).
    terrain(wasteland, 24 , 19 ).
    terrain(wasteland, 25 , 19 ).
    terrain(mountain, 1 , 18 ).
    terrain(forest, 2 , 18 ).
    terrain(forest, 3 , 18 ).
    terrain(forest, 4 , 18 ).
    terrain(forest, 5 , 18 ).
    terrain(forest, 6 , 18 ).
    terrain(forest, 7 , 18 ).
    terrain(forest, 8 , 18 ).
    terrain(river, 9 , 18 ).
    terrain(grassland, 10 , 18 ).
    terrain(grassland, 11 , 18 ).
    terrain(grassland, 12 , 18 ).
    terrain(grassland, 13 , 18 ).
    terrain(grassland, 14 , 18 ).
    terrain(grassland, 15 , 18 ).
    terrain(grassland, 16 , 18 ).
    terrain(grassland, 17 , 18 ).
    terrain(grassland, 18 , 18 ).
    terrain(wasteland, 19 , 18 ).
    terrain(river, 20 , 18 ).
    terrain(wasteland, 21 , 18 ).
    terrain(wasteland, 22 , 18 ).
    terrain(wasteland, 23 , 18 ).
    terrain(wasteland, 24 , 18 ).
    terrain(wasteland, 25 , 18 ).
    terrain(grassland, 1 , 17 ).
    terrain(grassland, 2 , 17 ).
    terrain(forest, 3 , 17 ).
    terrain(forest, 4 , 17 ).
    terrain(forest, 5 , 17 ).
    terrain(forest, 6 , 17 ).
    terrain(grassland, 7 , 17 ).
    terrain(grassland, 8 , 17 ).
    terrain(river, 9 , 17 ).
    terrain(grassland, 10 , 17 ).
    terrain(grassland, 11 , 17 ).
    terrain(grassland, 12 , 17 ).
    terrain(grassland, 13 , 17 ).
    terrain(grassland, 14 , 17 ).
    terrain(grassland, 15 , 17 ).
    terrain(grassland, 16 , 17 ).
    terrain(wasteland, 17 , 17 ).
    terrain(wasteland, 18 , 17 ).
    terrain(wasteland, 19 , 17 ).
    terrain(wasteland, 20 , 17 ).
    terrain(river, 21 , 17 ).
    terrain(wasteland, 22 , 17 ).
    terrain(wasteland, 23 , 17 ).
    terrain(wasteland, 24 , 17 ).
    terrain(wasteland, 25 , 17 ).
    terrain(grassland, 1 , 16 ).
    terrain(forest, 2 , 16 ).
    terrain(forest, 3 , 16 ).
    terrain(forest, 4 , 16 ).
    terrain(forest, 5 , 16 ).
    terrain(grassland, 6 , 16 ).
    terrain(grassland, 7 , 16 ).
    terrain(river, 8 , 16 ).
    terrain(grassland, 9 , 16 ).
    terrain(grassland, 10 , 16 ).
    terrain(grassland, 11 , 16 ).
    terrain(grassland, 12 , 16 ).
    terrain(grassland, 13 , 16 ).
    terrain(grassland, 14 , 16 ).
    terrain(grassland, 15 , 16 ).
    terrain(grassland, 16 , 16 ).
    terrain(grassland, 17 , 16 ).
    terrain(wasteland, 18 , 16 ).
    terrain(wasteland, 19 , 16 ).
    terrain(wasteland, 20 , 16 ).
    terrain(river, 21 , 16 ).
    terrain(wasteland, 22 , 16 ).
    terrain(wasteland, 23 , 16 ).
    terrain(wasteland, 24 , 16 ).
    terrain(wasteland, 25 , 16 ).
    terrain(forest, 1 , 15 ).
    terrain(forest, 2 , 15 ).
    terrain(forest, 3 , 15 ).
    terrain(forest, 4 , 15 ).
    terrain(forest, 5 , 15 ).
    terrain(grassland, 6 , 15 ).
    terrain(river, 7 , 15 ).
    terrain(grassland, 8 , 15 ).
    terrain(grassland, 9 , 15 ).
    terrain(grassland, 10 , 15 ).
    terrain(grassland, 11 , 15 ).
    terrain(grassland, 12 , 15 ).
    terrain(grassland, 13 , 15 ).
    terrain(grassland, 14 , 15 ).
    terrain(grassland, 15 , 15 ).
    terrain(grassland, 16 , 15 ).
    terrain(wasteland, 17 , 15 ).
    terrain(wasteland, 18 , 15 ).
    terrain(wasteland, 19 , 15 ).
    terrain(wasteland, 20 , 15 ).
    terrain(wasteland, 21 , 15 ).
    terrain(river, 22 , 15 ).
    terrain(wasteland, 23 , 15 ).
    terrain(river, 24 , 15 ).
    terrain(river, 25 , 15 ).
    terrain(forest, 1 , 14 ).
    terrain(forest, 2 , 14 ).
    terrain(cave, 3 , 14 ).
    terrain(forest, 4 , 14 ).
    terrain(forest, 5 , 14 ).
    terrain(river, 6 , 14 ).
    terrain(grassland, 7 , 14 ).
    terrain(grassland, 8 , 14 ).
    terrain(grassland, 9 , 14 ).
    terrain(grassland, 10 , 14 ).
    terrain(grassland, 11 , 14 ).
    terrain(grassland, 12 , 14 ).
    terrain(grassland, 13 , 14 ).
    terrain(grassland, 14 , 14 ).
    terrain(grassland, 15 , 14 ).
    terrain(grassland, 16 , 14 ).
    terrain(grassland, 17 , 14 ).
    terrain(wasteland, 18 , 14 ).
    terrain(wasteland, 19 , 14 ).
    terrain(wasteland, 20 , 14 ).
    terrain(wasteland, 21 , 14 ).
    terrain(wasteland, 22 , 14 ).
    terrain(wasteland, 23 , 14 ).
    terrain(wasteland, 24 , 14 ).
    terrain(wasteland, 25 , 14 ).
    terrain(forest, 1 , 13 ).
    terrain(forest, 2 , 13 ).
    terrain(forest, 3 , 13 ).
    terrain(forest, 4 , 13 ).
    terrain(river, 5 , 13 ).
    terrain(grassland, 6 , 13 ).
    terrain(grassland, 7 , 13 ).
    terrain(grassland, 8 , 13 ).
    terrain(grassland, 9 , 13 ).
    terrain(grassland, 10 , 13 ).
    terrain(grassland, 11 , 13 ).
    terrain(grassland, 12 , 13 ).
    terrain(grassland, 13 , 13 ).
    terrain(grassland, 14 , 13 ).
    terrain(grassland, 15 , 13 ).
    terrain(grassland, 16 , 13 ).
    terrain(wasteland, 17 , 13 ).
    terrain(wasteland, 18 , 13 ).
    terrain(wasteland, 19 , 13 ).
    terrain(wasteland, 20 , 13 ).
    terrain(wasteland, 21 , 13 ).
    terrain(wasteland, 22 , 13 ).
    terrain(wasteland, 23 , 13 ).
    terrain(wasteland, 24 , 13 ).
    terrain(wasteland, 25 , 13 ).
    terrain(river, 1 , 12 ).
    terrain(river, 2 , 12 ).
    terrain(river, 3 , 12 ).
    terrain(river, 4 , 12 ).
    terrain(grassland, 5 , 12 ).
    terrain(grassland, 6 , 12 ).
    terrain(grassland, 7 , 12 ).
    terrain(grassland, 8 , 12 ).
    terrain(grassland, 9 , 12 ).
    terrain(grassland, 10 , 12 ).
    terrain(grassland, 11 , 12 ).
    terrain(grassland, 12 , 12 ).
    terrain(grassland, 13 , 12 ).
    terrain(grassland, 14 , 12 ).
    terrain(grassland, 15 , 12 ).
    terrain(grassland, 16 , 12 ).
    terrain(wasteland, 17 , 12 ).
    terrain(wasteland, 18 , 12 ).
    terrain(wasteland, 19 , 12 ).
    terrain(wasteland, 20 , 12 ).
    terrain(wasteland, 21 , 12 ).
    terrain(wasteland, 22 , 12 ).
    terrain(wasteland, 23 , 12 ).
    terrain(wasteland, 24 , 12 ).
    terrain(wasteland, 25 , 12 ).
    terrain(forest, 1 , 11 ).
    terrain(forest, 2 , 11 ).
    terrain(forest, 3 , 11 ).
    terrain(forest, 4 , 11 ).
    terrain(river, 5 , 11 ).
    terrain(forest, 6 , 11 ).
    terrain(forest, 7 , 11 ).
    terrain(forest, 8 , 11 ).
    terrain(grassland, 9 , 11 ).
    terrain(home, 10 , 11 ).
    terrain(grassland, 11 , 11 ).
    terrain(grassland, 12 , 11 ).
    terrain(grassland, 13 , 11 ).
    terrain(grassland, 14 , 11 ).
    terrain(grassland, 15 , 11 ).
    terrain(wasteland, 16 , 11 ).
    terrain(wasteland, 17 , 11 ).
    terrain(wasteland, 18 , 11 ).
    terrain(wasteland, 19 , 11 ).
    terrain(wasteland, 20 , 11 ).
    terrain(wasteland, 21 , 11 ).
    terrain(wasteland, 22 , 11 ).
    terrain(wasteland, 23 , 11 ).
    terrain(wasteland, 24 , 11 ).
    terrain(wasteland, 25 , 11 ).
    terrain(forest, 1 , 10 ).
    terrain(forest, 2 , 10 ).
    terrain(forest, 3 , 10 ).
    terrain(forest, 4 , 10 ).
    terrain(forest, 5 , 10 ).
    terrain(river, 6 , 10 ).
    terrain(forest, 7 , 10 ).
    terrain(forest, 8 , 10 ).
    terrain(grassland, 9 , 10 ).
    terrain(grassland, 10 , 10 ).
    terrain(grassland, 11 , 10 ).
    terrain(grassland, 12 , 10 ).
    terrain(grassland, 13 , 10 ).
    terrain(grassland, 14 , 10 ).
    terrain(grassland, 15 , 10 ).
    terrain(grassland, 16 , 10 ).
    terrain(grassland, 17 , 10 ).
    terrain(grassland, 18 , 10 ).
    terrain(wasteland, 19 , 10 ).
    terrain(wasteland, 20 , 10 ).
    terrain(wasteland, 21 , 10 ).
    terrain(wasteland, 22 , 10 ).
    terrain(wasteland, 23 , 10 ).
    terrain(wasteland, 24 , 10 ).
    terrain(wasteland, 25 , 10 ).
    terrain(forest, 1 , 9 ).
    terrain(forest, 2 , 9 ).
    terrain(forest, 3 , 9 ).
    terrain(forest, 4 , 9 ).
    terrain(forest, 5 , 9 ).
    terrain(forest, 6 , 9 ).
    terrain(river, 7 , 9 ).
    terrain(forest, 8 , 9 ).
    terrain(grassland, 9 , 9 ).
    terrain(grassland, 10 , 9 ).
    terrain(grassland, 11 , 9 ).
    terrain(grassland, 12 , 9 ).
    terrain(grassland, 13 , 9 ).
    terrain(grassland, 14 , 9 ).
    terrain(grassland, 15 , 9 ).
    terrain(grassland, 16 , 9 ).
    terrain(grassland, 17 , 9 ).
    terrain(wasteland, 18 , 9 ).
    terrain(desert, 19 , 9 ).
    terrain(wasteland, 20 , 9 ).
    terrain(desert, 21 , 9 ).
    terrain(wasteland, 22 , 9 ).
    terrain(desert, 23 , 9 ).
    terrain(wasteland, 24 , 9 ).
    terrain(wasteland, 25 , 9 ).
    terrain(forest, 1 , 8 ).
    terrain(forest, 2 , 8 ).
    terrain(forest, 3 , 8 ).
    terrain(forest, 4 , 8 ).
    terrain(forest, 5 , 8 ).
    terrain(forest, 6 , 8 ).
    terrain(river, 7 , 8 ).
    terrain(forest, 8 , 8 ).
    terrain(grassland, 9 , 8 ).
    terrain(grassland, 10 , 8 ).
    terrain(grassland, 11 , 8 ).
    terrain(grassland, 12 , 8 ).
    terrain(grassland, 13 , 8 ).
    terrain(grassland, 14 , 8 ).
    terrain(grassland, 15 , 8 ).
    terrain(grassland, 16 , 8 ).
    terrain(grassland, 17 , 8 ).
    terrain(desert, 18 , 8 ).
    terrain(wasteland, 19 , 8 ).
    terrain(desert, 20 , 8 ).
    terrain(wasteland, 21 , 8 ).
    terrain(desert, 22 , 8 ).
    terrain(wasteland, 23 , 8 ).
    terrain(desert, 24 , 8 ).
    terrain(desert, 25 , 8 ).
    terrain(forest, 1 , 7 ).
    terrain(forest, 2 , 7 ).
    terrain(forest, 3 , 7 ).
    terrain(forest, 4 , 7 ).
    terrain(forest, 5 , 7 ).
    terrain(forest, 6 , 7 ).
    terrain(river, 7 , 7 ).
    terrain(forest, 8 , 7 ).
    terrain(grassland, 9 , 7 ).
    terrain(grassland, 10 , 7 ).
    terrain(grassland, 11 , 7 ).
    terrain(grassland, 12 , 7 ).
    terrain(grassland, 13 , 7 ).
    terrain(desert, 14 , 7 ).
    terrain(desert, 15 , 7 ).
    terrain(desert, 16 , 7 ).
    terrain(desert, 17 , 7 ).
    terrain(desert, 18 , 7 ).
    terrain(desert, 19 , 7 ).
    terrain(desert, 20 , 7 ).
    terrain(desert, 21 , 7 ).
    terrain(desert, 22 , 7 ).
    terrain(desert, 23 , 7 ).
    terrain(desert, 24 , 7 ).
    terrain(desert, 25 , 7 ).
    terrain(forest, 1 , 6 ).
    terrain(forest, 2 , 6 ).
    terrain(forest, 3 , 6 ).
    terrain(forest, 4 , 6 ).
    terrain(forest, 5 , 6 ).
    terrain(river, 6 , 6 ).
    terrain(forest, 7 , 6 ).
    terrain(forest, 8 , 6 ).
    terrain(grassland, 9 , 6 ).
    terrain(grassland, 10 , 6 ).
    terrain(grassland, 11 , 6 ).
    terrain(grassland, 12 , 6 ).
    terrain(grassland, 13 , 6 ).
    terrain(grassland, 14 , 6 ).
    terrain(grassland, 15 , 6 ).
    terrain(grassland, 16 , 6 ).
    terrain(grassland, 17 , 6 ).
    terrain(desert, 18 , 6 ).
    terrain(desert, 19 , 6 ).
    terrain(block, 20 , 6 ).
    terrain(block, 21 , 6 ).
    terrain(block, 22 , 6 ).
    terrain(block, 23 , 6 ).
    terrain(block, 24 , 6 ).
    terrain(desert, 25 , 6 ).
    terrain(forest, 1 , 5 ).
    terrain(forest, 2 , 5 ).
    terrain(forest, 3 , 5 ).
    terrain(forest, 4 , 5 ).
    terrain(forest, 5 , 5 ).
    terrain(forest, 6 , 5 ).
    terrain(forest, 7 , 5 ).
    terrain(forest, 8 , 5 ).
    terrain(grassland, 9 , 5 ).
    terrain(grassland, 10 , 5 ).
    terrain(grassland, 11 , 5 ).
    terrain(grassland, 12 , 5 ).
    terrain(grassland, 13 , 5 ).
    terrain(desert, 14 , 5 ).
    terrain(desert, 15 , 5 ).
    terrain(desert, 16 , 5 ).
    terrain(desert, 17 , 5 ).
    terrain(block, 18 , 5 ).
    terrain(desert, 19 , 5 ).
    terrain(desert, 20 , 5 ).
    terrain(desert, 21 , 5 ).
    terrain(desert, 22 , 5 ).
    terrain(desert, 23 , 5 ).
    terrain(desert, 24 , 5 ).
    terrain(desert, 25 , 5 ).
    terrain(forest, 1 , 4 ).
    terrain(forest, 2 , 4 ).
    terrain(forest, 3 , 4 ).
    terrain(forest, 4 , 4 ).
    terrain(river, 5 , 4 ).
    terrain(forest, 6 , 4 ).
    terrain(forest, 7 , 4 ).
    terrain(forest, 8 , 4 ).
    terrain(grassland, 9 , 4 ).
    terrain(grassland, 10 , 4 ).
    terrain(grassland, 11 , 4 ).
    terrain(grassland, 12 , 4 ).
    terrain(grassland, 13 , 4 ).
    terrain(desert, 14 , 4 ).
    terrain(desert, 15 , 4 ).
    terrain(desert, 16 , 4 ).
    terrain(desert, 17 , 4 ).
    terrain(block, 18 , 4 ).
    terrain(desert, 19 , 4 ).
    terrain(desert, 20 , 4 ).
    terrain(desert, 21 , 4 ).
    terrain(desert, 22 , 4 ).
    terrain(desert, 23 , 4 ).
    terrain(desert, 24 , 4 ).
    terrain(desert, 25 , 4 ).
    terrain(forest, 1 , 3 ).
    terrain(forest, 2 , 3 ).
    terrain(forest, 3 , 3 ).
    terrain(river, 4 , 3 ).
    terrain(forest, 5 , 3 ).
    terrain(forest, 6 , 3 ).
    terrain(forest, 7 , 3 ).
    terrain(forest, 8 , 3 ).
    terrain(grassland, 9 , 3 ).
    terrain(grassland, 10 , 3 ).
    terrain(grassland, 11 , 3 ).
    terrain(grassland, 12 , 3 ).
    terrain(desert, 13 , 3 ).
    terrain(desert, 14 , 3 ).
    terrain(desert, 15 , 3 ).
    terrain(desert, 16 , 3 ).
    terrain(desert, 17 , 3 ).
    terrain(block, 18 , 3 ).
    terrain(desert, 19 , 3 ).
    terrain(desert, 20 , 3 ).
    terrain(desert, 21 , 3 ).
    terrain(cave, 22 , 3 ).
    terrain(desert, 23 , 3 ).
    terrain(desert, 24 , 3 ).
    terrain(desert, 25 , 3 ).
    terrain(forest, 1 , 2 ).
    terrain(forest, 2 , 2 ).
    terrain(forest, 3 , 2 ).
    terrain(river, 4 , 2 ).
    terrain(forest, 5 , 2 ).
    terrain(forest, 6 , 2 ).
    terrain(forest, 7 , 2 ).
    terrain(forest, 8 , 2 ).
    terrain(grassland, 9 , 2 ).
    terrain(grassland, 10 , 2 ).
    terrain(grassland, 11 , 2 ).
    terrain(desert, 12 , 2 ).
    terrain(desert, 13 , 2 ).
    terrain(desert, 14 , 2 ).
    terrain(desert, 15 , 2 ).
    terrain(desert, 16 , 2 ).
    terrain(desert, 17 , 2 ).
    terrain(block, 18 , 2 ).
    terrain(desert, 19 , 2 ).
    terrain(desert, 20 , 2 ).
    terrain(desert, 21 , 2 ).
    terrain(desert, 22 , 2 ).
    terrain(desert, 23 , 2 ).
    terrain(desert, 24 , 2 ).
    terrain(desert, 25 , 2 ).
    terrain(forest, 1 , 1 ).
    terrain(forest, 2 , 1 ).
    terrain(river, 3 , 1 ).
    terrain(forest, 4 , 1 ).
    terrain(forest, 5 , 1 ).
    terrain(forest, 6 , 1 ).
    terrain(forest, 7 , 1 ).
    terrain(grassland, 8 , 1 ).
    terrain(grassland, 9 , 1 ).
    terrain(desert, 10 , 1 ).
    terrain(desert, 11 , 1 ).
    terrain(desert, 12 , 1 ).
    terrain(desert, 13 , 1 ).
    terrain(desert, 14 , 1 ).
    terrain(desert, 15 , 1 ).
    terrain(desert, 16 , 1 ).
    terrain(desert, 17 , 1 ).
    terrain(block, 18 , 1 ).
    terrain(desert, 19 , 1 ).
    terrain(desert, 20 , 1 ).
    terrain(desert, 21 , 1 ).
    terrain(desert, 22 , 1 ).
    terrain(desert, 23 , 1 ).
    terrain(desert, 24 , 1 ).
    terrain(desert, 25 , 1 ).

/*** MAP - Printing map with radar ***/ 
map :-
    checkStart(0),
    write('Permainan Belum dimulai'), !.
map :-
    edgeOffset([XMin,_],[_,YMax]),
    recPrintRadar(XMin,YMax), !.    
/********************************/
/*** MAP function dependencies***/
recPrintRadar(X,Y) :-
    edgeOffset([_,X],[Y,_]),
    printOneTile(X,Y), tab(1), !.
    
recPrintRadar(X,Y) :-
    \+edgeOffset([_,X],_),
    XPlus is X+1,
    printOneTile(X,Y), tab(1),
    recPrintRadar(XPlus,Y), !.
    
recPrintRadar(X,Y) :-
    edgeOffset([_,X],_),
    edgeOffset([XMin,_],_),
    YMin is Y-1,
    printOneTile(X,Y), tab(1),
    nl,
    recPrintRadar(XMin,YMin).   
/************************************/
/** For printing MAP **/
printOneTile(X,Y) :-    % home
    terrain(home,X,Y),
    write('H'), !.
printOneTile(X,Y) :-    % gym
    terrain(gym,X,Y),
    write('G'), !.
printOneTile(X,Y) :-    % block
    terrain(block,X,Y),
    write('0'), !.
printOneTile(X,Y) :-    % player
    letak_player(X,Y),
    write('P'), !.
printOneTile(X,Y) :-    % player
    letak_item(_,X,Y),
    write('I'), !.
printOneTile(X,Y) :-    % forest
    terrain(forest,X,Y),
    write('#'), !.
printOneTile(X,Y) :-    % wasteland
    terrain(wasteland,X,Y),
    write('_'), !.
printOneTile(X,Y) :-    % river
    terrain(river,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % grassland
    terrain(grassland,X,Y),
    write('.'), !.
printOneTile(X,Y) :-    % desert
    terrain(desert,X,Y),
    write('_'), !.
printOneTile(X,Y) :-    % mountain
    terrain(mountain,X,Y),
    write('^'), !.
printOneTile(X,Y) :-    % lava
    terrain(lava,X,Y),
    write('/'), !.
printOneTile(X,Y) :-    % cave
    terrain(cave,X,Y),
    write('C'), !.
printOneTile(_,_) :-    %inaccessible
    write('X').
/***********************************/