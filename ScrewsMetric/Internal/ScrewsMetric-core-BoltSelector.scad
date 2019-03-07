//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core-modules.scad>;
allenBolt = 0;
allenButtonBolt = 1;
allenCountersunkBolt = 2;
hexHeadBolt = 3;
hexFlangeBolt = 4;
hexHeadBoltAllowSpin = 5;


function isBoltInScrewsMetric(boltType, size) = boltType == allenBolt ? isValueInScrewsMetric(size, allenBoltHeadD) :
boltType == allenButtonBolt ? isValueInScrewsMetric(size, allenButtonBoltHeadD):
boltType == allenCountersunkBolt ? isValueInScrewsMetric(size, allenCountersunkBoltHeadD) :
boltType == hexHeadBolt ? isValueInScrewsMetric(size, hexHeadBoltHeadH) :
boltType == hexFlangeBolt ? isValueInScrewsMetric(size, hexFlangeD) :
boltType == hexHeadBoltAllowSpin ? isValueInScrewsMetric(size, hexHeadBoltHeadH) :
ScrewsMetric_bolt_type_does_not_exist___Try_another_type();

function M_getHeadDiameter(boltType, size) = boltType == allenBolt ? M(size, allenBoltHeadD) :
boltType == allenButtonBolt ? M(size, allenButtonBoltHeadD) :
boltType == allenCountersunkBolt ? M(size, allenCountersunkBoltHeadD) :
boltType == hexHeadBolt ? M(size, hexHeadPeakD) :
boltType == hexFlangeBolt ? M(size, hexFlangeD) :
boltType == hexHeadBoltAllowSpin ? M(size, hexHeadPeakD) :
ScrewsMetric_bolt_type_does_not_exist___Try_another_type();

function M_getHeadHeight(boltType, size) = boltType == allenBolt ? M(size, allenBoltHeadH) :
boltType == allenButtonBolt ? M(size, allenButtonBoltHeadH) :
boltType == allenCountersunkBolt ? M(size, allenCountersunkBoltHeadH) :
boltType == hexHeadBolt ? M(size, hexHeadBoltHeadH) :
boltType == hexFlangeBolt ? M(size, hexFlangeHeadH) :
boltType == hexHeadBoltAllowSpin ? M(size, hexHeadBoltHeadH) :
ScrewsMetric_bolt_type_does_not_exist___Try_another_type();

function ScrewsMetric_bolt_type_does_not_exist___Try_another_type() = ScrewsMetric_bolt_type_does_not_exist___Try_another_type();

