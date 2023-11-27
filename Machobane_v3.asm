.data
    len:    .word 0
    wid:    .word 0
    fert:   .word 0
    mois:   .word 0
    index:  .word 0
    tech:   .word 0
    pos:    .word 0
    poss:   .word 0
    wheat:  .word 0
    peas:   .word 0
    potatoes:   .word 0
    maize:  .word 0
    beans:  .word 0
    pumpkin: .word 0
    space:  .asciiz " by "

.text
    main:
        # Print welcome message
        li $v0, 4
        la $a0, welcome_message
        syscall

    plot:
        # Print prompt for length dimensions
        li $v0, 4
        la $a0, prompt_length
        syscall

        # Get user input for length 
        li $v0, 5
        syscall
        sw $v0, len

        # Print prompt for width dimensions
        li $v0, 4
        la $a0, prompt_width
        syscall

        # Get user input for width
        li $v0, 5
        syscall
        sw $v0, wid

        # Print plot dimensions
        li $v0, 4
        la $a0, plot_dimensions_prompt
        syscall

        # Print length
        li $v0, 1
        lw $a0, len
        syscall

        # Print width
        li $v0, 4
        la $a0, space
        syscall

        li $v0, 1
        lw $a0, wid
        syscall

    soil:
        # Print prompt for soil preparation
        li $v0, 4
        la $a0, prompt_soil
        syscall

        # Get user input for fertilizer and moisture
        li $v0, 4
        la $a0, prompt_fertilizer
        syscall
        
        li $v0, 5
        syscall
        sw $v0, fert

        li $v0, 4
        la $a0, prompt_moisture
        syscall
        li $v0, 5
        syscall
        sw $v0, mois

    season:
        # Print prompt for season selection
        li $v0, 4
        la $a0, prompt_season
        syscall

        # Get user input for season index
        li $v0, 5
        syscall
        sw $v0, index
        lw $t0,index

        # Check season index
        beq $t0, 1, summer
        beq $t0, 2, winter
        b invalid_season
       

    summer:
        # Print prompt for planting technique
        li $v0, 4
        la $a0, prompt_technique
        syscall

        # Get user input for planting technique
        li $v0, 5
        syscall
        sw $v0, tech
	lw $t1, tech
	
        # Check planting technique
        beq $t1, 1, intercropping_summer
        beq $t1, 2, relay_crop_summer
        b invalid_technique_summer
        
    intercropping_summer:
        # Intercropping for summer
        # Similar logic for other crops

        # Print prompt for plant 1
        li $v0, 4
        la $a0, prompt_plant1
        syscall

        # Get user input for plant 1
        li $v0, 5
        syscall
        sw $v0, pos
        lw $t0, pos

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, maize
                
        # Print prompt for plant 2
        li $v0, 4
        la $a0, prompt_plant2
        syscall

        # Get user input for plant 2
        li $v0, 5
        syscall
        sw $v0, pos
        lw $t2, pos

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, pumpkin
        lw $t6, pumpkin 
        
#**************************************************************
 #Growing User defined plants
        lw $t4, maize
        li $t5,0
        
        li $s3,1   #Wheat
        li $s5,2   #Peas
        li $s6,3   #Potatoes
        
        li $t8,0
        
        li $t9,0
        add $t9,$t9,$t0    #Option One seleted
        
        
    loop3:   #First loop for planting
        beq $t5, $t4,next3
        li $v0, 4
        beq $t9,$s3,xxxx   #when option 1
        beq $t9,$s5,yyyy   #when option 2
        beq $t9,$s6,zzzz   #when option 3
        j end
    xxxx:
        li $v0, 4
        la $a0,pumkinseeds
        syscall
        addi $t5,$t5,1
        j loop3
        
    yyyy:
        li $v0, 4
     	la $a0,beansseeds
        syscall
        addi $t5,$t5,1
        j loop3
        
     zzzz:
        li $v0, 4
        la $a0,maizeseeds
        syscall
        addi $t5,$t5,1
        j loop3
   next3:   
        li $v0, 4
        la $a0,nextl
        syscall
        
        li $t5,0    
        beq $t8,1,yieldF
        li $t8,1
        li $t4,0
        
        li $t9,0
        add $t9,$t9,$t2
        add $t4,$t4,$t6
        j loop3 

#*******************************************************************      
        
    end:     
        # Print message for successful planting
        li $v0, 4
        la $a0, message_successful_planting
        syscall
        

        # End the program****************************************
       

    relay_crop_summer:
        # Relay Cropping for summer
        # Similar logic for other crops

        # Print prompt for plant 1
        li $v0, 4
        la $a0, prompt_plant1
        syscall

        # Get user input for plant 1
        li $v0, 5
        syscall
        sw $v0, pos

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, maize


        # Print message for successful planting
        li $v0, 4
        la $a0, message_successful_planting
        syscall
        
        # End the program****************************************
        li $v0, 10
        syscall
        
    winter:
    	# Print prompt for planting technique
        li $v0, 4
        la $a0, prompt_technique
        syscall

        # Get user input for planting technique
        li $v0, 5
        syscall
        sw $v0, tech
        lw $t1,tech     #*****************************
        
        # Check planting technique
        beq $t1, 1, intercropping_winter
        beq $t1, 2, relay_crop_winter
        b invalid_technique_winter
    
    
    intercropping_winter:
        # Intercropping for summer
        # Similar logic for other crops

        # Print prompt for plant 1
        li $v0, 4
        la $a0, prompt_plant3
        syscall

        # Get user input for plant 1
        li $v0, 5
        syscall
        sw $v0, pos
        lw $s2, pos

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, peas
        
        #*********************************************************                
        # Print prompt for plant 2
        li $v0, 4
        la $a0, prompt_plant4
        syscall

        # Get user input for plant 2
        li $v0, 5
        syscall
        sw $v0, pos
        lw $s4, pos

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, wheat
        lw $t6, wheat
        
        
