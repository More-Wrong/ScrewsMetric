//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core-NutSelector.scad>;
function isNutInScrewsSystem(nutType, size) = isNutInScrewsMetric(nutType, size);
function getNutH(nutType, size) = M_getNutH(nutType, size);
function getNutSideH(nutType, size) = M_getNutSideH(nutType, size);
function getNutPeakD(nutType, size) = M_getNutPeakD(nutType, size);
function getNutFlatD(nutType, size) = M_getNutFlatD(nutType, size);

module Nut(nutType, size, ERR = 0, hollow = false, VertERR=0){
   M_Nut(nutType, size, ERR, hollow, VertERR);
}
module NutNormalWithSurface(nutType, size, ERR = 0, hollow = false, VertERR=0){
   M_NutNormalWithSurface(nutType, size, ERR, hollow, VertERR);
}
module NutFlushWithSurface(nutType, size, ERR = 0, hollow = false, VertERR=0, override = false){
   M_NutFlushWithSurface(nutType, size, ERR, hollow, VertERR, override);
}
module NutSemiFlushWithSurface(nutType, size, ERR = 0, hollow = false, VertERR=0, override = false){
   M_NutSemiFlushWithSurface(nutType, size, ERR, hollow, VertERR, override);
}

module NutVertHole(nutType, size, depth, ERR = 0){
   M_NutVertHole(nutType, size, depth, ERR);
}
module NutVertHoleFromNormal(nutType, size, depth, ERR = 0){
   M_NutVertHoleFromNormal(nutType, size, depth, ERR);
}
module NutVertHoleFromTop(nutType, size, depth, ERR = 0){
   M_NutVertHoleFromTop(nutType, size, depth, ERR);
}
module NutVertHoleFromSemiTop(nutType, size, depth, ERR = 0){
   M_NutVertHoleFromSemiTop(nutType, size, depth, ERR);
}


module NutHole(nutType, size, depth, ERR = 0, VertERR=0){
   M_NutHole(nutType, size, depth, ERR, VertERR);
}
echo("ScrewsMetric Nut types: 'fullNut' 'nylocNut' 'domeNut' 'thinSquareNut' 'studdingConnector' 'squareNut' 'wingNut' 'wingNutAllowTurn' \n");

echo("ScrewsMetric Nut Methods: 'Nut' 'NutNormalWithSurface' 'NutFlushWithSurface' 'NutSemiFlushWithSurface' 'NutVertHole' 'NutVertHoleFromNormal' 'NutVertHoleFromTop' 'NutVertHoleFromSemiTop' 'NutHole' \n");
