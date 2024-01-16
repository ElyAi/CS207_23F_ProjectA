
`define n_do 3'b001
`define n_re 3'b010
`define n_mi 3'b011
`define n_fa 3'b100
`define n_so 3'b101
`define n_la 3'b110
`define n_q1 3'b111
`define n_space 3'b000

`define h_do 7'b0000001
`define h_re 7'b0000010
`define h_mi 7'b0000100
`define h_fa 7'b0001000
`define h_so 7'b0010000
`define h_la 7'b0100000
`define h_q1 7'b1000000
`define h_space 7'b0000000

`define mode_free 3'b001
`define mode_auto 3'b010
`define mode_study 3'b100
`define mode_record 3'b011
`define mode_read 3'b111
`define mode_space 3'b000
`define mode_adjust 3'b101

`define Low_note 2'b10
`define High_note 2'b01

`define sel_s0 3'b000
`define sel_s1 3'b001
`define sel_s2 3'b010
`define sel_s3 3'b100

`define H_SYNC  96
`define H_BACK  40
`define H_LEFT  8
`define H_VALID 640
`define H_RIGHT  8
`define H_FRONT  8
`define H_TOTAL 800

`define V_SYNC 2
`define V_BACK  25
`define V_TOP  8
`define V_VALID  480
`define V_BUTTOM  8
`define V_FRONT  2
`define V_TOTAL  525

`define CHAR_B_H  192
`define CHAR_B_V  208
`define CHAR_W  256
`define CHAR_H  64

`define cCHAR_B_H  64
`define cCHAR_B_V  208
`define cCHAR_W  512
`define cCHAR_H  64

`define aCHAR_B_H  120
`define aCHAR_B_V 420
`define aCHAR_W 512
`define aCHAR_H 32

`define BLACK  12'h000
`define WHITE  12'hFFF
`define BULE   12'h00F

