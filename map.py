matrix=[]#// declaration 
for i in range(21):   #/where n is the no. of lines you want 
	matrix.append([j for j in input().split()])  #// for taking m space separated integers as input





for i in range(1,21):
	for j in range(1,21):
		if (matrix[i][j] == 'M'):
			print("terrain(mountain,",j,",",20-i,").")
		elif (matrix[i][j] == 'R'):
			print("terrain(river,",j,",",20-i,").")
		elif (matrix[i][j] == 'L'):
			print("terrain(lava,",j,",",20-i,").")
		elif (matrix[i][j] == 'F'):
			print("terrain(forest,",j,",",20-i,").")
		elif (matrix[i][j] == 'W'):
			print("terrain(wasteland,",j,",",20-i,").")
		elif (matrix[i][j] == 'D'):
			print("terrain(desert,",j,",",20-i,").")
		elif (matrix[i][j] == 'O'):
			print("terrain(block,",j,",",20-i,").")
		elif (matrix[i][j] == 'g'):
			print("terrain(gym,",j,",",20-i,").")
		elif (matrix[i][j] == 'G'):
			print("terrain(grassland,",j,",",20-i,").")
		elif (matrix[i][j] == 'R'):
			print("terrain(river,",j,",",20-i,").")
		elif (matrix[i][j] == 'H'):
			print("terrain(home,",j,",",20-i,").")
		elif (matrix[i][j] == 'C'):
			print("terrain(cave,",j,",",20-i,").")