#**************************************************************
 #Growing User defined plants
        lw $t4, peas
        li $t5,0
        
        li $s3,1   #Wheat
        li $s5,2   #Peas
        li $s6,3   #Potatoes
        
        li $t8,0
        
        li $t9,0
        add $t9,$t9,$s2    #Option One seleted
        
        
        
        
    loop:   #First loop for planting
        beq $t5, $t4,next
        li $v0, 4
        beq $t9,$s3,sssss   #when option 1
        beq $t9,$s5,ttttt   #when option 2
        beq $t9,$s6,ppppp   #when option 3
        j end
    ppppp:
        li $v0, 4
        la $a0,peasseeds
        syscall
        addi $t5,$t5,1
        j loop
        
   ttttt:
        li $v0, 4
     	la $a0,potatoestseeds
        syscall
        addi $t5,$t5,1
        j loop
        
   sssss:
        li $v0, 4
        la $a0,wheatseeds
        syscall
        addi $t5,$t5,1
        j loop
   next:   
        li $v0, 4
        la $a0,nextl
        syscall
        
        li $t5,0    
        beq $t8,1,yieldF
        li $t8,1
        li $t4,0
        
        li $t9,0
        add $t9,$t9,$s4
        add $t4,$t4,$t6
        j loop 

#*******************************************************************
        
        # End the program****************************************
        li $v0, 10
        syscall

    relay_crop_winter:
        # Relay Cropping for summer
        # Similar logic for other crops

        # Print prompt for plant 1
        li $v0, 4
        la $a0, prompt_plant1
        syscall

        # Get user input for plant 1
        li $v0, 5
        syscall
        sw $v0, pos

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, maize

        # Print message for successful planting
        li $v0, 4
        la $a0, message_successful_planting
        syscall
        
#*****************************Yield******************
 yieldF:       
        # Print message for successful planting
        li $v0, 4
        la $a0, message_successful_planting
        syscall

        li $v0, 4
        la $a0, welcome_yeild_section
        syscall
        

         # Calculate yield
        lw $t4, mois   # Load moisture value
        lw $t5, fert   # Load fertilizer value

        # Perform multiplication for yield
        mul $t6, $t4, $t5  # $t6 = mois * fert

        # Print calculated yield
        li $v0, 4
        la $a0, yeild
        syscall

        move $a0, $t6    # Move the value from $t0 to $a0
        li $v0, 1         # System call code for printing integer
        syscall
        j end
#*****************************Yield********************** 
          

    invalid_season:
        # Print message for invalid season
        li $v0, 4
        la $a0, message_invalid_season
        syscall
        j season

    invalid_technique_summer:
        # Print message for invalid technique
        li $v0, 4
        la $a0, message_invalid_technique
        syscall
        j summer
    invalid_technique_winter:
        # Print message for invalid technique
        li $v0, 4
        la $a0, message_invalid_technique
        syscall
        j winter

.data
    welcome_message: .asciiz "Welcome to Machobane Planting System\n"
    plot_dimensions_prompt: .asciiz "Plot dimensions in meters squared: "
    prompt_length: .asciiz "\nEnter the length of the plot in meters(m): "
    prompt_width: .asciiz "\nEnter the width of the plot in meters(m):  "
    prompt_soil: .asciiz "\n\nNow prepare the soil for crop production: \n"
    prompt_moisture: .asciiz "\nAdjust Moisture in the soil in scale from 1 to 10:\nMoisture: "
    prompt_season: .asciiz "\nChoose Sesson by Index:\n1.Summer\n2.Winter\nIndex: "
    prompt_technique: .asciiz "\nChoose Planting Technique by Index:\n1.Intercropping\n2.Relay Cropping System\nIndex: "
    prompt_plant1: .asciiz "\nChoose Plant 1 by Index:\n1.Maize\n2.Beans\n3.Pumpkin\nIndex: "
    prompt_seeds: .asciiz "\nEnter Number of seeds: "
    prompt_fertilizer: .asciiz "\nAdjust nutrients in the soil in scale from 1 to 10:\nFertilizer: "
    message_successful_planting: .asciiz "\nPlants are planted successfully. Wait for Harvest.\n"
    message_invalid_season: .asciiz "\nInvalid Season!!\n"
    message_invalid_technique: .asciiz "\nInvalid Planting Technique\n"



#******************************************  
    prompt_plant2: .asciiz "\nChoose Second Plant by Index:\n1.Maize\n2.Beans\n3.Pumpkin\nIndex: "
    prompt_plant3: .asciiz "\nChoose Plant 1 by Index:\n1.Wheat\n2.Peas\n3.Potatoes\nIndex: "
    prompt_plant4: .asciiz "\nChoose Second Plant by Index:\n1.Wheat\n2.Peas\n3.Potatoe\nIndex: "

  
    maizeseeds: .asciiz "+"
    beansseeds: .asciiz "-"
    pumkinseeds: .asciiz "-"
    peasseeds: .asciiz "|" 
    wheatseeds: .asciiz "/" 
    potatoestseeds: .asciiz "~" 
    nextl: .asciiz "\n"
    hhh: .asciiz "You entered: "
#********************************************  
  welcome_yeild_section: .asciiz "\nwelcome to yield management\n"
    yeild: .asciiz "\nwith this level of   moisture and this soil fertility we can expect  yeild  of percentage of   "
   
exit:
       li $v0, 10
       syscall