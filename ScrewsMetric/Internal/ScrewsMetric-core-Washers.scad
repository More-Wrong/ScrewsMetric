//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
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

M2_washerFormA_T = 0.3;
M2_5_washerFormA_T = 0.6;
M3_washerFormA_T = 0.6;
M3_5_washerFormA_T = 0.6;
M4_washerFormA_T = 0.9;
M5_washerFormA_T = 1.1;
M6_washerFormA_T = 1.8;
M8_washerFormA_T = 1.8;
M10_washerFormA_T = 2.2;
M12_washerFormA_T = 2.7;
M14_washerFormA_T = 2.7;
M16_washerFormA_T = 3.3;
M20_washerFormA_T = 3.3;
M24_washerFormA_T = 4.3;


M2_washerFormB_T = undef;
M2_5_washerFormB_T = undef;
M3_washerFormB_T = undef;
M3_5_washerFormB_T = undef;
M4_washerFormB_T = undef;
M5_washerFormB_T = undef;
M6_washerFormB_T = 0.9;
M8_washerFormB_T = 1.1;
M10_washerFormB_T = 1.45;
M12_washerFormB_T = 1.8;
M14_washerFormB_T = 1.8;
M16_washerFormB_T = 2.2;
M20_washerFormB_T = 2.2;
M24_washerFormB_T = 2.7;

M2_washerFormC_T = undef;
M2_5_washerFormC_T = undef;
M3_washerFormC_T = undef;
M3_5_washerFormC_T = undef;
M4_washerFormC_T = 0.9;
M5_washerFormC_T = 1.1;
M6_washerFormC_T = 1.8;
M8_washerFormC_T = 1.8;
M10_washerFormC_T = 2.2;
M12_washerFormC_T = 2.7;
M14_washerFormC_T = 2.7;
M16_washerFormC_T = 3.3;
M20_washerFormC_T = 3.3;
M24_washerFormC_T = 4.3;

M2_washerFormD_T = undef;
M2_5_washerFormD_T = undef;
M3_washerFormD_T = undef;
M3_5_washerFormD_T = undef;
M4_washerFormD_T = undef;
M5_washerFormD_T = undef;
M6_washerFormD_T = 0.9;
M8_washerFormD_T = 1.1;
M10_washerFormD_T = 1.45;
M12_washerFormD_T = 1.8;
M14_washerFormD_T = 1.8;
M16_washerFormD_T = 2.2;
M20_washerFormD_T = 2.2;
M24_washerFormD_T = 2.7;

M2_washerFormE_T = undef;
M2_5_washerFormE_T = undef;
M3_washerFormE_T = undef;
M3_5_washerFormE_T = undef;
M4_washerFormE_T = undef;
M5_washerFormE_T = 1.2;
M6_washerFormE_T = 1.9;
M8_washerFormE_T = 1.9;
M10_washerFormE_T = 2.3;
M12_washerFormE_T = 2.8;
M14_washerFormE_T = 2.8;
M16_washerFormE_T = 3.6;
M20_washerFormE_T = 3.6;
M24_washerFormE_T = 4.6;

M2_washerFormF_T = undef;
M2_5_washerFormF_T = undef;
M3_washerFormF_T = undef;
M3_5_washerFormF_T = undef;
M4_washerFormF_T = undef;
M5_washerFormF_T = undef;
M6_washerFormF_T = undef;
M8_washerFormF_T = 1.9;
M10_washerFormF_T = 2.3;
M12_washerFormF_T = 2.8;
M14_washerFormF_T = 2.8;
M16_washerFormF_T = 3.6;
M20_washerFormF_T = 3.6;
M24_washerFormF_T = 4.6;

M2_washerFormG_T = undef;
M2_5_washerFormG_T = undef;
M3_washerFormG_T = undef;
M3_5_washerFormG_T = undef;
M4_washerFormG_T = undef;
M5_washerFormG_T = 1.9;
M6_washerFormG_T = 2.3;
M8_washerFormG_T = 2.3;
M10_washerFormG_T = 2.8;
M12_washerFormG_T = 3.6;
M14_washerFormG_T = 3.6;
M16_washerFormG_T = 4.6;
M20_washerFormG_T = 6;
M24_washerFormG_T = 7;




