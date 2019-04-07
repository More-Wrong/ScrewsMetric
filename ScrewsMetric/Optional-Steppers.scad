//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-sizeDeclaration.scad>;

Nema08 = 1;
Nema11 = 2;
Nema14 = 3;
Nema17 = 4;
Nema23 = 5;
Nema24 = 6;
Nema34 = 7;
Nema42 = 8;

stepperBoltSeperation = 1;
stepperWidth = 2;
stepperBoltSize = 3;
stepperShaftD = 4;
stepperCircleD = 5;
stepperCircleT = 6;
stepperCornerEffectLevel = 7;   //rendering only, not accurate, not especially well defined, do not use
stepperPlateT = 8;              //rendering only, not accurate, not especially well defined, do not use

echo(str(SCREWS_SYSTEM_MODE, " Steppers system loaded, this is an optional additional section. To retrive information use stepperStats, for example: 'stepperStats(Nema08, stepperWidth)'\n'stepper()' provides cut out for a stepper of the chosen size\n'getStepperBoltPositions()' provides an array of the locations of the bolts relative to the top corner of the motor\n"));
echo("Available Stepper Sizes: 'Nema08' 'Nema11' 'Nema14' 'Nema17' 'Nema23' 'Nema24' 'Nema34' 'Nema42'\n");
echo("Available Stepper Information: 'stepperBoltSeperation' 'stepperWidth' 'stepperBoltSize' 'stepperShaftD' 'stepperCircleD' 'stepperCircleT'\n");

Nema08_stepperBoltSeperation = 16;
Nema11_stepperBoltSeperation = 23;
Nema14_stepperBoltSeperation = 26;
Nema17_stepperBoltSeperation = 31;
Nema23_stepperBoltSeperation = 47.14;
Nema24_stepperBoltSeperation = 50;
Nema34_stepperBoltSeperation = 69.6;
Nema42_stepperBoltSeperation = 89;

Nema08_stepperWidth = 20.2;
Nema11_stepperWidth = 28.2;
Nema14_stepperWidth = 35.2;
Nema17_stepperWidth = 42.3;
Nema23_stepperWidth = 56.4;
Nema24_stepperWidth = 60;
Nema34_stepperWidth = 86;
Nema42_stepperWidth = 109.86;

Nema08_stepperBoltSize = M2;
Nema11_stepperBoltSize = M2_5;
Nema14_stepperBoltSize = M3;
Nema17_stepperBoltSize = M3;
Nema23_stepperBoltSize = M5;
Nema24_stepperBoltSize = M5;
Nema34_stepperBoltSize = M6;
Nema42_stepperBoltSize = M8;

Nema08_stepperShaftD = 4;
Nema11_stepperShaftD = 5;
Nema14_stepperShaftD = 5;
Nema17_stepperShaftD = 5;
Nema23_stepperShaftD = 6.35;
Nema24_stepperShaftD = 6.35;
Nema34_stepperShaftD = 14;
Nema42_stepperShaftD = 19;

Nema08_stepperCircleD = 15;
Nema11_stepperCircleD = 22;
Nema14_stepperCircleD = 22;
Nema17_stepperCircleD = 22;
Nema23_stepperCircleD = 38.1;
Nema24_stepperCircleD = 38.1;
Nema34_stepperCircleD = 73;
Nema42_stepperCircleD = 55.5;

Nema08_stepperCircleT = 1.5;
Nema11_stepperCircleT = 2;
Nema14_stepperCircleT = 2;
Nema17_stepperCircleT = 2;
Nema23_stepperCircleT = 1.8;
Nema24_stepperCircleT = 1.8;
Nema34_stepperCircleT = 1.8;
Nema42_stepperCircleT = 3;

Nema08_stepperCornerEffectLevel = 3;
Nema11_stepperCornerEffectLevel = 3;
Nema14_stepperCornerEffectLevel = 4;
Nema17_stepperCornerEffectLevel = 5;
Nema23_stepperCornerEffectLevel = 2;
Nema24_stepperCornerEffectLevel = 2;
Nema34_stepperCornerEffectLevel = 3;
Nema42_stepperCornerEffectLevel = 4;

