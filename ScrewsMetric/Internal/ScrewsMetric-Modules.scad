//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core-modules.scad>;
module AllenBolt(size, length, ERR=0,hollow = false){
   M_AllenBolt(size, length, ERR,hollow);
}
module AllenBoltHole(size, length, holeDepth, ERR=0,hollow = false){
   M_AllenBoltHole(size, length, holeDepth, ERR,hollow);
}
module AllenButtonBolt(size, length, ERR=0,hollow = false){
   M_AllenButtonBolt(size, length, ERR,hollow);
}
module AllenButtonBoltHole(size, length, holeDepth, ERR=0,hollow = false){
   M_AllenButtonBoltHole(size, length, holeDepth, ERR,hollow);
}
module AllenCountersunkBolt(size, length, ERR=0,hollow = false){
   M_AllenCountersunkBolt(size, length, ERR,hollow);
}
module AllenCountersunkBoltHole(size, length, holeDepth, ERR=0,hollow = false){
   M_AllenCountersunkBoltHole(size, length, holeDepth, ERR,hollow);
}
module HexHeadBolt(size, length, ERR=0,hollow = false){
   M_HexHeadBolt(size, length, ERR,hollow);
}
module HexHeadBoltHole(size, length, holeDepth, ERR=0,hollow = false){
   M_HexHeadBoltHole(size, length, holeDepth, ERR,hollow);
}
module HexHeadBoltHoleAllowingSpin(size, length, holeDepth, ERR=0,hollow = false){
   M_HexHeadBoltHoleAllowingSpin(size, length, holeDepth, ERR,hollow);
}
module HexHeadFlangeBoltHole(size, length, holeDepth, ERR=0,hollow = false){
   M_HexHeadFlangeBoltHole(size, length, holeDepth, ERR,hollow);
}
module HexHeadFlangeBolt(size, length, ERR=0,hollow = false){
   M_HexHeadFlangeBolt(size, length, ERR,hollow);
}

module FullNut(size, ERR=0,hollow = false, VertERR=0){
   M_FullNut(size, ERR,hollow, VertERR);
}
module NylocNut(size, ERR=0,hollow = false, VertERR=0){
   M_NylocNut(size, ERR,hollow, VertERR);
}
module DomeNut(size, ERR=0,hollow = false, VertERR=0){
   M_DomeNut(size, ERR,hollow, VertERR);
}
module ThinSquareNut(size, ERR=0,hollow = false, VertERR=0){
   M_ThinSquareNut(size, ERR,hollow, VertERR);
}
module StuddingConnector(size, ERR=0,hollow = false, VertERR=0){
   M_StuddingConnector(size, ERR,hollow, VertERR);
}
module SquareNut(size, ERR=0,hollow = false, VertERR=0){
   M_SquareNut(size, ERR,hollow, VertERR);
}
module WingNutLocked(size, ERR=0, hollow = false, VertERR=0){
   M_WingNutLocked(size, ERR, hollow, VertERR);
}
module WingNutRotatable(size, ERR=0, hollow = false, VertERR=0){
   M_WingNutRotatable(size, ERR, hollow, VertERR);
}


module FullNutVertHole(size, depth, ERR=0){
   M_FullNutVertHole(size, depth, ERR);
}
module NylocNutVertHole(size, depth, ERR=0){
   M_NylocNutVertHole(size, depth, ERR);
}
module DomeNutVertHole(size, depth, ERR=0){
   M_DomeNutVertHole(size, depth, ERR);
}
module ThinSquareNutVertHole(size, depth, ERR=0){
   M_ThinSquareNutVertHole(size, depth, ERR);
}
module StuddingConnectorVertHole(size, depth, ERR=0){
   M_StuddingConnectorVertHole(size, depth, ERR);
}
module SquareNutVertHole(size, depth, ERR=0){
   M_SquareNutVertHole(size, depth, ERR);
}
module WingNutLockedVertHole(size, depth, ERR=0){
   M_WingNutLockedVertHole(size, depth, ERR);
}
module WingNutRotatableVertHole(size, depth, ERR=0){
   M_WingNutRotatableVertHole(size, depth, ERR);
}



module FullNutHole(size, distFromEdge, ERR=0, VertERR=0){
   M_FullNutHole(size, distFromEdge, ERR, VertERR);
}
module NylockNutHole(size, distFromEdge, ERR=0, VertERR=0){
   M_NylockNutHole(size, distFromEdge, ERR, VertERR);
}
module DomeNutHole(size, distFromEdge, ERR=0, VertERR=0){
   M_DomeNutHole(size, distFromEdge, ERR, VertERR);
}
module ThinSquareNutHole(size, distFromEdge, ERR=0, VertERR=0){
   M_ThinSquareNutHole(size, distFromEdge, ERR, VertERR);
}
module StuddingConnectorHole(size, distFromEdge, ERR=0, VertERR=0){
   M_StuddingConnectorHole(size, distFromEdge, ERR, VertERR);
}
module SquareNutHole(size, distFromEdge, ERR=0, VertERR=0){
   M_SquareNutHole(size, distFromEdge, ERR, VertERR);
}
module WingNutLockedHole(size, distFromEdge, ERR=0, VertERR=0){
   M_WingNutLockedHole(size, distFromEdge, ERR, VertERR);
}

module Rod(size, length, ERR=0, hollow = false){
   M_Rod(size, length, ERR=0, hollow = false);
}

echo("ScrewsMetric basic modules: 'AllenBolt' 'AllenBoltHole' 'HexHeadBolt' 'HexHeadBoltHole' 'HexHeadBoltHoleAllowingSpin' 'HexHeadFlangeBolt' 'HexHeadFlangeBoltHole' 'ThinSquareNut' 'SquareNut' 'StuddingConnector' 'FullNut' 'NylockNut' 'DomeNut' 'Rod' 'ThinSquareNutVertHole' 'SquareNutVertHole' 'StuddingConnectorVertHole' 'FullNutVertHole' 'NylockNutVertHole' 'DomeNutVertHole' 'WingNutLockedVertHole' 'WingNutRotatableVertHole' 'ThinSquareNutHole' 'SquareNutHole' 'StuddingConnectorHole' 'FullNutHole' 'NylockNutHole' 'DomeNutHole' 'AllenButtonBolt' 'AllenButtonBoltHole' 'AllenCountersunkBolt' 'AllenCountersunkBoltHole' 'WingNutLocked' 'WingNutRotatable' 'WingNutLockedHole' \n");