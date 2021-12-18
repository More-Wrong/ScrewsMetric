//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core-modules.scad>;
fullNut = 0;
nylocNut = 1;
domeNut = 2;
thinSquareNut = 3;
studdingConnector = 4;
squareNut = 5;
wingNut = 6;
wingNutAllowTurn = 7;

function isNutInScrewsMetric(nutType, size) = nutType == fullNut? isValueInScrewsMetric(size, fullNutH):
nutType == nylocNut? isValueInScrewsMetric(size, nylocNutH):
nutType == domeNut? isValueInScrewsMetric(size, domeNutTotalH):
nutType == thinSquareNut? isValueInScrewsMetric(size, thinSquareNutH):
nutType == studdingConnector? isValueInScrewsMetric(size, studdingConnectorNutL):
nutType == squareNut? isValueInScrewsMetric(size, squareNutH):
nutType == wingNut? isValueInScrewsMetric(size, wingNutWingH):
nutType == wingNutAllowTurn? isValueInScrewsMetric(size, wingNutWingH):
ScrewsMetric_nut_type_does_not_exist___Try_another_type();

function M_getNutH(nutType, size) = nutType == fullNut? M(size, fullNutH):
nutType == nylocNut? M(size, nylocNutH):
nutType == domeNut? M(size, domeNutTotalH):
nutType == thinSquareNut? M(size, thinSquareNutH):
nutType == studdingConnector? M(size, studdingConnectorNutL):
nutType == squareNut? M(size, squareNutH):
nutType == wingNut? M(size, wingNutWingH):
nutType == wingNutAllowTurn? M(size, wingNutWingH):
ScrewsMetric_nut_type_does_not_exist___Try_another_type();

function M_getNutSideH(nutType, size) = nutType == fullNut? M(size, fullNutH):
nutType == nylocNut? M(size, fullNutH):
nutType == domeNut? M(size, domeNutHexH):
nutType == thinSquareNut? M(size, thinSquareNutH):
nutType == studdingConnector? M(size, studdingConnectorNutL):
nutType == squareNut? M(size, squareNutH):
nutType == wingNut? M(size, wingNutBaseH):
nutType == wingNutAllowTurn? M(size, wingNutBaseH):
ScrewsMetric_nut_type_does_not_exist___Try_another_type();

function M_getNutPeakD(nutType, size) = nutType == fullNut? M(size, nutPeakD):
nutType == nylocNut? M(size, nutPeakD):
nutType == domeNut? M(size, nutPeakD):
nutType == thinSquareNut? M(size, squareNutPeakD):
nutType == studdingConnector? M(size, nutPeakD):
nutType == squareNut? M(size, squareNutPeakD):
nutType == wingNut? M(size, wingNutWingExtension):
nutType == wingNutAllowTurn? M(size, wingNutWingExtension):
ScrewsMetric_nut_type_does_not_exist___Try_another_type();

function M_getNutFlatD(nutType, size) = nutType == fullNut? M(size, nutFlatD):
nutType == nylocNut? M(size, nutFlatD):
nutType == domeNut? M(size, nutFlatD):
nutType == thinSquareNut? M(size, squareNutFlatD):
nutType == studdingConnector? M(size, nutFlatD):
nutType == squareNut? M(size, squareNutPeakD):
nutType == wingNut? M(size, wingNutBaseD):
nutType == wingNutAllowTurn? M(size, wingNutWingExtension):
ScrewsMetric_nut_type_does_not_exist___Try_another_type();

function ScrewsMetric_nut_type_does_not_exist___Try_another_type() = SG_proceedOnError?undef:ScrewsMetric_nut_type_does_not_exist___Try_another_type();