M2_washerFormA_B_OuterD = 5;
M2_5_washerFormA_B_OuterD = 6;
M3_washerFormA_B_OuterD = 7;
M3_5_washerFormA_B_OuterD = 8;
M4_washerFormA_B_OuterD = 9;
M5_washerFormA_B_OuterD = 10;
M6_washerFormA_B_OuterD = 12.5;
M8_washerFormA_B_OuterD = 17;
M10_washerFormA_B_OuterD = 21;
M12_washerFormA_B_OuterD = 24;
M14_washerFormA_B_OuterD = 28;
M16_washerFormA_B_OuterD = 30;
M20_washerFormA_B_OuterD = 37;
M24_washerFormA_B_OuterD = 44;

M2_washerFormC_D_OuterD = undef;
M2_5_washerFormC_D_OuterD = undef;
M3_washerFormC_D_OuterD = undef;
M3_5_washerFormC_D_OuterD = undef;
M4_washerFormC_D_OuterD = 10;
M5_washerFormC_D_OuterD = 12.5;
M6_washerFormC_D_OuterD = 14;
M8_washerFormC_D_OuterD = 21;
M10_washerFormC_D_OuterD = 24;
M12_washerFormC_D_OuterD = 28;
M14_washerFormC_D_OuterD = 30;
M16_washerFormC_D_OuterD = 34;
M20_washerFormC_D_OuterD = 39;
M24_washerFormC_D_OuterD = 50;

M2_washerFormE_OuterD = undef;
M2_5_washerFormE_OuterD = undef;
M3_washerFormE_OuterD = undef;
M3_5_washerFormE_OuterD = undef;
M4_washerFormE_OuterD = undef;
M5_washerFormE_OuterD = 10;
M6_washerFormE_OuterD = 12.5;
M8_washerFormE_OuterD = 17;
M10_washerFormE_OuterD = 21;
M12_washerFormE_OuterD = 24;
M14_washerFormE_OuterD = 28;
M16_washerFormE_OuterD = 30;
M20_washerFormE_OuterD = 37;
M24_washerFormE_OuterD = 44;

M2_washerFormF_OuterD = undef;
M2_5_washerFormF_OuterD = undef;
M3_washerFormF_OuterD = undef;
M3_5_washerFormF_OuterD = undef;
M4_washerFormF_OuterD = undef;
M5_washerFormF_OuterD = undef;
M6_washerFormF_OuterD = undef;
M8_washerFormF_OuterD = 21;
M10_washerFormF_OuterD = 24;
M12_washerFormF_OuterD = 28;
M14_washerFormF_OuterD = 30;
M16_washerFormF_OuterD = 34;
M20_washerFormF_OuterD = 39;
M24_washerFormF_OuterD = 50;

M2_washerFormG_OuterD = undef;
M2_5_washerFormG_OuterD = undef;
M3_washerFormG_OuterD = undef;
M3_5_washerFormG_OuterD = undef;
M4_washerFormG_OuterD = undef;
M5_washerFormG_OuterD = 15;
M6_washerFormG_OuterD = 18;
M8_washerFormG_OuterD = 21;
M10_washerFormG_OuterD = 30;
M12_washerFormG_OuterD = 36;
M14_washerFormG_OuterD = 42;
M16_washerFormG_OuterD = 48;
M20_washerFormG_OuterD = 60;
M24_washerFormG_OuterD = 72;


//(WasherForm[ABCDEFG]_(?:T|OuterD) = \n)(M[\d_]*)\n
//\1\2\1


//\[(M[\d_]*)\]
//["\1", "\1 washerFormA", "\1 washerFormB", "\1 washerFormC", "\1 washerFormD", "\1 washerFormE", "\1 washerFormF", "\1 washerFormG"]