Nema08_stepperPlateT = 2;
Nema11_stepperPlateT = 2;
Nema14_stepperPlateT = 5;
Nema17_stepperPlateT = 5;
Nema23_stepperPlateT = 4.8;
Nema24_stepperPlateT = 5;
Nema34_stepperPlateT = 10;
Nema42_stepperPlateT = 12.5;

//Nema08_
//Nema11_
//Nema17_
//Nema23_
//Nema24_
//Nema34_
//Nema42_

stepperStats = [["Name", "Nema08", "Nema11", "Nema14", "Nema17", "Nema23", "Nema24", "Nema34", "Nema42"],
["stepperBoltSeperation", Nema08_stepperBoltSeperation, Nema11_stepperBoltSeperation, Nema14_stepperBoltSeperation, Nema17_stepperBoltSeperation, Nema23_stepperBoltSeperation, Nema24_stepperBoltSeperation, Nema34_stepperBoltSeperation, Nema42_stepperBoltSeperation],
["stepperWidth", Nema08_stepperWidth, Nema11_stepperWidth, Nema14_stepperWidth, Nema17_stepperWidth, Nema23_stepperWidth, Nema24_stepperWidth, Nema34_stepperWidth, Nema42_stepperWidth],
["stepperBoltSize", Nema08_stepperBoltSize, Nema11_stepperBoltSize, Nema14_stepperBoltSize, Nema17_stepperBoltSize, Nema23_stepperBoltSize, Nema24_stepperBoltSize, Nema34_stepperBoltSize, Nema42_stepperBoltSize],
["stepperShaftD", Nema08_stepperShaftD, Nema11_stepperShaftD, Nema14_stepperShaftD, Nema17_stepperShaftD, Nema23_stepperShaftD, Nema24_stepperShaftD, Nema34_stepperShaftD, Nema42_stepperShaftD],
["stepperCircleD", Nema08_stepperCircleD, Nema11_stepperCircleD, Nema14_stepperCircleD, Nema17_stepperCircleD, Nema23_stepperCircleD, Nema24_stepperCircleD, Nema34_stepperCircleD, Nema42_stepperCircleD],
["stepperCircleT", Nema08_stepperCircleT, Nema11_stepperCircleT, Nema14_stepperCircleT, Nema17_stepperCircleT, Nema23_stepperCircleT, Nema24_stepperCircleT, Nema34_stepperCircleT, Nema42_stepperCircleT],
["stepperCornerEffectLevel", Nema08_stepperCornerEffectLevel, Nema11_stepperCornerEffectLevel, Nema14_stepperCornerEffectLevel, Nema17_stepperCornerEffectLevel, Nema23_stepperCornerEffectLevel, Nema24_stepperCornerEffectLevel, Nema34_stepperCornerEffectLevel, Nema42_stepperCornerEffectLevel],
["stepperPlateT", Nema08_stepperPlateT, Nema11_stepperPlateT, Nema14_stepperPlateT, Nema17_stepperPlateT, Nema23_stepperPlateT, Nema24_stepperPlateT, Nema34_stepperPlateT, Nema42_stepperPlateT]];



function stepperStats(a, b) = stepperStats[b][a] == undef ? Stepper_value_does_not_exist___Try_another_size_of_bolt() : stepperStats[b][a]/Units==undef?stepperStats[b][a]:stepperStats[b][a]/Units;

function Stepper_value_does_not_exist___Try_another_size_of_bolt() = SG_proceedOnError?undef:Stepper_value_does_not_exist___Try_another_size_of_bolt();

//itterate the results and put bolts there
//e.g.
//for(i = getStepperBoltPositions(Nema11)){
//  translate(i)Rod(size);
//}
function getStepperBoltPositions(stepperSize) = [[stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2, stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2], 
[stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2, stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2],
[stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2, stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2],
[stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2, stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2]];