`define ch0 8'b00000001
`define ch1 8'b00000010
`define ch2 8'b00000100
`define ch3 8'b00001000
`define ch4 8'b00010000
`define ch5 8'b00100000
`define ch6 8'b01000000
`define ch7 8'b10000000
`define ch8 8'b11111111

`define dis0 6'b000000
`define dis1 6'b000001
`define dis2 6'b000010
`define dis3 6'b000011
`define dis4 6'b000100
`define dis5 6'b000101
`define dis6 6'b000110
`define dis7 6'b000111
`define dis8 6'b001000
`define dis9 6'b001001
`define dis10 6'b001010
`define dis11 6'b001011
`define dis12 6'b001100
`define dis13 6'b001101
`define dis14 6'b001110
`define dis15 6'b001111
`define dis16 6'b010000
`define dis17 6'b010001
`define dis18 6'b010010
`define dis19 6'b010011
`define dis20 6'b010100
`define dis21 6'b010101
`define dis22 6'b010110
`define dis23 6'b010111

`define tub0 8'b1111_1100
`define tub1 8'b0110_0000
`define tub2 8'b1101_1010
`define tub3 8'b1111_0010
`define tub4 8'b0110_0110
`define tub5 8'b1011_0110
`define tub6 8'b1011_1110
`define tub7 8'b1110_0000
`define tub8 8'b1111_1110
`define tub9 8'b1110_0110
`define tub10 8'b1000_1110
`define tub11 8'b1110_1110
`define tub12 8'b1011_0110
`define tub13 8'b0000_1100
`define tub14 8'b0011_1010
`define tub15 8'b0110_1110
`define tub16 8'b0000_1000
`define tub17 8'b1111_0110
`define tub18 8'b0010_1110
`define tub19 8'b1001_1110
`define tub20 8'b0000_1010
`define tub21 8'b0001_1010
`define tub22 8'b0111_1010
`define tub23 8'b1101_1110

`define cnt0 5'b00000
`define cnt1 5'b00001
`define cnt2 5'b00010
`define cnt3 5'b00011
`define cnt4 5'b00100
`define cnt5 5'b00101
`define cnt6 5'b00110
`define cnt7 5'b00111
`define cnt8 5'b01000
`define cnt9 5'b01001
`define cnt10 5'b01010
`define cnt11 5'b01011
`define cnt12 5'b01100
`define cnt13 5'b01101
`define cnt14 5'b01110
`define cnt15 5'b01111
`define cnt16 5'b10000
`define cnt17 5'b10001
`define cnt18 5'b10010
`define cnt19 5'b10011
`define cnt20 5'b10100
`define auto_s0 6'b010_001
`define auto_s1 6'b010_010
`define auto_s2 6'b010_100

`define s1 17'b000_000_000_000_00_000//start
`define s2 17'b001_000_000_000_00_000//F 0
`define s3 17'b001_000_000_000_00_001//F 1
`define s4 17'b001_000_000_000_00_010//F 2
`define s5 17'b001_000_000_000_00_011//F 3
`define s6 17'b001_000_000_000_00_100//F 4
`define s7 17'b001_000_000_000_00_101//F 5
`define s8 17'b001_000_000_000_00_110//F 6
`define s9 17'b001_000_000_000_00_111//F 7
`define s10 17'b001_000_000_000_10_000//F lo 0
`define s11 17'b001_000_000_000_10_001//F lo 1
`define s12 17'b001_000_000_000_10_010//F lo 2
`define s13 17'b001_000_000_000_10_011//F lo 3
`define s14 17'b001_000_000_000_10_100//F lo 4
`define s15 17'b001_000_000_000_10_101//F lo 5
`define s16 17'b001_000_000_000_10_110//F lo 6
`define s17 17'b001_000_000_000_10_111//F lo 7
`define s18 17'b001_000_000_000_01_000//F High 0
`define s19 17'b001_000_000_000_01_001//F High 1
`define s20 17'b001_000_000_000_01_010//F High 2
`define s21 17'b001_000_000_000_01_011//F High 3
`define s22 17'b001_000_000_000_01_100//F High 4
`define s23 17'b001_000_000_000_01_101//F High 5
`define s24 17'b001_000_000_000_01_110//F High 6
`define s25 17'b001_000_000_000_01_111//F High 7
`define s26 17'b010_000_000_000_00_000//A 0
`define s27 17'b010_001_000_000_00_000//A 1 0
`define s28 17'b010_001_000_000_00_001//A 1 1
`define s29 17'b010_001_000_000_00_010//A 1 2
`define s30 17'b010_001_000_000_00_011//A 1 3
`define s31 17'b010_001_000_000_00_100//A 1 4
`define s32 17'b010_001_000_000_00_101//A 1 5
`define s33 17'b010_001_000_000_00_110//A 1 6
`define s34 17'b010_001_000_000_00_111//A 1 7
`define s35 17'b010_010_000_000_00_000//A 2 0
`define s36 17'b010_010_000_000_00_001//A 2 1
`define s37 17'b010_010_000_000_00_010//A 2 2
`define s38 17'b010_010_000_000_00_011//A 2 3
`define s39 17'b010_010_000_000_00_100//A 2 4
`define s40 17'b010_010_000_000_00_101//A 2 5
`define s41 17'b010_010_000_000_00_110//A 2 6
`define s42 17'b010_010_000_000_00_111//A 2 7
`define s43 17'b010_100_000_000_00_000//A 3 0
`define s44 17'b010_100_000_000_00_001//A 3 1
`define s45 17'b010_100_000_000_00_010//A 3 2
`define s46 17'b010_100_000_000_00_011//A 3 3
`define s47 17'b010_100_000_000_00_100//A 3 4
`define s48 17'b010_100_000_000_00_101//A 3 5
`define s49 17'b010_100_000_000_00_110//A 3 6
`define s50 17'b010_100_000_000_00_111//A 3 7
`define s51 17'b100_000_000_000_00_000//S record
`define s52 17'b100_000_001_000_00_000//S c 
`define s53 17'b100_000_001_001_00_000//S c 
`define s54 17'b100_000_001_010_00_000//S c 
`define s55 17'b100_000_001_011_00_000//S c 
`define s56 17'b100_000_001_100_00_000//S c  
`define s57 17'b100_000_010_000_00_000//S d 
`define s58 17'b100_000_010_001_00_000//S d 
`define s59 17'b100_000_010_010_00_000//S d 
`define s60 17'b100_000_010_011_00_000//S d 
`define s61 17'b100_000_010_100_00_000//S d 
`define s62 17'b100_000_011_000_00_000//S E 
`define s63 17'b100_000_011_001_00_000//S E 
`define s64 17'b100_000_011_010_00_000//S E 
`define s65 17'b100_000_011_011_00_000//S E 
`define s66 17'b100_000_011_100_00_000//S E 
`define s67 17'b100_000_100_000_00_000//S F 
`define s68 17'b100_000_100_001_00_000//S F 
`define s69 17'b100_000_100_010_00_000//S F 
`define s70 17'b100_000_100_011_00_000//S F 
`define s71 17'b100_000_100_100_00_000//S F 
`define s72 17'b011_000_000_000_00_000//record
`define s73 17'b101_000_000_000_00_000//Ad
`define s74 17'b111_000_000_000_00_000//rd

`define note1 381680
`define note2 340136
`define note3 303030
`define note4 285714
`define note5 255102
`define note6 227273
`define note7 202429
`define low_note1 763660
`define low_note2 680272
`define low_note3 606060
`define low_note4 571428
`define low_note5 510204
`define low_note6 454546
`define low_note7 404858
`define high_note1 190840
`define high_note2 170068
`define high_note3 151515
`define high_note4 145857
`define high_note5 127551
`define high_note6 113637
`define high_note7 101215

`define study_state 3'b001
`define selection_state 3'b010
`define store_state 3'b100
`define buffer_state 3'b111
`define store_state_led 7'b0011111
`define buffer_state_led 7'b0111111
`define no_user 3'b000
`define user1 3'b001
`define user2 3'b010
`define user3 3'b100
`define study_model_first_note 6'd0
`define study_model_last_note 6'd41
`define out_cnt 5'b11111
`define out_duration 32'd800000000
`define first_score 5'b11111

`define maxcnt  50000