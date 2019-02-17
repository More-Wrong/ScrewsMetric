//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 2.1 See http://creativecommons.org/licenses/LGPL/2.1/
include<ScrewsMetric-core.scad>;


washerFormA = 1;
washerFormB = 2;
washerFormC = 3;
washerFormD = 4;
washerFormE = 5;
washerFormF = 6;
washerFormG = 7;

washerOuterD = 1;
washerT = 2;

M2_WasherFormA_T = 0.3;
M2_5_WasherFormA_T = 0.6;
M3_WasherFormA_T = 0.6;
M3_5_WasherFormA_T = 0.6;
M4_WasherFormA_T = 0.9;
M5_WasherFormA_T = 1.1;
M6_WasherFormA_T = 1.8;
M8_WasherFormA_T = 1.8;
M10_WasherFormA_T = 2.2;
M12_WasherFormA_T = 2.7;
M14_WasherFormA_T = 2.7;
M16_WasherFormA_T = 3.3;
M20_WasherFormA_T = 3.3;
M24_WasherFormA_T = 4.3;


M2_WasherFormB_T = undef;
M2_5_WasherFormB_T = undef;
M3_WasherFormB_T = undef;
M3_5_WasherFormB_T = undef;
M4_WasherFormB_T = undef;
M5_WasherFormB_T = undef;
M6_WasherFormB_T = 0.9;
M8_WasherFormB_T = 1.1;
M10_WasherFormB_T = 1.45;
M12_WasherFormB_T = 1.8;
M14_WasherFormB_T = 1.8;
M16_WasherFormB_T = 2.2;
M20_WasherFormB_T = 2.2;
M24_WasherFormB_T = 2.7;

M2_WasherFormC_T = undef;
M2_5_WasherFormC_T = undef;
M3_WasherFormC_T = undef;
M3_5_WasherFormC_T = undef;
M4_WasherFormC_T = 0.9;
M5_WasherFormC_T = 1.1;
M6_WasherFormC_T = 1.8;
M8_WasherFormC_T = 1.8;
M10_WasherFormC_T = 2.2;
M12_WasherFormC_T = 2.7;
M14_WasherFormC_T = 2.7;
M16_WasherFormC_T = 3.3;
M20_WasherFormC_T = 3.3;
M24_WasherFormC_T = 4.3;

M2_WasherFormD_T = undef;
M2_5_WasherFormD_T = undef;
M3_WasherFormD_T = undef;
M3_5_WasherFormD_T = undef;
M4_WasherFormD_T = undef;
M5_WasherFormD_T = undef;
M6_WasherFormD_T = 0.9;
M8_WasherFormD_T = 1.1;
M10_WasherFormD_T = 1.45;
M12_WasherFormD_T = 1.8;
M14_WasherFormD_T = 1.8;
M16_WasherFormD_T = 2.2;
M20_WasherFormD_T = 2.2;
M24_WasherFormD_T = 2.7;

M2_WasherFormE_T = undef;
M2_5_WasherFormE_T = undef;
M3_WasherFormE_T = undef;
M3_5_WasherFormE_T = undef;
M4_WasherFormE_T = undef;
M5_WasherFormE_T = 1.2;
M6_WasherFormE_T = 1.9;
M8_WasherFormE_T = 1.9;
M10_WasherFormE_T = 2.3;
M12_WasherFormE_T = 2.8;
M14_WasherFormE_T = 2.8;
M16_WasherFormE_T = 3.6;
M20_WasherFormE_T = 3.6;
M24_WasherFormE_T = 4.6;

M2_WasherFormF_T = undef;
M2_5_WasherFormF_T = undef;
M3_WasherFormF_T = undef;
M3_5_WasherFormF_T = undef;
M4_WasherFormF_T = undef;
M5_WasherFormF_T = undef;
M6_WasherFormF_T = undef;
M8_WasherFormF_T = 1.9;
M10_WasherFormF_T = 2.3;
M12_WasherFormF_T = 2.8;
M14_WasherFormF_T = 2.8;
M16_WasherFormF_T = 3.6;
M20_WasherFormF_T = 3.6;
M24_WasherFormF_T = 4.6;

M2_WasherFormG_T = undef;
M2_5_WasherFormG_T = undef;
M3_WasherFormG_T = undef;
M3_5_WasherFormG_T = undef;
M4_WasherFormG_T = undef;
M5_WasherFormG_T = 1.9;
M6_WasherFormG_T = 2.3;
M8_WasherFormG_T = 2.3;
M10_WasherFormG_T = 2.8;
M12_WasherFormG_T = 3.6;
M14_WasherFormG_T = 3.6;
M16_WasherFormG_T = 4.6;
M20_WasherFormG_T = 6;
M24_WasherFormG_T = 7;