module M_BoltOnSurface(boltType, size, length, ERR=0, hollow = false, silent = false){
   if(boltType == allenBolt){
      M_AllenBolt(size, length, ERR, hollow);
      if(!silent)echo("Allen bolt not being inset, may look slightly dodgy");
   }else if(boltType == allenButtonBolt){
      M_AllenButtonBolt(size, length, ERR, hollow);
   }else if(boltType == allenCountersunkBolt){
      M_AllenCountersunkBolt(size, length, ERR, hollow);
   }else if(boltType == hexHeadBolt){
      M_HexHeadBolt(size, length, ERR, hollow);
   }else if(boltType == hexFlangeBolt){
      M_HexHeadFlangeBolt(size, length, ERR, hollow);
   }else if(boltType == hexHeadBoltAllowSpin){
      M_HexHeadBoltHoleAllowingSpin(size, length, M(size, hexHeadBoltHeadH), ERR, hollow);
   }else{
      echo("ERROR: Bolt type not recognised, proceding with default bolt");
      if(!silent)echo("Allen bolt not being inset, may look slightly dodgy");
      M_AllenBolt(size, length, ERR, hollow);
   }
}
module M_BoltFlushWithSurface(boltType, size, length, ERR=0, hollow = false, override = false, silent = false){
   if(boltType == allenBolt){
      translate([0, 0, -M(size, allenBoltHeadH)])AllenBolt(size, length-M(size, allenBoltHeadH), ERR, hollow);
   }else if(boltType == allenButtonBolt){
      if(!override){
         echo("WARNING: Button bolts do not inset well, so will be left on surface, if you want to inset anyway, please use \'override = true\'");
         M_AllenButtonBolt(size, length, ERR, hollow);
      }else{
         if(!silent)echo("Button bolt being inset, this may not look good");
         translate([0, 0, -M(size, allenButtonBoltHeadH)])M_AllenButtonBolt(size, length-M(size, allenButtonBoltHeadH), ERR, hollow);
      }
   }else if(boltType == allenCountersunkBolt){
      M_AllenCountersunkBolt(size, length, ERR, hollow);
   }else if(boltType == hexHeadBolt){
      if(!silent)echo("Hex bolt being inset, this will not allow it to be turned, it will be captive");
      translate([0, 0, -M(size, hexHeadBoltHeadH)])M_HexHeadBolt(size, length-M(size, hexHeadBoltHeadH), ERR, hollow);
   }else if(boltType == hexFlangeBolt){
      if(!override){
         echo("WARNING: Hex flange bolts do not inset well, as you can't turn them, so will be left on surface, if you want to inset anyway, please use \'override = true\'");
         M_HexHeadFlangeBolt(size, length, ERR, hollow);
      }else{
         if(!silent)echo("Hex flange bolt being inset, this may not look good, and may be hard to turn");
         translate([0, 0, -M(size, hexFlangeHeadH)])M_HexHeadFlangeBoltHole(size, length-M(size, hexFlangeHeadH), M(size, hexFlangeHeadH), ERR, hollow);
      }
   }else if(boltType == hexHeadBoltAllowSpin){
      if(!silent)echo("WARNING: Hex bolt being inset, this can be turned, but there is no room to access it");
      translate([0, 0, -M(size, hexHeadBoltHeadH)])M_HexHeadBoltHoleAllowingSpin(size, length-M(size, hexHeadBoltHeadH), ERR, hollow);
   }else{
      echo("ERROR: Bolt type not recognised, proceding with default bolt");
      translate([0, 0, -M(size, allenBoltHeadH)])M_AllenBolt(size, length-M(size, allenBoltHeadH), ERR, hollow);
   }
}

