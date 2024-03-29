//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core.scad>;
GHOST = false;

module M_AllenBolt(size, length, ERR=0,hollow = false){
   difference(){
      cylinder(d = M(size, allenBoltHeadD)+ERR*2, h = M(size, allenBoltHeadH)+0.001);
      if(hollow)translate([0, 0, 1/Units])cylinder(d = M(size, allenBoltKeySize)*2/sqrt(3), h = M(size, allenBoltHeadH)- 0.999/Units+0.003, $fn = 6);
   }
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(!hollow&&GHOST){
      %M_AllenBolt(size, length, 0, true);
   }
}
module M_AllenBoltHole(size, length, holeDepth, ERR=0){
   cylinder(d = M(size, allenBoltHeadD)+ERR*2, h = holeDepth+0.001);
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(GHOST){
      %M_AllenBolt(size, length, 0, true);
   }
}
module M_AllenButtonBolt(size, length, ERR=0,hollow = false){
   r = (pow(M(size, allenButtonBoltHeadD)/2, 2)+pow(M(size, allenBoltHeadH), 2))/M(size, allenBoltHeadH)/2;
   if(hollow){
      difference(){
         intersection(){
            cylinder(d = M(size, allenButtonBoltHeadD)+ERR*2, h = M(size, allenButtonBoltHeadH));
            translate([0, 0, M(size, allenButtonBoltHeadH)-r*0.8])sphere(r = r*0.93);
         }
         translate([0, 0, M(size, allenBoltHeadH)/8])cylinder(d = M(size, allenButtonBoltKeySize)*2/sqrt(3), h = M(size, allenButtonBoltHeadH)*7/8+0.001, $fn = 6);
      }
   }else{
      cylinder(d = M(size, allenButtonBoltHeadD)+ERR*2, h = M(size, allenButtonBoltHeadH)+0.001);
   }
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(!hollow&&GHOST){
      %M_AllenButtonBolt(size, length, 0, true);
   }
}
module M_AllenButtonBoltHole(size, length, holeDepth, ERR=0){
   difference(){
      cylinder(d = M(size, allenButtonBoltHeadD)+ERR*2, h = holeDepth+0.001);
   }
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(GHOST){
      %M_AllenButtonBolt(size, length, 0, true);
   }
}
module M_AllenCountersunkBolt(size, length, ERR=0,hollow = false){
   difference(){
      union(){
         translate([0, 0, -M(size, allenCountersunkBoltHeadH)])cylinder(r1 = M(size, boltD)/2+ERR, r2 = M(size, allenCountersunkBoltHeadD)/2+ERR, h = M(size, allenCountersunkBoltHeadH)+0.001);
         translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002-M(size, allenCountersunkBoltHeadH));
      }
      if(hollow)translate([0, 0, -M(size, allenCountersunkBoltHeadH)*2/3])cylinder(d = M(size, allenCountersunkBoltKeySize)*2/sqrt(3), h = M(size, allenCountersunkBoltHeadH)*2/3+0.002, $fn = 6);
   }
   if(!hollow&&GHOST){
      %M_AllenCountersunkBolt(size, length, 0, true);
   }
}
module M_AllenCountersunkBoltHole(size, length, holeDepth, ERR=0){
   translate([0, 0, -0.001])cylinder(d = M(size, allenCountersunkBoltHeadD)+ERR*2, h = holeDepth+0.002);
   translate([0, 0, -M(size, allenCountersunkBoltHeadH)])cylinder(r1 = M(size, boltD)/2+ERR, r2 = M(size, allenCountersunkBoltHeadD)/2+ERR, h = M(size, allenCountersunkBoltHeadH));
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002-M(size, allenCountersunkBoltHeadH));
   if(GHOST){
      %M_AllenCountersunkBolt(size, length, 0, true);
   }
}
module M_HexHeadBolt(size, length, ERR=0, hollow = false){
   cylinder(d = M(size, hexHeadPeakD)+ERR*2, h = M(size, hexHeadBoltHeadH)+0.001, $fn = 6);
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(!hollow&&GHOST){
      %M_HexHeadBolt(size, length, 0, true);
   }
}
module M_HexHeadBoltHole(size, length, holeDepth, ERR=0){
   cylinder(d = M(size, hexHeadPeakD)+ERR*2, h = holeDepth+0.001, $fn = 6);
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(GHOST){
      %M_HexHeadBolt(size, length, 0, true);
   }
}
module M_HexHeadFlangeBoltHole(size, length, holeDepth, ERR=0){
   cylinder(d = M(size, hexFlangeD)+ERR*2, h = holeDepth+0.001);
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(GHOST){
      %M_HexHeadFlangeBolt(size, length, 0, true);
   }
}
module M_HexHeadFlangeBolt(size, length, ERR=0, hollow = false){
   cylinder(d = M(size, hexHeadPeakD)+ERR*2, h = M(size, hexFlangeHeadH)+0.001, $fn = 6);
   cylinder(d = M(size, hexFlangeD)+ERR*2, h = M(size, hexFlangeT)+0.001);
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(!hollow&&GHOST){
      %M_HexHeadFlangeBolt(size, length, 0, true);
   }
}
module M_HexHeadBoltHoleAllowingSpin(size, length, holeDepth, ERR=0){
   cylinder(d = M(size, hexHeadPeakD)+ERR*2, h = holeDepth+0.002);
   translate([0, 0, -length-0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(GHOST){
      %M_HexHeadBolt(size, length, 0, true);
   }
}

module M_FullNut(size, ERR=0,hollow = false, VertERR=0){
   difference(){
      translate([0, 0, -0.001])cylinder(d = M(size, nutPeakD)+ERR*2, h = M(size, fullNutH)+VertERR+0.002,$fn = 6);
      if (hollow)translate([0, 0, -0.002])cylinder(d = M(size, boltD)+ERR*2, h = M(size, fullNutH)+VertERR+0.004);
   }
   if(!hollow&&GHOST){
      %M_FullNut(size, 0, true);
   }
}
module M_NylocNut(size, ERR=0,hollow = false, VertERR=0){
   if(!hollow){
      translate([0, 0, -0.001])cylinder(d = M(size, nutPeakD)+ERR*2, h = M(size, nylocNutH)+VertERR+0.002,$fn = 6);
   }else{
      difference(){
         union(){
            cylinder(d = M(size, nutPeakD)+ERR*2, h = M(size, fullNutH)+0.002,$fn = 6);
            translate([0, 0, 0.001])cylinder(d = M(size, nutFlatD)+ERR*2, h = M(size, nylocNutH)-0.001);
         }
         if (hollow)translate([0, 0, -0.001])cylinder(d = M(size, boltD)+ERR*2, h = M(size, nylocNutH)+0.002);
      }
   }
   if(!hollow&&GHOST){
      %M_NylocNut(size, 0, true);
   }
}
module M_DomeNut(size, ERR=0,hollow = false, VertERR = 0){
   if (!hollow){
      translate([0, 0, -0.001])cylinder(d = M(size, nutPeakD)+ERR*2, h = M(size, domeNutTotalH)+VertERR+0.002,$fn = 6);
   }else{
      intersection(){
         translate([0,0,M(size, domeNutHexH)])sphere(d = M(size, nutFlatD)*11/12);
         translate([0,0,M(size, domeNutHexH)])cylinder(d = M(size, nutFlatD)*11/12, h = M(size, nutFlatD)*11/24);
      }
      difference(){
         cylinder(d = M(size, nutPeakD)+ERR*2, h = M(size, domeNutHexH),$fn = 6);
         translate([0, 0, -0.001])cylinder(d = M(size, boltD)+ERR*2, h = M(size, domeNutHexH)+0.002);
      }
   }
   if(!hollow&&GHOST){
      %M_DomeNut(size, 0, true);
   }
}
module M_ThinSquareNut(size, ERR=0,hollow = false, VertERR=0){
   difference(){
      translate([0, 0, -0.001])cylinder(d = M(size, squareNutPeakD)+ERR*2, h = M(size, thinSquareNutH)+VertERR+0.002,$fn = 4);
      if (hollow)translate([0, 0, -0.002])cylinder(d = M(size, boltD)+ERR*2, h = M(size, thinSquareNutH)+0.004);
   }
   if(!hollow&&GHOST){
      %M_ThinSquareNut(size, 0, true);
   }
}
module M_StuddingConnector(size, ERR=0,hollow = false, VertERR=0){
   difference(){
      translate([0, 0, -0.001])cylinder(d = M(size, nutPeakD)+ERR*2, h = M(size, studdingConnectorNutL)+VertERR+0.002,$fn = 6);
      if (hollow)translate([0, 0, -0.002])cylinder(d = M(size, boltD)+ERR*2, h = M(size, studdingConnectorNutL)+0.004);
   }
   if(!hollow&&GHOST){
      %M_StuddingConnector(size, 0, true);
   }
}
module M_SquareNut(size, ERR=0,hollow = false, VertERR=0){
   difference(){
      translate([0, 0, -0.001])cylinder(d = M(size, squareNutPeakD)+ERR*2, h = M(size, squareNutH)+VertERR+0.002,$fn = 4);
      if (hollow)translate([0, 0, -0.002])cylinder(d = M(size, boltD)+ERR*2, h = M(size, squareNutH)+0.004);
   }
   if(!hollow&&GHOST){
      %M_SquareNut(size, 0, true);
   }
}
module M_WingNutLocked(size, ERR=0, hollow = false, VertERR=0){
   if(!hollow){
      translate([0, 0, -0.001])cylinder(d = M(size, wingNutBaseD)+ERR*2, h = M(size, wingNutWingH)+VertERR+0.002);
      translate([-M(size, wingNutWingT)/2-ERR, -M(size, wingNutWingExtension)/2-ERR, -0.001])cube([M(size, wingNutWingT)+ERR*2, M(size, wingNutWingExtension)+ERR*2, M(size, wingNutWingH)+VertERR+0.002]);
   } else {
      difference(){
         cylinder(d = M(size, wingNutBaseD), h = M(size, wingNutBaseH));
         translate([0, 0, -0.001])cylinder(d = M(size, boltD), h = M(size, wingNutBaseH)+0.002);
      }
      hull(){
         translate([-M(size, wingNutWingT)/2, M(size, boltD)/2, 0])cube([M(size, wingNutWingT), M(size, wingNutBaseD)/2-M(size, boltD)/2, M(size, wingNutBaseH)]);
         translate([-M(size, wingNutWingT)/2, M(size, wingNutBaseD)/2, M(size, wingNutWingH)-0.01])cube([M(size, wingNutWingT), M(size, wingNutWingExtension)/2-M(size, wingNutBaseD)/2, 0.01]);
      }
      mirror([0, 1, 0])hull(){
         translate([-M(size, wingNutWingT)/2, M(size, boltD)/2, 0])cube([M(size, wingNutWingT), M(size, wingNutBaseD)/2-M(size, boltD)/2, M(size, wingNutBaseH)]);
         translate([-M(size, wingNutWingT)/2, M(size, wingNutBaseD)/2, M(size, wingNutWingH)-0.01])cube([M(size, wingNutWingT), M(size, wingNutWingExtension)/2-M(size, wingNutBaseD)/2, 0.01]);
      }
   }
   if(!hollow&&GHOST){
      %M_WingNutLocked(size, 0, true);
   }
}
module M_WingNutRotatable(size, ERR=0, hollow = false, VertERR=0){
   if(!hollow){
      translate([0, 0, -0.001])cylinder(d = M(size, wingNutBaseD)+ERR, h = M(size, wingNutBaseH)+VertERR+0.002);
      translate([0, 0, -0.001])cylinder(d = M(size, wingNutWingExtension)+ERR, h = M(size, wingNutWingH)+VertERR+0.002);
   } else {
      M_WingNutLocked(size, ERR, true, VertERR);
   }
   if(!hollow&&GHOST){
      %M_WingNutLocked(size, 0, true);
   }
}

module M_Rod(size, length, ERR=0, hollow = false){
   translate([0, 0, -0.001])cylinder(d = M(size, boltD)+ERR*2, h = length+0.002);
   if(!hollow&&GHOST){
      %cylinder(d = M(size, boltD), h = length);
   }
}
module M_FullNutVertHole(size, depth, ERR=0){
   M_FullNut(size, ERR, false, depth-M(size, fullNutH)+0.001);
}
module M_NylocNutVertHole(size, depth, ERR=0){
   M_NylocNut(size, ERR, false, depth-M(size, nylocNutH)+0.001);
}
module M_DomeNutVertHole(size, depth, ERR=0){
   M_DomeNut(size, ERR, false, depth-M(size, domeNutTotalH)+0.001);
}
module M_ThinSquareNutVertHole(size, depth, ERR=0){
   M_ThinSquareNut(size, ERR, false, depth-M(size, thinSquareNutH)+0.001);
}
module M_StuddingConnectorVertHole(size, depth, ERR=0){
   M_StuddingConnector(size, ERR, false, depth-M(size, studdingConnectorNutL)+0.001);
}
module M_SquareNutVertHole(size, depth, ERR=0){
   M_SquareNut(size, ERR, false, depth-M(size, squareNutH)+0.001);
}
module M_WingNutLockedVertHole(size, depth, ERR=0){
   M_WingNutLocked(size, ERR, false, depth-M(size, wingNutWingH)+0.001);
}
module M_WingNutRotatableVertHole(size, depth, ERR=0){
   M_WingNutRotatable(size, ERR, false, depth-M(size, wingNutWingH)+0.001);
}


module M_FullNutHole(size, distFromEdge, ERR=0, VertERR=0){
   translate([-distFromEdge-0.001, -M(size, nutFlatD)/2-ERR/sqrt(3)/2*3, 0])cube([distFromEdge+0.002, M(size, nutFlatD)+ERR*3/sqrt(3), M(size, fullNutH)+VertERR]);
   M_FullNut(size, ERR, false, VertERR);
}
module M_DomeNutHole(size, distFromEdge, ERR=0, VertERR=0){
   translate([-distFromEdge-0.001, -M(size, nutFlatD)/2-ERR/sqrt(3)/2*3, 0])cube([distFromEdge+0.002, M(size, nutFlatD)+ERR*3/sqrt(3), M(size, domeNutTotalH)+VertERR]);
   M_DomeNut(size, ERR, false, VertERR);
}
module M_NylocNutHole(size, distFromEdge, ERR=0, VertERR=0){
   translate([-distFromEdge-0.001, -M(size, nutFlatD)/2-ERR/sqrt(3)/2*3, 0])cube([distFromEdge+0.002, M(size, nutFlatD)+ERR*3/sqrt(3), M(size, nylocNutH)+VertERR]);
   M_NylocNut(size, ERR, false, VertERR);
}
module M_ThinSquareNutHole(size, distFromEdge, ERR=0, VertERR=0){
   translate([-distFromEdge-0.001, -M(size, squareNutFlatD)/2-ERR, 0])cube([distFromEdge+0.002, M(size, squareNutFlatD)+ERR*2, M(size, thinSquareNutH)+VertERR]);
   rotate([0, 0, 45])M_ThinSquareNut(size, ERR, false, VertERR);
}
module M_SquareNutHole(size, distFromEdge, ERR=0, VertERR=0){
   translate([-distFromEdge-0.001, -M(size, squareNutFlatD)/2-ERR, 0])cube([distFromEdge+0.002, M(size, squareNutFlatD)+ERR*2, M(size, squareNutH)+VertERR]);
   rotate([0, 0, 45])M_SquareNut(size, ERR, false, VertERR);
}
module M_StuddingConnectorHole(size, distFromEdge, ERR=0, VertERR=0){
   translate([-distFromEdge-0.001, -M(size, nutFlatD)/2-ERR/sqrt(3)/2*3, 0])cube([distFromEdge+0.002, M(size, nutFlatD)+ERR*3/sqrt(3), M(size, studdingConnectorNutL)+VertERR]);
   M_StuddingConnector(size, ERR, false, VertERR);
}
module M_WingNutLockedHole(size, distFromEdge, ERR=0, VertERR=0){
   rotate([0, 0, 90])M_WingNutLocked(size, ERR, false, VertERR);
   translate([-distFromEdge-0.001, -M(size, wingNutWingT)/2-ERR, 0])cube([distFromEdge+ERR+0.002, M(size, wingNutWingT)+ERR*2, M(size, wingNutWingH)+VertERR]);
   translate([-distFromEdge-0.001, -M(size, wingNutBaseD)/2-ERR, 0])cube([distFromEdge+ERR+0.002, M(size, wingNutBaseD)+ERR*2, M(size, wingNutBaseH)+VertERR]);
}