module stepperBoltPositionTranslate(stepperSize){
   for(i = getStepperBoltPositions(stepperSize)){
      translate(i)children();
   }
}
module stepperBoltPositionTranslateMirroring(stepperSize){
   sep = stepperStats(stepperSize, stepperBoltSeperation)/2;
   translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2]){
      translate([sep/2, sep/2])children();
      mirror([1, 0])translate([sep/2, sep/2])children();
      mirror([0, 1])translate([sep/2, sep/2])children();
      mirror([1, 0])mirror([0, 1])translate([sep/2, sep/2])children();
   }
}
//stepperL is the body length of the motor, if left at -1 defaults to the width
//shaftL is the shaft length of the motor, if left at -1 defaults to half the width
//orientation is the position of the wires, (0-3) if left at -1 no wires are rendered
//dualShaft, if set to true renders the shaft going all the way thought the motor
//This module is for projection only, so that you can make things look pretty, do not use it for anything else as values are somewhat arbitrary
module stepper(stepperSize, stepperL = -1, shaftL = -1, orientation = -1, ERR = 0, dualShaft = false){
   realBodyL = stepperL!=-1?stepperL:stepperStats(stepperSize,stepperWidth);
   realShaftL = shaftL!=-1?shaftL:stepperStats(stepperSize,stepperWidth)/2;
   translate([-ERR, -ERR, -realBodyL])cube([stepperStats(stepperSize, stepperWidth)+ERR*2, stepperStats(stepperSize, stepperWidth)+ERR*2, realBodyL]);
   translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCircleD)+ERR*2, h = stepperStats(stepperSize, stepperCircleT)+ERR);
   translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperCircleT)])cylinder(d = stepperStats(stepperSize, stepperShaftD)+ERR*2, h = realShaftL);
   %if(GHOST)union()if(stepperSize == Nema08 || stepperSize == Nema11){
      if(orientation!=-1)translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realBodyL])rotate([0, 0, 180-90*orientation])translate([stepperStats(stepperSize, stepperWidth)/2, -stepperStats(stepperSize,stepperWidth)/4, 0.5/Units]){
         cube([stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize,stepperWidth)/2, stepperStats(stepperSize, stepperPlateT)*1.5]);
         translate([0, stepperStats(stepperSize,stepperWidth)/4-0.75/Units, stepperStats(stepperSize, stepperPlateT)*0.75])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
         translate([0, stepperStats(stepperSize,stepperWidth)/4+0.75/Units, stepperStats(stepperSize, stepperPlateT)*0.75])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
         translate([0, stepperStats(stepperSize,stepperWidth)/4-2.25/Units, stepperStats(stepperSize, stepperPlateT)*0.75])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
         translate([0, stepperStats(stepperSize,stepperWidth)/4+2.25/Units, stepperStats(stepperSize, stepperPlateT)*0.75])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
      }
      if(dualShaft){
         translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realShaftL-realBodyL])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL*2+realBodyL);
      }else{translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL);}
      difference(){
         union(){
            translate([0, 0, -realBodyL])hull(){
               translate([stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel), h = realBodyL);
               translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel), h = realBodyL);
               translate([stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel), h = realBodyL);
               translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel), h = realBodyL);
            }
            translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCircleD), h = stepperStats(stepperSize, stepperCircleT));
         }
         translate([0, 0, -getRodD(stepperStats(stepperSize, stepperBoltSize))-1])for(i = getStepperBoltPositions(stepperSize)){
            translate(i)cylinder(d = getRodD(stepperStats(stepperSize, stepperBoltSize)), h = getRodD(stepperStats(stepperSize, stepperBoltSize))+1.001);
         }
         translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, 0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD)*1.3, h = stepperStats(stepperSize, stepperCircleT)+0.1);
         translate([0, 0, -realBodyL-0.001]){
            translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD)*1.3, h = stepperStats(stepperSize, stepperCircleT)+0.1);
            translate([stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, h = stepperStats(stepperSize, stepperPlateT));
            translate([-0.001, 0, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)+0.001,stepperStats(stepperSize, stepperPlateT)+0.0015]);
            translate([0, -0.001, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001,stepperStats(stepperSize, stepperPlateT)+0.001]);
            translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0]){
               cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, h = stepperStats(stepperSize, stepperPlateT));
               translate([0.001, -stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)+0.001,stepperStats(stepperSize, stepperPlateT)+0.0015]);
               translate([-stepperStats(stepperSize, stepperCornerEffectLevel)/2, -0.001-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001,stepperStats(stepperSize, stepperPlateT)+0.001]);
               
            }
            translate([stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0]){
               cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, h = stepperStats(stepperSize, stepperPlateT));
               translate([-0.001-stepperStats(stepperSize, stepperCornerEffectLevel)/2, -stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)+0.001,stepperStats(stepperSize, stepperPlateT)+0.0015]);
               translate([-stepperStats(stepperSize, stepperCornerEffectLevel)/2, -0.001, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001,stepperStats(stepperSize, stepperPlateT)+0.001]);
            }
            translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0]){
               cylinder(d = stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, h = stepperStats(stepperSize, stepperPlateT));
               translate([-0.001-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)+0.001,stepperStats(stepperSize, stepperPlateT)+0.0015]);
               translate([0, -0.001-stepperStats(stepperSize, stepperCornerEffectLevel)/2, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)+0.001, stepperStats(stepperSize, stepperCornerEffectLevel)/2+0.001,stepperStats(stepperSize, stepperPlateT)+0.001]);
            }
         }
      }
   } else if(stepperSize == Nema14 || stepperSize == Nema17){
      if(orientation!=-1)translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realBodyL])rotate([0, 0, 180-90*orientation])translate([stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize,stepperPlateT)/5, -stepperStats(stepperSize,stepperWidth)/4, 0]){
         translate([0, stepperStats(stepperSize,stepperWidth)/4-0.8/Units, stepperStats(stepperSize, stepperPlateT)/2+0.6/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel)/1.5);
         translate([0, stepperStats(stepperSize,stepperWidth)/4+0.8/Units, stepperStats(stepperSize, stepperPlateT)/2+0.6/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel)/1.5);
         translate([0, stepperStats(stepperSize,stepperWidth)/4-0.8/Units, stepperStats(stepperSize, stepperPlateT)/2-0.6/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel)/1.5);
         translate([0, stepperStats(stepperSize,stepperWidth)/4+0.8/Units, stepperStats(stepperSize, stepperPlateT)/2-0.6/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel)/1.5);
      }
      translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, 0]){
         difference(){
            cylinder(d = stepperStats(stepperSize, stepperCircleD), h = stepperStats(stepperSize, stepperCircleT));
            translate([0, 0, 0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD)*1.3, h = stepperStats(stepperSize, stepperCircleT));
         }
         if(dualShaft){
            translate([0, 0, -realShaftL-realBodyL])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL*2+realBodyL);
         }else{translate([0, 0, -0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL);}
      }
      difference(){
         union(){
            translate([0, 0, -stepperStats(stepperSize, stepperPlateT)])hull()difference(){
               cube([stepperStats(stepperSize, stepperWidth), stepperStats(stepperSize, stepperWidth), stepperStats(stepperSize, stepperPlateT)]);
               cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
               translate([0, stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
               translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), 0, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
               translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
            }
            translate([0, 0, -realBodyL])hull()difference(){
               cube([stepperStats(stepperSize, stepperWidth), stepperStats(stepperSize, stepperWidth), stepperStats(stepperSize, stepperPlateT)]);
               cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
               translate([0, stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
               translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), 0, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
               translate([stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperWidth)-stepperStats(stepperSize, stepperCornerEffectLevel), 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperPlateT)]);
            }
            translate([1, 1, -realBodyL+0.001])hull()difference(){
               cube([stepperStats(stepperSize, stepperWidth)-2, stepperStats(stepperSize, stepperWidth)-2, realBodyL-0.002]);
               cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), realBodyL]);
               translate([0, stepperStats(stepperSize, stepperWidth)-2-stepperStats(stepperSize, stepperCornerEffectLevel), 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), realBodyL]);
               translate([stepperStats(stepperSize, stepperWidth)-2-stepperStats(stepperSize, stepperCornerEffectLevel), 0, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), realBodyL]);
               translate([stepperStats(stepperSize, stepperWidth)-2-stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperWidth)-2-stepperStats(stepperSize, stepperCornerEffectLevel), 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel), stepperStats(stepperSize, stepperCornerEffectLevel), realBodyL]);
            }
         }
         translate([0, 0, -getRodD(stepperStats(stepperSize, stepperBoltSize))-1])for(i = getStepperBoltPositions(stepperSize)){
            translate(i)cylinder(d = getRodD(stepperStats(stepperSize, stepperBoltSize)), h = getRodD(stepperStats(stepperSize, stepperBoltSize))+1.001);
         }
         if(orientation!=-1)translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realBodyL])rotate([0, 0, 180-90*orientation])translate([stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize,stepperPlateT)/5+0.001, -stepperStats(stepperSize,stepperPlateT)/2, 0.75])cube([stepperStats(stepperSize,stepperPlateT)/5, stepperStats(stepperSize,stepperPlateT), stepperStats(stepperSize,stepperPlateT)-1.5]);
         translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realBodyL-0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD)*1.3, h = stepperStats(stepperSize, stepperCircleT));
      }
   } else {
      ro = stepperStats(stepperSize,stepperCornerEffectLevel);
      hr = M(stepperStats(stepperSize,stepperBoltSize), nutPeakD);
      if(orientation!=-1)translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realBodyL])rotate([0, 0, 180-90*orientation])translate([stepperStats(stepperSize, stepperWidth)/2, 0, stepperStats(stepperSize, stepperPlateT)]){
         translate([0, -3.5/Units, 0])cube([stepperStats(stepperSize, stepperCornerEffectLevel)/2, 7/Units, 3.5/Units]);
         rotate([0, 90, 0])cylinder(d = 7, h = stepperStats(stepperSize, stepperCornerEffectLevel)/2-0.001);
         translate([0, -0.7/Units, 0.7/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
         translate([0, 0.7/Units, 0.7/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
         translate([0, -0.7/Units, -0.7/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
         translate([0, 0.7/Units, -0.7/Units])rotate([0, 90, 0])cylinder(d = 1/Units, h = stepperStats(stepperSize, stepperCornerEffectLevel));
      }
      translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, 0]){
         difference(){
            cylinder(d = stepperStats(stepperSize, stepperCircleD), h = stepperStats(stepperSize, stepperCircleT));
            if(stepperSize == Nema42){
               translate([0, 0, -0.001])cylinder(d = stepperStats(stepperSize, stepperCircleD)*0.7, h = stepperStats(stepperSize, stepperCircleT)+0.003);
            }else{translate([0, 0, 0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD)*1.3, h = stepperStats(stepperSize, stepperCircleT));}
         }
         if(dualShaft){
            translate([0, 0, -realShaftL-realBodyL])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL*2+realBodyL);
         }else{
            if(stepperSize == Nema42){
               translate([0, 0, -0.002-stepperStats(stepperSize, stepperShaftD)/3])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL+stepperStats(stepperSize, stepperShaftD)/3+0.002);
            }else{translate([0, 0, -0.001])cylinder(d = stepperStats(stepperSize, stepperShaftD), h = stepperStats(stepperSize, stepperCircleT)+realShaftL);}
         }
      }
      difference(){
         union(){
            ml = realBodyL-stepperStats(stepperSize, stepperPlateT);
            translate([0, 0, -realBodyL])hull(){
               for(i = getStepperBoltPositions(stepperSize)){
                  translate(i)cylinder(d = ro, h = ml);
               }
            }
            translate([0, 0, -realBodyL+0.001])hull(){
               translate([stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2+hr/2+ro/2, ro/2, 0])cylinder(d = ro, h = ml);
               translate([stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2+hr/2+ro/2, stepperStats(stepperSize, stepperWidth)-ro/2, 0])cylinder(d = ro, h = ml);
               translate([stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2-hr/2-ro/2, ro/2, 0])cylinder(d = ro, h = ml);
               translate([stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2-hr/2-ro/2, stepperStats(stepperSize, stepperWidth)-ro/2, 0])cylinder(d = ro, h = ml);
            }
            translate([0, 0, -realBodyL-0.001])hull(){
               translate([ro/2, stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2+hr/2+ro/2, 0])cylinder(d = ro, h = ml);
               translate([ro/2, stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2-hr/2-ro/2, 0])cylinder(d = ro, h = ml);
               translate([stepperStats(stepperSize, stepperWidth)-ro/2, stepperStats(stepperSize, stepperWidth)/2-stepperStats(stepperSize, stepperBoltSeperation)/2+hr/2+ro/2, 0])cylinder(d = ro, h = ml);
               translate([stepperStats(stepperSize, stepperWidth)-ro/2, stepperStats(stepperSize, stepperWidth)/2+stepperStats(stepperSize, stepperBoltSeperation)/2-hr/2-ro/2, 0])cylinder(d = ro, h = ml);
            }
            translate([0, 0, -stepperStats(stepperSize, stepperPlateT)])hull(){
               translate([ro/2, ro/2, 0])cylinder(d = ro, h = stepperStats(stepperSize, stepperPlateT));
               translate([stepperStats(stepperSize, stepperWidth)-ro/2, ro/2, 0])cylinder(d = ro, h = stepperStats(stepperSize, stepperPlateT));
               translate([ro/2, stepperStats(stepperSize, stepperWidth)-ro/2, 0])cylinder(d = ro, h = stepperStats(stepperSize, stepperPlateT));
               translate([stepperStats(stepperSize, stepperWidth)-ro/2, stepperStats(stepperSize, stepperWidth)-ro/2, 0])cylinder(d = ro, h = stepperStats(stepperSize, stepperPlateT));
            }
         }
         if(stepperSize == Nema42)translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -stepperStats(stepperSize, stepperShaftD)/3-0.001])cylinder(d = stepperStats(stepperSize, stepperCircleD)*0.7, h = stepperStats(stepperSize, stepperShaftD)/3+0.002);
         translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, -realBodyL-0.002])cylinder(d = stepperStats(stepperSize, stepperShaftD)*1.3, h = stepperStats(stepperSize, stepperCircleT));
         translate([0, 0, -stepperStats(stepperSize, stepperPlateT)-0.001])for(i = getStepperBoltPositions(stepperSize)){
            translate(i)cylinder(d = getRodD(stepperStats(stepperSize, stepperBoltSize)), h = stepperStats(stepperSize, stepperPlateT)+0.002);
         }
         translate([0, 0, -realBodyL-0.001])for(i = [0:3]){
            translate(getStepperBoltPositions(stepperSize)[i])rotate([0, 0, 180-90*i]){
               cylinder(d = hr, h = realBodyL-stepperStats(stepperSize, stepperPlateT)+0.003);
               translate([-hr/2+0.001, 0.001, 0])cube([hr*1.5, hr, realBodyL-stepperStats(stepperSize, stepperPlateT)+0.0015]);
               translate([0.001, -hr/2+0.001, 0])cube([hr, hr, realBodyL-stepperStats(stepperSize, stepperPlateT)+0.002]);
            }
         }
      }
   }
}