M2_WasherFormA_B_OuterD = 5;
M2_5_WasherFormA_B_OuterD = 6;
M3_WasherFormA_B_OuterD = 7;
M3_5_WasherFormA_B_OuterD = 8;
M4_WasherFormA_B_OuterD = 9;
M5_WasherFormA_B_OuterD = 10;
M6_WasherFormA_B_OuterD = 12.5;
M8_WasherFormA_B_OuterD = 17;
M10_WasherFormA_B_OuterD = 21;
M12_WasherFormA_B_OuterD = 24;
M14_WasherFormA_B_OuterD = 28;
M16_WasherFormA_B_OuterD = 30;
M20_WasherFormA_B_OuterD = 37;
M24_WasherFormA_B_OuterD = 44;

M2_WasherFormC_D_OuterD = undef;
M2_5_WasherFormC_D_OuterD = undef;
M3_WasherFormC_D_OuterD = undef;
M3_5_WasherFormC_D_OuterD = undef;
M4_WasherFormC_D_OuterD = 10;
M5_WasherFormC_D_OuterD = 12.5;
M6_WasherFormC_D_OuterD = 14;
M8_WasherFormC_D_OuterD = 21;
M10_WasherFormC_D_OuterD = 24;
M12_WasherFormC_D_OuterD = 28;
M14_WasherFormC_D_OuterD = 30;
M16_WasherFormC_D_OuterD = 34;
M20_WasherFormC_D_OuterD = 39;
M24_WasherFormC_D_OuterD = 50;

M2_WasherFormE_OuterD = undef;
M2_5_WasherFormE_OuterD = undef;
M3_WasherFormE_OuterD = undef;
M3_5_WasherFormE_OuterD = undef;
M4_WasherFormE_OuterD = undef;
M5_WasherFormE_OuterD = 10;
M6_WasherFormE_OuterD = 12.5;
M8_WasherFormE_OuterD = 17;
M10_WasherFormE_OuterD = 21;
M12_WasherFormE_OuterD = 24;
M14_WasherFormE_OuterD = 28;
M16_WasherFormE_OuterD = 30;
M20_WasherFormE_OuterD = 37;
M24_WasherFormE_OuterD = 44;

M2_WasherFormF_OuterD = undef;
M2_5_WasherFormF_OuterD = undef;
M3_WasherFormF_OuterD = undef;
M3_5_WasherFormF_OuterD = undef;
M4_WasherFormF_OuterD = undef;
M5_WasherFormF_OuterD = undef;
M6_WasherFormF_OuterD = undef;
M8_WasherFormF_OuterD = 21;
M10_WasherFormF_OuterD = 24;
M12_WasherFormF_OuterD = 28;
M14_WasherFormF_OuterD = 30;
M16_WasherFormF_OuterD = 34;
M20_WasherFormF_OuterD = 39;
M24_WasherFormF_OuterD = 50;

M2_WasherFormG_OuterD = undef;
M2_5_WasherFormG_OuterD = undef;
M3_WasherFormG_OuterD = undef;
M3_5_WasherFormG_OuterD = undef;
M4_WasherFormG_OuterD = undef;
M5_WasherFormG_OuterD = 15;
M6_WasherFormG_OuterD = 18;
M8_WasherFormG_OuterD = 21;
M10_WasherFormG_OuterD = 30;
M12_WasherFormG_OuterD = 36;
M14_WasherFormG_OuterD = 42;
M16_WasherFormG_OuterD = 48;
M20_WasherFormG_OuterD = 60;
M24_WasherFormG_OuterD = 72;


//(WasherForm[ABCDEFG]_(?:T|OuterD) = \n)(M[\d_]*)\n
//\1\2\1


//\[(M[\d_]*)\]
//["\1", "\1 washerFormA", "\1 washerFormB", "\1 washerFormC", "\1 washerFormD", "\1 washerFormE", "\1 washerFormF", "\1 washerFormG"]

