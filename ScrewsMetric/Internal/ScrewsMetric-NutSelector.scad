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
module NutHole(nutType, size, depth, ERR = 0, VertERR=0){
   M_NutHole(nutType, size, depth, ERR, VertERR);
}
echo("ScrewsMetric Nut types: 'fullNut' 'nylocNut' 'domeNut' 'thinSquareNut' 'studdingConnector' 'squareNut' 'wingNut' 'wingNutAllowTurn' \n");
