//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include <ScrewsMetric/ScrewsMetric.scad>;
include <ScrewsMetric/Optional-Bearings.scad>;
include <ScrewsMetric/Optional-Steppers.scad>;
include <ScrewsMetric/Optional-Rails.scad>;
include <ScrewsMetric/Optional-Frames.scad>;

$fn = 100;
GHOST = true;

SG_proceedOnError = true;

silent = true;
module bearingTest(){
   intersection(){
      intersection_for(i = [1 : len(bearingDimensionArray)])translate([0, 0, 10*i]){
         if(BearingDimention(i, ScrewsMetric_name)!=undef){
            BearingType(i);
         }
      }
      intersection_for(i = [1 : 35]){
         echo(i);
         for(j = allBearingSeries){
            BearingFromDiam(i, series = j, hollow = true);
         }
      }
   }
}
module stepperTest(){
   intersection_for(i = [1 : len(stepperStats)-1])translate([i*100-100, 0, 0]){
      stepper(i);
      translate([0, 120, 0])stepper(i, dualShaft=true, stepperL = 30, shaftL = 10, orientation=2);
      %stepperBoltPositionTranslate(i){
         cylinder(h = 10, d = 5);
         cube(5);
      }
      %translate([0, 120, 0])stepperBoltPositionTranslateMirroring(i){
         cylinder(h = 10, d = 5);
         cube(5);
      }
   }
}
module railTest(){
   intersection_for(i = [1 : len(railDimensionArray[0])-1])translate([0, i*40-40, 0]){
      rail(i, 120, position = 30, slowMode = true);
      %railBoltPositionsTranslate(i, 120, 10)cube([10, 10, 20]);
      %translate([30, -railDimensions(i, linearRailBlockWidth)/2, 0])railBlockBoltPositionsTranslate(i)cube([10, 10, 20]);
      
      mirror([1, 0, 0])rail(i, 120, position = 30, form = linearRailCForm, slowMode = false);
      %mirror([1, 0, 0])railBoltPositionsTranslate(i, 120, 1)cube([10, 10, 20]);
      %mirror([1, 0, 0])translate([30, -railDimensions(i, linearRailBlockWidth)/2, 0])railBlockBoltPositionsTranslateMirroring(i, form = linearRailCForm)cube([10, 10, 20]);
   }
}
module bridgeTest(){
   minimalBridge(3, d = 6, h = 3, sep = 10);
   minimalBridge(2, d1 = 4, d2 = 15, h1 = 3, h2 = 10, l1 = [0, 15], l2 = [15, 15]);
   minimalBridge(2, d1 = 4, d2 = 10, h1 = 10, h2 = 3, l1 = [0, 30], l2 = [15, 30], half = 0);
   minimalBridge(2, d1 = 4, d2 = 10, h1 = 10, h2 = 10, minH = 2, l1 = [0, 45], l2 = [15, 45], bias = 1);
   minimalBridge(2, d1 = 4, d2 = 10, h1 = 10, h2 = 10, minH = 2, flatL = 5, l1 = [0, 60], l2 = [15, 60], bias = 2);
   minimalBridge(2, d1 = 4, d2 = 10, h1 = 10, h2 = 10, minH = 2, flatProportion = 0.3, l1 = [0, 75], l2 = [15, 75], bias = 3);
   minimalBridge(2, d1 = 4, d2 = 10, h1 = 4, h2 = 10, minH = 2, flatProportion = 0.3, l1 = [0, 90], l2 = [15, 90], bias = 4);
   minimalBridge(2, d1 = 4, d2 = 6, h1 = 4, h2 = 10, minH = 2, curveR = 5, l1 = [0, 105], l2 = [20, 105], bias = 5);
   minimalBridge(2, d1 = 4, d2 = 6, h1 = 4, h2 = 10, minH = 2, curveR1 = 15, curveR2 = 5, l1 = [0, 120], l2 = [20, 120], bias = 6);
   minimalBridge(2, r1 = 2, r2 = 3, h = 4, l1 = [0, 135], l2 = [20, 135], bias = 7);
   minimalBridge(2, r = 2, h = 4, l1 = [0, 150], l2 = [20, 150], bias = 8);
}
cornering = [0, 0, 0, 6, 8, 6, 0, 3];
module framesTest(){
   for(i = [1:7])translate([0, i*100-100, 0]){
      frames_base(i, 50, 30, 6, allenBolt, M3, 6, 20, [40, 20], cornering[i], center = true);
      translate([100, 0, 0])frames_base(i, 50, 50, 6, allenBolt, M3, 6, 20, 40, cornering[i], true, center = true);
      for(j = [0:4])translate([j*100+200, 0, 0]){
         frames_base2(i, 50, 6, 6, allenBolt, M3, 20, j, topW = 10, topL = 20, center = true);
      }
      translate([700, 0, 0])frames_baseAngle(i, 20, 20, 20, 5, 4, allenBolt, M3, 6, 5, center = true, strutOutside = false);
      translate([800, 0, 0])frames_baseAngle(i, 20, 20, 20, 5, 4, allenBolt, M3, 6, 5, center = true, strutOutside = true);
   }
}
module boltTest(){
   difference(){
      cube([150, 120, 20]);      
      for(i = [0:5])translate([0, 15*i+15, 10]){
         translate([10, 0, 10])BoltOnSurface(i, M5, 20);
         translate([25, 0, 10])BoltFlushWithSurface(i, M5, 20);
         translate([40, 0, 10])BoltFlushWithSurface(i, M5, 20, override = true);
         translate([55, 0, 10])BoltNormalWithSurface(i, M5, 20);
         
         translate([75, 0, 0])BoltInHoleFromTop(i, M5, 10, 10);
         translate([90, 0, 0])BoltInHoleFromBottom(i, M5, 10, 10);
         translate([105, 0, 0])BoltInHoleFromNormal(i, M5, 10, 10);
      }
   }
}
module nutTest(){
   difference(){
      cube([400, 200, 20]);      
      for(i = [0:7])translate([0, 20*i+20, 0]){
         translate([15, 0, 20])rotate([0, 0, 90])Nut(i, M5);
         translate([45, 0, 20])rotate([0, 0, 90])NutNormalWithSurface(i, M5);
         translate([75, 0, 20])rotate([0, 0, 90])NutFlushWithSurface(i, M5, override = false);
         translate([105, 0, 20])rotate([0, 0, 90])NutFlushWithSurface(i, M5, override = true);
         translate([135, 0, 20])rotate([0, 0, 90])NutSemiFlushWithSurface(i, M5, override = false);
         translate([165, 0, 20])rotate([0, 0, 90])NutSemiFlushWithSurface(i, M5, override = true);
         
         
         translate([220, 0, 0])rotate([0, 0, 90])NutVertHole(i, M5, 20);
         translate([250, 0, 0])rotate([0, 0, 90])NutVertHoleFromNormal(i, M5, 20);
         translate([280, 0, 0])rotate([0, 0, 90])NutVertHoleFromTop(i, M5, 20);
         translate([310, 0, 0])rotate([0, 0, 90])NutVertHoleFromSemiTop(i, M5, 20);
         
         translate([350, 0, 10])rotate([0, 90, 0])NutHole(i, M5, 10);
      }
   }
}
module washerTest(){
   intersection(){
      group();
      for(i = [1:7])translate([0, 0, 100*i-100]){
         for(j = [1:14])translate([0, 0, 5*j]){
            if(isWasherInWasherDatabase(j, i)){
               Washer(i, j);
            }
         }
      }
   }
}