//\[(M[\d_]*);([^\]]*)\]
//["\1", \1_WasherFormA_B\2, \1_WasherFormA_B\2, \1_WasherFormC_D\2, \1_WasherFormC_D\2, \1_WasherFormE\2, \1_WasherFormF\2, \1_WasherFormG\2]
//["\1", \1_WasherFormA\2, \1_WasherFormB\2, \1_WasherFormC\2, \1_WasherFormD\2, \1_WasherFormE\2, \1_WasherFormF\2, \1_WasherFormG\2]

M_WasherDimensions = [[["Washer", "washerFormA", "washerFormB", "washerFormC", "washerFormD", "washerFormE", "washerFormF", "washerFormG"], 
["M2", "M2 washerFormA", "M2 washerFormB", "M2 washerFormC", "M2 washerFormD", "M2 washerFormE", "M2 washerFormF", "M2 washerFormG"], 
["M3", "M3 washerFormA", "M3 washerFormB", "M3 washerFormC", "M3 washerFormD", "M3 washerFormE", "M3 washerFormF", "M3 washerFormG"], 
["M4", "M4 washerFormA", "M4 washerFormB", "M4 washerFormC", "M4 washerFormD", "M4 washerFormE", "M4 washerFormF", "M4 washerFormG"], 
["M5", "M5 washerFormA", "M5 washerFormB", "M5 washerFormC", "M5 washerFormD", "M5 washerFormE", "M5 washerFormF", "M5 washerFormG"], 
["M6", "M6 washerFormA", "M6 washerFormB", "M6 washerFormC", "M6 washerFormD", "M6 washerFormE", "M6 washerFormF", "M6 washerFormG"], 
["M8", "M8 washerFormA", "M8 washerFormB", "M8 washerFormC", "M8 washerFormD", "M8 washerFormE", "M8 washerFormF", "M8 washerFormG"], 
["M10", "M10 washerFormA", "M10 washerFormB", "M10 washerFormC", "M10 washerFormD", "M10 washerFormE", "M10 washerFormF", "M10 washerFormG"], 
["M12", "M12 washerFormA", "M12 washerFormB", "M12 washerFormC", "M12 washerFormD", "M12 washerFormE", "M12 washerFormF", "M12 washerFormG"], 
["M2_5", "M2_5 washerFormA", "M2_5 washerFormB", "M2_5 washerFormC", "M2_5 washerFormD", "M2_5 washerFormE", "M2_5 washerFormF", "M2_5 washerFormG"], 
["M3_5", "M3_5 washerFormA", "M3_5 washerFormB", "M3_5 washerFormC", "M3_5 washerFormD", "M3_5 washerFormE", "M3_5 washerFormF", "M3_5 washerFormG"], 
["M14", "M14 washerFormA", "M14 washerFormB", "M14 washerFormC", "M14 washerFormD", "M14 washerFormE", "M14 washerFormF", "M14 washerFormG"], 
["M16", "M16 washerFormA", "M16 washerFormB", "M16 washerFormC", "M16 washerFormD", "M16 washerFormE", "M16 washerFormF", "M16 washerFormG"], 
["M20", "M20 washerFormA", "M20 washerFormB", "M20 washerFormC", "M20 washerFormD", "M20 washerFormE", "M20 washerFormF", "M20 washerFormG"], 
["M24", "M24 washerFormA", "M24 washerFormB", "M24 washerFormC", "M24 washerFormD", "M24 washerFormE", "M24 washerFormF", "M24 washerFormG"]], 
[["washerOuterD", "washerFormA washerOuterD", "washerFormB washerOuterD", "washerFormC washerOuterD", "washerFormD washerOuterD", "washerFormE washerOuterD", "washerFormF washerOuterD", "washerFormG washerOuterD"], 
["M2 washerOuterD", M2_WasherFormA_B_OuterD, M2_WasherFormA_B_OuterD, M2_WasherFormC_D_OuterD, M2_WasherFormC_D_OuterD, M2_WasherFormE_OuterD, M2_WasherFormF_OuterD, M2_WasherFormG_OuterD], 
["M3 washerOuterD", M3_WasherFormA_B_OuterD, M3_WasherFormA_B_OuterD, M3_WasherFormC_D_OuterD, M3_WasherFormC_D_OuterD, M3_WasherFormE_OuterD, M3_WasherFormF_OuterD, M3_WasherFormG_OuterD], 
["M4 washerOuterD", M4_WasherFormA_B_OuterD, M4_WasherFormA_B_OuterD, M4_WasherFormC_D_OuterD, M4_WasherFormC_D_OuterD, M4_WasherFormE_OuterD, M4_WasherFormF_OuterD, M4_WasherFormG_OuterD], 
["M5 washerOuterD", M5_WasherFormA_B_OuterD, M5_WasherFormA_B_OuterD, M5_WasherFormC_D_OuterD, M5_WasherFormC_D_OuterD, M5_WasherFormE_OuterD, M5_WasherFormF_OuterD, M5_WasherFormG_OuterD], 
["M6 washerOuterD", M6_WasherFormA_B_OuterD, M6_WasherFormA_B_OuterD, M6_WasherFormC_D_OuterD, M6_WasherFormC_D_OuterD, M6_WasherFormE_OuterD, M6_WasherFormF_OuterD, M6_WasherFormG_OuterD], 
["M8 washerOuterD", M8_WasherFormA_B_OuterD, M8_WasherFormA_B_OuterD, M8_WasherFormC_D_OuterD, M8_WasherFormC_D_OuterD, M8_WasherFormE_OuterD, M8_WasherFormF_OuterD, M8_WasherFormG_OuterD], 
["M10 washerOuterD", M10_WasherFormA_B_OuterD, M10_WasherFormA_B_OuterD, M10_WasherFormC_D_OuterD, M10_WasherFormC_D_OuterD, M10_WasherFormE_OuterD, M10_WasherFormF_OuterD, M10_WasherFormG_OuterD], 
["M12 washerOuterD", M12_WasherFormA_B_OuterD, M12_WasherFormA_B_OuterD, M12_WasherFormC_D_OuterD, M12_WasherFormC_D_OuterD, M12_WasherFormE_OuterD, M12_WasherFormF_OuterD, M12_WasherFormG_OuterD], 
["M2_5 washerOuterD", M2_5_WasherFormA_B_OuterD, M2_5_WasherFormA_B_OuterD, M2_5_WasherFormC_D_OuterD, M2_5_WasherFormC_D_OuterD, M2_5_WasherFormE_OuterD, M2_5_WasherFormF_OuterD, M2_5_WasherFormG_OuterD], 
["M3_5 washerOuterD", M3_5_WasherFormA_B_OuterD, M3_5_WasherFormA_B_OuterD, M3_5_WasherFormC_D_OuterD, M3_5_WasherFormC_D_OuterD, M3_5_WasherFormE_OuterD, M3_5_WasherFormF_OuterD, M3_5_WasherFormG_OuterD], 
["M14 washerOuterD", M14_WasherFormA_B_OuterD, M14_WasherFormA_B_OuterD, M14_WasherFormC_D_OuterD, M14_WasherFormC_D_OuterD, M14_WasherFormE_OuterD, M14_WasherFormF_OuterD, M14_WasherFormG_OuterD], 
["M16 washerOuterD", M16_WasherFormA_B_OuterD, M16_WasherFormA_B_OuterD, M16_WasherFormC_D_OuterD, M16_WasherFormC_D_OuterD, M16_WasherFormE_OuterD, M16_WasherFormF_OuterD, M16_WasherFormG_OuterD], 
["M20 washerOuterD", M20_WasherFormA_B_OuterD, M20_WasherFormA_B_OuterD, M20_WasherFormC_D_OuterD, M20_WasherFormC_D_OuterD, M20_WasherFormE_OuterD, M20_WasherFormF_OuterD, M20_WasherFormG_OuterD], 
["M24 washerOuterD", M24_WasherFormA_B_OuterD, M24_WasherFormA_B_OuterD, M24_WasherFormC_D_OuterD, M24_WasherFormC_D_OuterD, M24_WasherFormE_OuterD, M24_WasherFormF_OuterD, M24_WasherFormG_OuterD]],
[["washerT", "washerFormA washerT", "washerFormB washerT", "washerFormC washerT", "washerFormD washerT", "washerFormE washerT", "washerFormF washerT", "washerFormG washerT"], 
["M2 washerT", M2_WasherFormA_T, M2_WasherFormB_T, M2_WasherFormC_T, M2_WasherFormD_T, M2_WasherFormE_T, M2_WasherFormF_T, M2_WasherFormG_T], 
["M3 washerT", M3_WasherFormA_T, M3_WasherFormB_T, M3_WasherFormC_T, M3_WasherFormD_T, M3_WasherFormE_T, M3_WasherFormF_T, M3_WasherFormG_T], 
["M4 washerT", M4_WasherFormA_T, M4_WasherFormB_T, M4_WasherFormC_T, M4_WasherFormD_T, M4_WasherFormE_T, M4_WasherFormF_T, M4_WasherFormG_T], 
["M5 washerT", M5_WasherFormA_T, M5_WasherFormB_T, M5_WasherFormC_T, M5_WasherFormD_T, M5_WasherFormE_T, M5_WasherFormF_T, M5_WasherFormG_T], 
["M6 washerT", M6_WasherFormA_T, M6_WasherFormB_T, M6_WasherFormC_T, M6_WasherFormD_T, M6_WasherFormE_T, M6_WasherFormF_T, M6_WasherFormG_T], 
["M8 washerT", M8_WasherFormA_T, M8_WasherFormB_T, M8_WasherFormC_T, M8_WasherFormD_T, M8_WasherFormE_T, M8_WasherFormF_T, M8_WasherFormG_T], 
["M10 washerT", M10_WasherFormA_T, M10_WasherFormB_T, M10_WasherFormC_T, M10_WasherFormD_T, M10_WasherFormE_T, M10_WasherFormF_T, M10_WasherFormG_T], 
["M12 washerT", M12_WasherFormA_T, M12_WasherFormB_T, M12_WasherFormC_T, M12_WasherFormD_T, M12_WasherFormE_T, M12_WasherFormF_T, M12_WasherFormG_T], 
["M2_5 washerT", M2_5_WasherFormA_T, M2_5_WasherFormB_T, M2_5_WasherFormC_T, M2_5_WasherFormD_T, M2_5_WasherFormE_T, M2_5_WasherFormF_T, M2_5_WasherFormG_T], 
["M3_5 washerT", M3_5_WasherFormA_T, M3_5_WasherFormB_T, M3_5_WasherFormC_T, M3_5_WasherFormD_T, M3_5_WasherFormE_T, M3_5_WasherFormF_T, M3_5_WasherFormG_T], 
["M14 washerT", M14_WasherFormA_T, M14_WasherFormB_T, M14_WasherFormC_T, M14_WasherFormD_T, M14_WasherFormE_T, M14_WasherFormF_T, M14_WasherFormG_T], 
["M16 washerT", M16_WasherFormA_T, M16_WasherFormB_T, M16_WasherFormC_T, M16_WasherFormD_T, M16_WasherFormE_T, M16_WasherFormF_T, M16_WasherFormG_T], 
["M20 washerT", M20_WasherFormA_T, M20_WasherFormB_T, M20_WasherFormC_T, M20_WasherFormD_T, M20_WasherFormE_T, M20_WasherFormF_T, M20_WasherFormG_T], 
["M24 washerT", M24_WasherFormA_T, M24_WasherFormB_T, M24_WasherFormC_T, M24_WasherFormD_T, M24_WasherFormE_T, M24_WasherFormF_T, M24_WasherFormG_T]]];