module M_BoltNormalWithSurface(boltType, size, length, ERR=0, hollow = false, silent = false){
   if(boltType == allenBolt){
      translate([0, 0, -M(size, allenBoltHeadH)])M_AllenBolt(size, length-M(size, allenBoltHeadH), ERR, hollow);
   }else if(boltType == allenButtonBolt){
      M_AllenButtonBolt(size, length, ERR, hollow);
   }else if(boltType == allenCountersunkBolt){
      M_AllenCountersunkBolt(size, length, ERR, hollow);
   }else if(boltType == hexHeadBolt){
      if(!silent)echo("Hex bolt being inset, this will not allow it to be turned, it will be captive");
      translate([0, 0, -M(size, hexHeadBoltHeadH)])M_HexHeadBolt(size, length-M(size, hexHeadBoltHeadH), ERR, hollow);
   }else if(boltType == hexFlangeBolt){
      M_HexHeadFlangeBolt(size, length, ERR, hollow);
   }else if(boltType == hexHeadBoltAllowSpin){
      M_HexHeadBoltHoleAllowingSpin(size, length, ERR, hollow);
   }else{
      echo("ERROR: Bolt type not recognised, proceding with default bolt");
      translate([0, 0, -M(size, allenBoltHeadH)])M_AllenBolt(size, length-M(size, allenBoltHeadH), ERR, hollow);
   }
}
module M_BoltInHoleFromTop(boltType, size, length, holeDepth, ERR=0, hollow = false, silent = false){
   if(boltType == allenBolt){
      translate([0, 0, -M(size, allenBoltHeadH)])M_AllenBoltHole(size, length-M(size, allenBoltHeadH), holeDepth+M(size, allenBoltHeadH), ERR, hollow);
   }else if(boltType == allenButtonBolt){
      if(!silent)echo("WARNING: Button bolts do not inset well, using another form of bolt is recommended");
      translate([0, 0, -M(size, allenButtonBoltHeadH)])M_AllenButtonBoltHole(size, length-M(size, allenButtonBoltHeadH), holeDepth+M(size, allenButtonBoltHeadH), ERR, hollow);
   }else if(boltType == allenCountersunkBolt){
      M_AllenCountersunkBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == hexHeadBolt){
      if(!silent)echo("Hex bolt being inset, this will not allow it to be turned, it will be captive");
      translate([0, 0, -M(size, hexHeadBoltHeadH)])M_HexHeadBoltHole(size, length-M(size, hexHeadBoltHeadH), holeDepth+M(size, hexHeadBoltHeadH), ERR, hollow);
   }else if(boltType == hexFlangeBolt){
      if(!silent)echo("WARNING: Hex flange bolt being inset, this may not look good, and may be hard to turn, using another form of bolt is recommended");
      translate([0, 0, -M(size, hexFlangeHeadH)])M_HexHeadFlangeBoltHole(size, length-M(size, hexFlangeHeadH), M(size, hexFlangeHeadH)+holeDepth, ERR, hollow);
   }else if(boltType == hexHeadBoltAllowSpin){
      if(!silent)echo("WARNING: Hex bolt being inset, this can be turned, but there is no room to access it");
      translate([0, 0, -M(size, hexHeadBoltHeadH)])M_HexHeadBoltHoleAllowingSpin(size, length-M(size, hexHeadBoltHeadH), holeDepth+M(size, hexHeadBoltHeadH), ERR, hollow);
   }else{
      echo("ERROR: Bolt type not recognised, proceding with default bolt");
      translate([0, 0, -M(size, allenBoltHeadH)])M_AllenBoltHole(size, length-M(size, allenBoltHeadH), holeDepth+M(size, allenBoltHeadH), ERR, hollow);
   }
}
module M_BoltInHoleFromBottom(boltType, size, length, holeDepth, ERR=0, hollow = false, silent = false){
   if(boltType == allenBolt){
      M_AllenBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == allenButtonBolt){
      if(!silent)echo("WARNING: Button bolts do not inset well, using another form of bolt is recommended");
      M_AllenButtonBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == allenCountersunkBolt){
      translate([0, 0, M(size, allenCountersunkBoltHeadH)])M_AllenCountersunkBoltHole(size, length+M(size, allenCountersunkBoltHeadH), holeDepth-M(size, allenCountersunkBoltHeadH), ERR, hollow);
   }else if(boltType == hexHeadBolt){
      if(!silent)echo("Hex bolt being inset, this will not allow it to be turned, it will be captive");
      M_HexHeadBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == hexFlangeBolt){
      if(!silent)echo("WARNING: Hex flange bolt being inset, this may not look good, and may be hard to turn, using another form of bolt is recommended");
      M_HexHeadFlangeBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == hexHeadBoltAllowSpin){
      if(!silent)echo("WARNING: Hex bolt being inset, this can be turned, but there is no room to access it");
      M_HexHeadBoltHoleAllowingSpin(size, length, holeDepth, ERR, hollow);
   }else{
      echo("ERROR: Bolt type not recognised, proceding with default bolt");
      M_AllenBoltHole(size, length, holeDepth, ERR, hollow);
   }
}
module M_BoltInHoleFromNormal(boltType, size, length, holeDepth, ERR=0, hollow = false, silent = false){
   if(boltType == allenBolt){
      translate([0, 0, -M(size, allenBoltHeadH)])M_AllenBoltHole(size, length-M(size, allenBoltHeadH), holeDepth+M(size, allenBoltHeadH), ERR, hollow);
   }else if(boltType == allenButtonBolt){
      if(!silent)echo("WARNING: Button bolts do not inset well, using another form of bolt is recommended");
      M_AllenButtonBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == allenCountersunkBolt){
      M_AllenCountersunkBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == hexHeadBolt){
      if(!silent)echo("Hex bolt being inset, this will not allow it to be turned, it will be captive");
      translate([0, 0, -M(size, hexHeadBoltHeadH)])M_HexHeadBoltHole(size, length-M(size, hexHeadBoltHeadH), holeDepth+M(size, hexHeadBoltHeadH), ERR, hollow);
   }else if(boltType == hexFlangeBolt){
      if(!silent)echo("WARNING: Hex flange bolt being inset, this may not look good, and may be hard to turn, using another form of bolt is recommended");
      M_HexHeadFlangeBoltHole(size, length, holeDepth, ERR, hollow);
   }else if(boltType == hexHeadBoltAllowSpin){
      if(!silent)echo("WARNING: Hex bolt being inset, this can be turned, but there is no room to access it");
      M_HexHeadBoltHoleAllowingSpin(size, length, holeDepth, ERR, hollow);
   }else{
      echo("ERROR: Bolt type not recognised, proceding with default bolt");
      M_AllenBoltHole(size, length, holeDepth, ERR, hollow);
   }
}
