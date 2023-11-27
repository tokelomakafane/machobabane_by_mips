#=================================================
# @author: HOHOBE GROUP
# @purpose: MACHOBANE FARM SYSTEM
# @contacts: tokelomakafane1@gmail.com
#            blademohapi@gmail.com
#            tlechesa33@gmail.com
#            mkhotso33@gmail.com
#            conslibetoe@gmail.com
#            lenkoerenang@gmail.com
#            sekopomasheane@gmail.com
# @date: 19-11-2023
# =================================================
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
    sorghum: .word 0
    space:  .asciiz " by "
   plant1: .word 0
    plant2: .word 0
    seeds1: .word 0
    seeds2: .word 0
    

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



        li $v0, 4
        la $a0, welcome_yeild_section
        syscall

       
         #tokelo

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
    # Print prompt for plant 1
    li $v0, 4
    la $a0, prompt_plant1
    syscall

    # Get user input for plant 1
    li $v0, 5
    syscall
    sw $v0, plant1

    # Print prompt for plant 2
    li $v0, 4
    la $a0, prompt_plant2
    syscall

    # Get user input for plant 2
    li $v0, 5
    syscall
    sw $v0, plant2

    # Simulate planting and growth for both selected plants
    j plant_simulation

# ... (other parts of the code)

plant_simulation:
    # Load plant 1 choice into register $t0
    lw $t0, plant1

    # Check if maize or beans seeds were planted for plant 1
    beq $t0, 1, plant_maize1
    beq $t0, 2, plant_beans1
    beq $t0, 3, plant_sorghum1
    # Handle other crops or invalid selection for plant 1

plant_maize1:
    # Simulate planting maize for plant 1
    li $v0, 4
    la $a0, prompt_seeds
    syscall

    li $v0, 5
    syscall
    sw $v0, seeds1  # Store the number of seeds for plant 1

    # You can use the value in $v0 (maize seeds) to determine the number of plants
    move $t2, $v0  # Number of maize seeds for plant 1

    # Loop to simulate growth for plant_maize1
    li $t3, 0  # Counter for growth
    j growth_loop_maize1  # Jump to the growth loop for maize1

growth_loop_maize1:
    # Simulate growth process for maize1
    # Add any necessary logic based on soil conditions, fertilizer, etc.

    # Print "+" for each maize1 plant
    li $v0, 11  # Print character
    li $a0, '+'  # The character to print
    syscall

    # Increment growth counter for maize1
    addi $t3, $t3, 1

    # Check if reached desired growth based on the number of seeds
    blt $t3, $t2, growth_loop_maize1

    # Jump to the next plant or end the program after maize1 simulation
    j next_plant
    
    
    
    
    
plant_beans1:
    # Simulate planting maize for plant 1
    li $v0, 4
    la $a0, prompt_seeds
    syscall

    li $v0, 5
    syscall
    sw $v0, seeds1  # Store the number of seeds for plant 1

    # You can use the value in $v0 (maize seeds) to determine the number of plants
    move $t2, $v0  # Number of maize seeds for plant 1

    # Loop to simulate growth for plant_maize1
    li $t3, 0  # Counter for growth
    j growth_loop_beans1  # Jump to the growth loop for maize1

growth_loop_beans1:
    # Simulate growth process for maize1
    # Add any necessary logic based on soil conditions, fertilizer, etc.

    # Print "+" for each maize1 plant
    li $v0, 11  # Print character
    li $a0, '*'  # The character to print
    syscall

    # Increment growth counter for maize1
    addi $t3, $t3, 1

    # Check if reached desired growth based on the number of seeds
    blt $t3, $t2, growth_loop_beans1

    # Jump to the next plant or end the program after maize1 simulation
    j next_plant    
    
    

    
        
plant_sorghum1:
    # Simulate planting maize for plant 1
    li $v0, 4
    la $a0, prompt_seeds
    syscall

    li $v0, 5
    syscall
    sw $v0, seeds1  # Store the number of seeds for plant 1

    # You can use the value in $v0 (maize seeds) to determine the number of plants
    move $t2, $v0  # Number of maize seeds for plant 1

    # Loop to simulate growth for plant_maize1
    li $t3, 0  # Counter for growth
    j growth_loop_sorghum1  # Jump to the growth loop for maize1

growth_loop_sorghum1:
    # Simulate growth process for maize1
    # Add any necessary logic based on soil conditions, fertilizer, etc.

    # Print "+" for each maize1 plant
    li $v0, 11  # Print character
    li $a0, '$'  # The character to print
    syscall

    # Increment growth counter for maize1
    addi $t3, $t3, 1

    # Check if reached desired growth based on the number of seeds
    blt $t3, $t2, growth_loop_sorghum1

    # Jump to the next plant or end the program after maize1 simulation
    j next_plant                
    

# Similar logic for plant_beans1, plant_sorghum1, etc.

next_plant:
    # Load plant 2 choice into register $t0
    lw $t0, plant2

    # Check if maize or beans seeds were planted for plant 2
    beq $t0, 1, plant_maize2
    beq $t0, 2, plant_beans2
    beq $t0, 3, plant_sorghum2
    # Handle other crops or invalid selection for plant 2