//\[(M[\d_]*);([^\]]*)\]
//["\1", \1_washerFormA_B\2, \1_washerFormA_B\2, \1_washerFormC_D\2, \1_washerFormC_D\2, \1_washerFormE\2, \1_washerFormF\2, \1_washerFormG\2]
//["\1", \1_washerFormA\2, \1_washerFormB\2, \1_washerFormC\2, \1_washerFormD\2, \1_washerFormE\2, \1_washerFormF\2, \1_washerFormG\2]

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
["M2 washerOuterD", M2_washerFormA_B_OuterD, M2_washerFormA_B_OuterD, M2_washerFormC_D_OuterD, M2_washerFormC_D_OuterD, M2_washerFormE_OuterD, M2_washerFormF_OuterD, M2_washerFormG_OuterD], 
["M3 washerOuterD", M3_washerFormA_B_OuterD, M3_washerFormA_B_OuterD, M3_washerFormC_D_OuterD, M3_washerFormC_D_OuterD, M3_washerFormE_OuterD, M3_washerFormF_OuterD, M3_washerFormG_OuterD], 
["M4 washerOuterD", M4_washerFormA_B_OuterD, M4_washerFormA_B_OuterD, M4_washerFormC_D_OuterD, M4_washerFormC_D_OuterD, M4_washerFormE_OuterD, M4_washerFormF_OuterD, M4_washerFormG_OuterD], 
["M5 washerOuterD", M5_washerFormA_B_OuterD, M5_washerFormA_B_OuterD, M5_washerFormC_D_OuterD, M5_washerFormC_D_OuterD, M5_washerFormE_OuterD, M5_washerFormF_OuterD, M5_washerFormG_OuterD], 
["M6 washerOuterD", M6_washerFormA_B_OuterD, M6_washerFormA_B_OuterD, M6_washerFormC_D_OuterD, M6_washerFormC_D_OuterD, M6_washerFormE_OuterD, M6_washerFormF_OuterD, M6_washerFormG_OuterD], 
["M8 washerOuterD", M8_washerFormA_B_OuterD, M8_washerFormA_B_OuterD, M8_washerFormC_D_OuterD, M8_washerFormC_D_OuterD, M8_washerFormE_OuterD, M8_washerFormF_OuterD, M8_washerFormG_OuterD], 
["M10 washerOuterD", M10_washerFormA_B_OuterD, M10_washerFormA_B_OuterD, M10_washerFormC_D_OuterD, M10_washerFormC_D_OuterD, M10_washerFormE_OuterD, M10_washerFormF_OuterD, M10_washerFormG_OuterD], 
["M12 washerOuterD", M12_washerFormA_B_OuterD, M12_washerFormA_B_OuterD, M12_washerFormC_D_OuterD, M12_washerFormC_D_OuterD, M12_washerFormE_OuterD, M12_washerFormF_OuterD, M12_washerFormG_OuterD], 
["M2_5 washerOuterD", M2_5_washerFormA_B_OuterD, M2_5_washerFormA_B_OuterD, M2_5_washerFormC_D_OuterD, M2_5_washerFormC_D_OuterD, M2_5_washerFormE_OuterD, M2_5_washerFormF_OuterD, M2_5_washerFormG_OuterD], 
["M3_5 washerOuterD", M3_5_washerFormA_B_OuterD, M3_5_washerFormA_B_OuterD, M3_5_washerFormC_D_OuterD, M3_5_washerFormC_D_OuterD, M3_5_washerFormE_OuterD, M3_5_washerFormF_OuterD, M3_5_washerFormG_OuterD], 
["M14 washerOuterD", M14_washerFormA_B_OuterD, M14_washerFormA_B_OuterD, M14_washerFormC_D_OuterD, M14_washerFormC_D_OuterD, M14_washerFormE_OuterD, M14_washerFormF_OuterD, M14_washerFormG_OuterD], 
["M16 washerOuterD", M16_washerFormA_B_OuterD, M16_washerFormA_B_OuterD, M16_washerFormC_D_OuterD, M16_washerFormC_D_OuterD, M16_washerFormE_OuterD, M16_washerFormF_OuterD, M16_washerFormG_OuterD], 
["M20 washerOuterD", M20_washerFormA_B_OuterD, M20_washerFormA_B_OuterD, M20_washerFormC_D_OuterD, M20_washerFormC_D_OuterD, M20_washerFormE_OuterD, M20_washerFormF_OuterD, M20_washerFormG_OuterD], 
["M24 washerOuterD", M24_washerFormA_B_OuterD, M24_washerFormA_B_OuterD, M24_washerFormC_D_OuterD, M24_washerFormC_D_OuterD, M24_washerFormE_OuterD, M24_washerFormF_OuterD, M24_washerFormG_OuterD]],
[["washerT", "washerFormA washerT", "washerFormB washerT", "washerFormC washerT", "washerFormD washerT", "washerFormE washerT", "washerFormF washerT", "washerFormG washerT"], 
["M2 washerT", M2_washerFormA_T, M2_washerFormB_T, M2_washerFormC_T, M2_washerFormD_T, M2_washerFormE_T, M2_washerFormF_T, M2_washerFormG_T], 
["M3 washerT", M3_washerFormA_T, M3_washerFormB_T, M3_washerFormC_T, M3_washerFormD_T, M3_washerFormE_T, M3_washerFormF_T, M3_washerFormG_T], 
["M4 washerT", M4_washerFormA_T, M4_washerFormB_T, M4_washerFormC_T, M4_washerFormD_T, M4_washerFormE_T, M4_washerFormF_T, M4_washerFormG_T], 
["M5 washerT", M5_washerFormA_T, M5_washerFormB_T, M5_washerFormC_T, M5_washerFormD_T, M5_washerFormE_T, M5_washerFormF_T, M5_washerFormG_T], 
["M6 washerT", M6_washerFormA_T, M6_washerFormB_T, M6_washerFormC_T, M6_washerFormD_T, M6_washerFormE_T, M6_washerFormF_T, M6_washerFormG_T], 
["M8 washerT", M8_washerFormA_T, M8_washerFormB_T, M8_washerFormC_T, M8_washerFormD_T, M8_washerFormE_T, M8_washerFormF_T, M8_washerFormG_T], 
["M10 washerT", M10_washerFormA_T, M10_washerFormB_T, M10_washerFormC_T, M10_washerFormD_T, M10_washerFormE_T, M10_washerFormF_T, M10_washerFormG_T], 
["M12 washerT", M12_washerFormA_T, M12_washerFormB_T, M12_washerFormC_T, M12_washerFormD_T, M12_washerFormE_T, M12_washerFormF_T, M12_washerFormG_T], 
["M2_5 washerT", M2_5_washerFormA_T, M2_5_washerFormB_T, M2_5_washerFormC_T, M2_5_washerFormD_T, M2_5_washerFormE_T, M2_5_washerFormF_T, M2_5_washerFormG_T], 
["M3_5 washerT", M3_5_washerFormA_T, M3_5_washerFormB_T, M3_5_washerFormC_T, M3_5_washerFormD_T, M3_5_washerFormE_T, M3_5_washerFormF_T, M3_5_washerFormG_T], 
["M14 washerT", M14_washerFormA_T, M14_washerFormB_T, M14_washerFormC_T, M14_washerFormD_T, M14_washerFormE_T, M14_washerFormF_T, M14_washerFormG_T], 
["M16 washerT", M16_washerFormA_T, M16_washerFormB_T, M16_washerFormC_T, M16_washerFormD_T, M16_washerFormE_T, M16_washerFormF_T, M16_washerFormG_T], 
["M20 washerT", M20_washerFormA_T, M20_washerFormB_T, M20_washerFormC_T, M20_washerFormD_T, M20_washerFormE_T, M20_washerFormF_T, M20_washerFormG_T], 
["M24 washerT", M24_washerFormA_T, M24_washerFormB_T, M24_washerFormC_T, M24_washerFormD_T, M24_washerFormE_T, M24_washerFormF_T, M24_washerFormG_T]]];

function M_WasherDimensions(a, b, c) = M_WasherDimensions[c][a][b]!=undef?M_WasherDimensions[c][a][b]/Units==undef?M_WasherDimensions[c][a][b]:M_WasherDimensions[c][a][b]/Units:ScrewsMetric_washer_dimension_not_found___Try_another_type();

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