function M_WasherDimensions(a, b, c) = M_WasherDimensions[c][a][b]!=undef?M_WasherDimensions[c][a][b]:ScrewsMetric_washer_dimension_not_found___Try_another_type();

function ScrewsMetric_washer_dimension_not_found___Try_another_type() = SG_proceedOnError?undef:ScrewsMetric_washer_dimension_not_found___Try_another_type();

function isValueInScrewsMetricWasher(a, b, c) = M_WasherDimensions[c][a][b]!=undef;

function M_getWasherT(a, b) = M_WasherDimensions(a, b, washerT);
function M_getWasherOuterD(a, b) = M_WasherDimensions(a, b, washerOuterD);

module M_Washer(form, size, ERR = 0, hollow = false, VertERR = 0){
   difference(){
      cylinder(d = M_WasherDimensions(size, form, washerOuterD)+ERR*2, h = M_WasherDimensions(size, form, washerT)+VertERR);
      if(hollow)translate([0, 0, -0.001])cylinder(d = M_getRodD(size), h = M_WasherDimensions(size, form, washerT)+VertERR+0.002);
   }
   if(!hollow&&GHOST){
      %M_Washer(form, size, 0, true);
   }
}

module FormAWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormA, size, ERR, hollow, VertERR);
}

module FormBWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormB, size, ERR, hollow, VertERR);
}

module FormCWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormC, size, ERR, hollow, VertERR);
}

module FormDWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormD, size, ERR, hollow, VertERR);
}

module FormEWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormE, size, ERR, hollow, VertERR);
}

module FormFWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormF, size, ERR, hollow, VertERR);
}

module FormGWasher(size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(washerFormG, size, ERR, hollow, VertERR);
}