module M_Nut(nutType, size, ERR = 0, hollow = false, VertERR=0){
   if(nutType == fullNut){
      M_FullNut(size, ERR, hollow, VertERR);
   } else if(nutType == nylocNut){
      M_NylocNut(size, ERR, hollow, VertERR);
   } else if(nutType == domeNut){
      M_DomeNut(size, ERR, hollow, VertERR);
   } else if(nutType == thinSquareNut){
      M_ThinSquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == studdingConnector){
      M_StuddingConnector(size, ERR, hollow, VertERR);
   } else if(nutType == squareNut){
      M_SquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == wingNut){
      M_WingNutLocked(size, ERR, hollow, VertERR);
   } else if(nutType == wingNutAllowTurn){
      M_WingNutRotatable(size, ERR, hollow, VertERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      M_FullNut(size, length, ERR, hollow, VertERR);
   }
}
module M_NutNormalWithSurface(nutType, size, ERR = 0, hollow = false, VertERR=0){
   if(nutType == fullNut){
      translate([0, 0, -M(size, fullNutH)])M_FullNut(size, ERR, hollow, VertERR);
   } else if(nutType == nylocNut){
      M_NylocNut(size, ERR, hollow, VertERR);
   } else if(nutType == domeNut){
      M_DomeNut(size, ERR, hollow, VertERR);
   } else if(nutType == thinSquareNut){
      translate([0, 0, -M(size, thinSquareNutH)])M_ThinSquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == studdingConnector){
      M_StuddingConnector(size, ERR, hollow, VertERR);
   } else if(nutType == squareNut){
      translate([0, 0, -M(size, squareNutH)])M_SquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == wingNut){
      M_WingNutLocked(size, ERR, hollow, VertERR);
   } else if(nutType == wingNutAllowTurn){
      M_WingNutRotatable(size, ERR, hollow, VertERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      translate([0, 0, -M(size, fullNutH)])M_FullNut(size, length, ERR, hollow, VertERR);
   }
}
module M_NutFlushWithSurface(nutType, size, ERR = 0, hollow = false, VertERR=0, override = false){
   if(nutType == fullNut){
      translate([0, 0, -M(size, fullNutH)])M_FullNut(size, ERR, hollow, VertERR);
   } else if(nutType == nylocNut){
      translate([0, 0, -M(size, nylocNutH)])M_NylocNut(size, ERR, hollow, VertERR);
   } else if(nutType == domeNut){
      translate([0, 0, -M(size, domeNutTotalH)])M_DomeNut(size, ERR, hollow, VertERR);
   } else if(nutType == thinSquareNut){
      translate([0, 0, -M(size, thinSquareNutH)])M_ThinSquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == studdingConnector){
      translate([0, 0, -M(size, studdingConnectorNutL)])M_StuddingConnector(size, ERR, hollow, VertERR);
   } else if(nutType == squareNut){
      translate([0, 0, -M(size, squareNutH)])M_SquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == wingNut){
      if(override){
         translate([0, 0, -M(size, wingNutWingH)])M_WingNutLocked(size, ERR, hollow, VertERR);
      }else{
         echo("WARNING: Wing Nuts do not inset well, as you they are kind of wierd, so will be left on surface, if you want to inset anyway, please use \'override = true\'");
         M_WingNutLocked(size, ERR, hollow, VertERR);
      }
   } else if(nutType == wingNutAllowTurn){
      if(override){
         translate([0, 0, -M(size, wingNutWingH)])M_WingNutRotatable(size, ERR, hollow, VertERR);
      }else{
         echo("WARNING: Wing Nuts do not inset well, as you they are kind of wierd, so will be left on surface, if you want to inset anyway, please use \'override = true\'");
         M_WingNutRotatable(size, ERR, hollow, VertERR);
      }
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      translate([0, 0, -M(size, fullNutH)])M_FullNut(size, length, ERR, hollow, VertERR);
   }
}
module M_NutSemiFlushWithSurface(nutType, size, ERR = 0, hollow = false, VertERR=0, override = false){
   if(nutType == fullNut){
      translate([0, 0, -M(size, fullNutH)])M_FullNut(size, ERR, hollow, VertERR);
   } else if(nutType == nylocNut){
      translate([0, 0, -M(size, fullNutH)])M_NylocNut(size, ERR, hollow, VertERR);
   } else if(nutType == domeNut){
      translate([0, 0, -M(size, domeNutHexH)])M_DomeNut(size, ERR, hollow, VertERR);
   } else if(nutType == thinSquareNut){
      translate([0, 0, -M(size, thinSquareNutH)])M_ThinSquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == studdingConnector){
      translate([0, 0, -M(size, studdingConnectorNutL)])M_StuddingConnector(size, ERR, hollow, VertERR);
   } else if(nutType == squareNut){
      translate([0, 0, -M(size, squareNutH)])M_SquareNut(size, ERR, hollow, VertERR);
   } else if(nutType == wingNut){
      if(override){
         translate([0, 0, -M(size, wingNutBaseH)])M_WingNutLocked(size, ERR, hollow, VertERR);
      }else{
         echo("WARNING: Wing Nuts do not inset well, as you they are kind of wierd, so will be left on surface, if you want to inset anyway, please use \'override = true\'");
         M_WingNutLocked(size, ERR, hollow, VertERR);
      }
   } else if(nutType == wingNutAllowTurn){
      if(override){
         translate([0, 0, -M(size, wingNutBaseH)])M_WingNutRotatable(size, ERR, hollow, VertERR);
      }else{
         echo("WARNING: Wing Nuts do not inset well, as you they are kind of wierd, so will be left on surface, if you want to inset anyway, please use \'override = true\'");
         M_WingNutRotatable(size, ERR, hollow, VertERR);
      }
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      M_FullNut(size, length, ERR, hollow, VertERR);
   }
}




module M_NutVertHole(nutType, size, depth, ERR = 0){
   if(nutType == fullNut){
      M_FullNutVertHole(size, depth, ERR);
   } else if(nutType == nylocNut){
      M_NylocNutVertHole(size, depth, ERR);
   } else if(nutType == domeNut){
      M_DomeNutVertHole(size, depth, ERR);
   } else if(nutType == thinSquareNut){
      M_ThinSquareNutVertHole(size, depth, ERR);
   } else if(nutType == studdingConnector){
      M_StuddingConnectorVertHole(size, depth, ERR);
   } else if(nutType == squareNut){
      M_SquareNutVertHole(size, depth, ERR);
   } else if(nutType == wingNut){
      M_WingNutLockedVertHole(size, depth, ERR);
   } else if(nutType == wingNutAllowTurn){
      M_WingNutRotatableVertHole(size, depth, ERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      M_FullNutVertHole(size, depth, ERR);
   }
}
module M_NutVertHoleFromNormal(nutType, size, depth, ERR = 0){
   if(nutType == fullNut){
      translate([0, 0, -M(size, fullNutH)])M_FullNutVertHole(size, depth+M(size, fullNutH), ERR);
   } else if(nutType == nylocNut){
      M_NylocNutVertHole(size, depth, ERR);
   } else if(nutType == domeNut){
      M_DomeNutVertHole(size, depth, ERR);
   } else if(nutType == thinSquareNut){
      translate([0, 0, -M(size, thinSquareNutH)])M_ThinSquareNutVertHole(size, depth+M(size, thinSquareNutH), ERR);
   } else if(nutType == studdingConnector){
      M_StuddingConnectorVertHole(size, depth, ERR);
   } else if(nutType == squareNut){
      translate([0, 0, -M(size, squareNutH)])M_SquareNutVertHole(size, depth+M(size, squareNutH), ERR);
   } else if(nutType == wingNut){
      M_WingNutLockedVertHole(size, depth, ERR);
   } else if(nutType == wingNutAllowTurn){
      M_WingNutRotatableVertHole(size, depth, ERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      translate([0, 0, -M(size, fullNutH)])M_FullNutVertHole(size, depth+M(size, fullNutH), ERR);
   }
}
module M_NutVertHoleFromTop(nutType, size, depth, ERR = 0){
   if(nutType == fullNut){
      translate([0, 0, -M(size, fullNutH)])M_FullNutVertHole(size, depth+M(size, fullNutH), ERR);
   } else if(nutType == nylocNut){
      translate([0, 0, -M(size, nylocNutH)])M_NylocNutVertHole(size, depth+M(size, nylocNutH), ERR);
   } else if(nutType == domeNut){
      translate([0, 0, -M(size, domeNutTotalH)])M_DomeNutVertHole(size, depth+M(size, domeNutTotalH), ERR);
   } else if(nutType == thinSquareNut){
      translate([0, 0, -M(size, thinSquareNutH)])M_ThinSquareNutVertHole(size, depth+M(size, thinSquareNutH), ERR);
   } else if(nutType == studdingConnector){
      translate([0, 0, -M(size, studdingConnectorNutL)])M_StuddingConnectorVertHole(size, depth+M(size, studdingConnectorNutL), ERR);
   } else if(nutType == squareNut){
      translate([0, 0, -M(size, squareNutH)])M_SquareNutVertHole(size, depth+M(size, squareNutH), ERR);
   } else if(nutType == wingNut){
      translate([0, 0, -M(size, wingNutWingH)])M_WingNutLockedVertHole(size, depth+M(size, wingNutWingH), ERR);
   } else if(nutType == wingNutAllowTurn){
      translate([0, 0, -M(size, wingNutWingH)])M_WingNutRotatableVertHole(size, depth+M(size, wingNutWingH), ERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      translate([0, 0, -M(size, fullNutH)])M_FullNutVertHole(size, depth+M(size, fullNutH), ERR);
   }
}
module M_NutVertHoleFromSemiTop(nutType, size, depth, ERR = 0){
   if(nutType == fullNut){
      translate([0, 0, -M(size, fullNutH)])M_FullNutVertHole(size, depth+M(size, fullNutH), ERR);
   } else if(nutType == nylocNut){
      translate([0, 0, -M(size, fullNutH)])M_NylocNutVertHole(size, depth+M(size, fullNutH), ERR);
   } else if(nutType == domeNut){
      translate([0, 0, -M(size, domeNutHexH)])M_DomeNutVertHole(size, depth+M(size, domeNutHexH), ERR);
   } else if(nutType == thinSquareNut){
      translate([0, 0, -M(size, thinSquareNutH)]) M_ThinSquareNutVertHole(size, depth+M(size, thinSquareNutH), ERR);
   } else if(nutType == studdingConnector){
      translate([0, 0, -M(size, studdingConnectorNutL)])M_StuddingConnectorVertHole(size,  depth+M(size, studdingConnectorNutL), ERR);
   } else if(nutType == squareNut){
      translate([0, 0, -M(size, squareNutH)])M_SquareNutVertHole(size, depth+M(size, squareNutH), ERR);
   } else if(nutType == wingNut){
      translate([0, 0, -M(size, wingNutBaseH)])M_WingNutLockedVertHole(size, depth+M(size, wingNutBaseH), ERR);
   } else if(nutType == wingNutAllowTurn){
      translate([0, 0, -M(size, wingNutBaseH)])M_WingNutRotatableVertHole(size, depth+M(size, wingNutBaseH), ERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      translate([0, 0, -M(size, fullNutH)])M_FullNutVertHole(size, depth+M(size, fullNutH), ERR);
   }
}


module M_NutHole(nutType, size, depth, ERR = 0, VertERR=0){
   if(nutType == fullNut){
      M_FullNutHole(size, depth, ERR, VertERR);
   } else if(nutType == nylocNut){
      M_NylocNutHole(size, depth, ERR, VertERR);
   } else if(nutType == domeNut){
      M_DomeNutHole(size, depth, ERR, VertERR);
   } else if(nutType == thinSquareNut){
      M_ThinSquareNutHole(size, depth, ERR, VertERR);
   } else if(nutType == studdingConnector){
      M_StuddingConnectorHole(size, depth, ERR, VertERR);
   } else if(nutType == squareNut){
      M_SquareNutHole(size, depth, ERR, VertERR);
   } else if(nutType == wingNut){
      M_WingNutLockedHole(size, depth, ERR, VertERR);
   } else if(nutType == wingNutAllowTurn){
      echo("WARNING: There is no way you would want a wing nut to be rotatable when imbedded in something, so the system will make it fixed in place, to remove this error, use wingNut as opposed to wingNutAllowTurn");
      M_WingNutLockedHole(size, depth, ERR, VertERR);
   } else {
      echo("ERROR: Nut type not recognised, proceding with default nut");
      M_FullNut(size, length, ERR, VertERR);
   }
}