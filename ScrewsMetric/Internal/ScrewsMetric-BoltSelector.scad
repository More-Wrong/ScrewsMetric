//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core-BoltSelector.scad>;

function isBoltInScrewsSystem(boltType, size) = isBoltInScrewsMetric(boltType, size);
function getHeadDiameter(boltType, size) = M_getHeadDiameter(boltType, size);
function getHeadHeight(boltType, size) = M_getHeadHeight(boltType, size);

module BoltOnSurface(boltType, size, length, ERR=0, hollow = false, silent = false){
    M_BoltOnSurface(boltType, size, length, ERR, hollow, silent);
}
module BoltFlushWithSurface(boltType, size, length, ERR=0, hollow = false, override = false, silent = false){
   M_BoltFlushWithSurface(boltType, size, length, ERR, hollow, override, silent);
}
module BoltNormalWithSurface(boltType, size, length, ERR=0, hollow = false, silent = false){
   M_BoltNormalWithSurface(boltType, size, length, ERR, hollow, silent);
}
module BoltInHoleFromTop(boltType, size, length, holeDepth, ERR=0, hollow = false, silent = false){
   M_BoltInHoleFromTop(boltType, size, length, holeDepth, ERR, hollow, silent);
}
module BoltInHoleFromBottom(boltType, size, length, holeDepth, ERR=0, hollow = false, silent = false){
   M_BoltInHoleFromBottom(boltType, size, length, holeDepth, ERR, hollow, silent);
}
module BoltInHoleFromNormal(boltType, size, length, holeDepth, ERR=0, hollow = false, silent = false){
   M_BoltInHoleFromNormal(boltType, size, length, holeDepth, ERR, hollow, silent);
}
echo("ScrewsMetric Bolt types: \'allenBolt\' \'allenButtonBolt\' \'allenCountersunkBolt\' \'hexHeadBolt\' \'hexFlangeBolt\' \'hexHeadBoltAllowSpin\'\n");
echo("ScrewsMetric bolt system utility functions: \'getHeadDiameter\' \'getHeadHeight\'");
echo("ScrewsMetric bolt system modules:  \'BoltOnSurface\' \'BoltFlushWithSurface\' \'BoltNormalWithSurface\' \'BoltInHoleFromTop\' \'BoltInHoleFromBottom\' \'BoltInHoleFromDefault\' \'BoltInHoleFromNormal\'\n");