module stepperAdjustable(stepperSize, plateT, boltType, adjustmentDist, stepperL = -1, shaftL = -1, orientation = -1, ERR = 0, dualShaft = false){
   realBodyL = stepperL!=-1?stepperL:stepperStats(stepperSize,stepperWidth);
   realShaftL = shaftL!=-1?shaftL:stepperStats(stepperSize,stepperWidth)/2;
      translate([-ERR, -ERR, -realBodyL])cube([stepperStats(stepperSize, stepperWidth)+ERR*2+adjustmentDist, stepperStats(stepperSize, stepperWidth)+ERR*2, realBodyL]);
   translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, 0])hull(){
      cylinder(d = stepperStats(stepperSize, stepperCircleD)+ERR*2, h = plateT+0.001);
      translate([adjustmentDist, 0, 0])cylinder(d = stepperStats(stepperSize, stepperCircleD)+ERR*2, h = plateT+0.001);
   }
   translate([stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperWidth)/2, stepperStats(stepperSize, stepperCircleT)])hull(){
      cylinder(d = stepperStats(stepperSize, stepperShaftD)+ERR*2, h = realShaftL);
      translate([adjustmentDist, 0, 0])cylinder(d = stepperStats(stepperSize, stepperShaftD)+ERR*2, h = realShaftL);
   }
   stepperBoltPositionTranslate(stepperSize){
      translate([0, 0, plateT])BoltNormalWithSurface(boltType, stepperStats(stepperSize, stepperBoltSize), plateT, ERR);
      translate([0, 0, plateT+0.001])hull(){
         GHOST = false;
         BoltNormalWithSurface(boltType, stepperStats(stepperSize, stepperBoltSize), 0, ERR);
         translate([adjustmentDist, 0, 0])BoltNormalWithSurface(boltType, stepperStats(stepperSize, stepperBoltSize), 0, ERR);
      }
      hull(){
         cylinder(d = getRodD(stepperStats(stepperSize, stepperBoltSize)), h = plateT+0.002);
         translate([adjustmentDist, 0, 0])cylinder(d = getRodD(stepperStats(stepperSize, stepperBoltSize)), h = plateT+0.002);
      }
   }
   stepper(stepperSize, stepperL, shaftL, orientation, ERR, dualShaft);
}