plant_maize2:
    # Simulate planting maize for plant 2
    li $v0, 4
    la $a0, prompt_seeds2
    syscall

    li $v0, 5
    syscall
    sw $v0, seeds2  # Store the number of seeds for plant 2

    # You can use the value in $v0 (maize seeds) to determine the number of plants
    move $t2, $v0  # Number of maize seeds for plant 2

    # Loop to simulate growth for plant_maize2
    li $t3, 0  # Counter for growth
    j growth_loop_maize2  # Jump to the growth loop for maize2

growth_loop_maize2:
    # Simulate growth process for maize2
    # Add any necessary logic based on soil conditions, fertilizer, etc.

    # Print "+" for each maize2 plant
    li $v0, 11  # Print character
    li $a0, '+'  # The character to print
    syscall

    # Increment growth counter for maize2
    addi $t3, $t3, 1

    # Check if reached desired growth based on the number of seeds
    blt $t3, $t2, growth_loop_maize2

    # End the program after maize2 simulation
    j end_simulation

# Continue with the rest of your code

   
      
plant_beans2:
    # Simulate planting maize for plant 2
    li $v0, 4
    la $a0, prompt_seeds2
    syscall

    li $v0, 5
    syscall
    sw $v0, seeds2  # Store the number of seeds for plant 2

    # You can use the value in $v0 (maize seeds) to determine the number of plants
    move $t2, $v0  # Number of maize seeds for plant 2

    # Loop to simulate growth for plant_maize2
    li $t3, 0  # Counter for growth
    j growth_loop_beans2  # Jump to the growth loop for maize2

growth_loop_beans2:
    # Simulate growth process for maize2
    # Add any necessary logic based on soil conditions, fertilizer, etc.

    # Print "+" for each maize2 plant
    li $v0, 11  # Print character
    li $a0, '*'  # The character to print
    syscall

    # Increment growth counter for maize2
    addi $t3, $t3, 1

    # Check if reached desired growth based on the number of seeds
    blt $t3, $t2, growth_loop_beans2

    # End the program after maize2 simulation
    j end_simulation

# Continue with the rest of your code


plant_sorghum2:
    # Simulate planting maize for plant 2
    li $v0, 4
    la $a0, prompt_seeds2
    syscall

    li $v0, 5
    syscall
    sw $v0, seeds2  # Store the number of seeds for plant 2

    # You can use the value in $v0 (maize seeds) to determine the number of plants
    move $t2, $v0  # Number of maize seeds for plant 2

    # Loop to simulate growth for plant_maize2
    li $t3, 0  # Counter for growth
    j growth_loop_sorghum2  # Jump to the growth loop for maize2

growth_loop_sorghum2:
    # Simulate growth process for maize2
    # Add any necessary logic based on soil conditions, fertilizer, etc.

    # Print "+" for each maize2 plant
    li $v0, 11  # Print character
    li $a0, '$'  # The character to print
    syscall

    # Increment growth counter for maize2
    addi $t3, $t3, 1

    # Check if reached desired growth based on the number of seeds
    blt $t3, $t2, growth_loop_sorghum2

    # End the program after maize2 simulation
    j end_simulation



# Continue with the rest of your code
  

    




end_simulation:
    # This label marks the end of the simulation
    # You can add any additional code here if needed

# ... (your existing data section)

        
        
        

        # Print message for successful planting
        li $v0, 4
        la $a0, message_successful_planting
        syscall

        # End the program****************************************
        li $v0, 10
        syscall

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

        # Check planting technique
        beq $t1, 1, intercropping_winter
        beq $t1, 2, relay_crop_winter
        b invalid_technique_winter
    
    
    intercropping_winter:
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

        # Print prompt for number of seeds
        li $v0, 4
        la $a0, prompt_seeds
        syscall

        # Get user input for number of seeds
        li $v0, 5
        syscall
        sw $v0, peas

        # Print message for successful planting
        li $v0, 4
        la $a0, message_successful_planting
        syscall

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
    prompt_length: .asciiz "Enter the length of the plot in meters(m): "
    prompt_width: .asciiz "Enter the width of the plot in meters(m):  "
    prompt_soil: .asciiz "\n\n\nNow prepare the soil for crop production: \n"
    prompt_moisture: .asciiz "Adjust Moisture in the soil in scale from 1 to 10:\nMoisture: "
    prompt_season: .asciiz "\nChoose Sesson by Index:\n1.Summer\n2.Winter\nIndex: "
    prompt_technique: .asciiz "Choose Planting Technique by Index:\n1.Intercropping\n2.Relay Cropping System\nIndex: "
    prompt_seeds: .asciiz "\nEnter Number of seeds for first plant: \n"
    prompt_seeds2: .asciiz "\nEnter Number of seeds for second plant: \n"
    prompt_fertilizer: .asciiz "Adjust nutrients in the soil in scale from 1 to 10:\nFertilizer: "
    message_successful_planting: .asciiz "\nPlants are planted successfully. Wait for Harvest.\n"
    message_invalid_season: .asciiz "Invalid Season!!\n"
    message_invalid_technique: .asciiz "Invalid Planting Technique\n"
    prompt_plant1: .asciiz "\nEnter the plant type for plant 1 (1: Maize, 2: Beans, 3: Sorghum): "
    prompt_plant2: .asciiz "\nEnter the plant type for plant 2 (1: Maize, 2: Beans, 3: Sorghum): "

     #tokelo edit
    welcome_yeild_section: .asciiz "\nwelcome to yield management\n"
    yeild: .asciiz "\nwith this level of   moisture and this soil fertility we can expect  yeild  of percentage of   "
   