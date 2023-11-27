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

.text
    main:
        # Print welcome message
        li $v0, 4
        la $a0, welcome_message
        syscall

    plot:
        # Print prompt for length dimensions
        li $v0, 4
        la $a0, prompt_lenght
        syscall

        # Get user input for length 
        li $v0, 5
        syscall
        sw $v0, len
        
        # Print prompt for width dimensions
        li $v0, 4
        la $a0, prompt_width
        syscall
	
	# Get user input for  width
        li $v0, 5
        syscall
        sw $v0, wid

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
        j plot

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
    prompt_lenght: .asciiz "Please Enter the dimensions of the Field:\nLength: "
    prompt_width: .asciiz "Please Enter the dimensions of the Field:\nWidth: "
    prompt_soil: .asciiz "\n\n\nNow prepare the soil for crop production: \n"
    prompt_moisture: .asciiz "Adjust Moisture in the soil in scale from 1 to 10:\nMoisture: "
    prompt_season: .asciiz "Choose Sesson by Index:\n1.Summer\n2.Winter\nIndex: "
    prompt_technique: .asciiz "Choose Planting Technique by Index:\n1.Intercropping\n2.Relay Cropping System\nIndex: "
    prompt_plant1: .asciiz "Choose Plant 1 by Index:\n1.Maize\n2.Beans\n3.Pumpkin\n4.Sorghum\n5.Watermelons\n6.Groundnuts\nIndex: "
    prompt_seeds: .asciiz "Enter Number of seeds: "
    prompt_fertilizer: .asciiz "Adjust nutrients in the soil in scale from 1 to 10:\nFertilizer: "
    message_successful_planting: .asciiz "Plants are planted successfully. Wait for Harvest.\n"
    message_invalid_season: .asciiz "Invalid Season!!\n"
    message_invalid_technique: .asciiz "Invalid Planting Technique\n"
