//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-sizeDeclaration.scad>;

MGN_7 = 1;
MGN_9 = 2;
MGN_12 = 3;
MGN_15 = 4;
MGW_7 = 5;
MGW_9 = 6;
MGW_12 = 7;
MGW_15 = 8;

echo(str(SCREWS_SYSTEM_MODE, " Rails sytem loaded, this is an optional additional section. To retrive information use railDimensions, for example: 'railDimensions(MGN_7, linearRailHeight)'\n'getActualRailLength()' gives the closest rail length to the specified value that can be achieved\n'rail()' provides cut out for a rail of the chosen size, and for the block is chosen\n'railBlock()' provides cut out for a block of the chosen size\n'getRailBlockBoltPositions()' provides an array of the locations of the bolts relative to the top corner of the block\n'railBoltPositionsTranslate()' translates any children to the bolt holes for the rail\n'railBlockBoltPositionsTranslate()' translates any children to the bolt holes for the rail block, this has a mirroring version, which tries to preserve rotation better, railBlockBoltPositionsTranslateMirroring()\n"));
echo("Available Rail Sizes: 'MGN_7' 'MGN_9' 'MGN_12' 'MGN_15' 'MGW_7' 'MGW_9' 'MGW_12' 'MGW_15'\n");
echo("Available Rail Information: 'linearRailAssemblyTotalHeight' 'linearRailHeight' 'linearRailWidth' 'linearRailBoltSize' 'linearRailBlockBoltSize' 'linearRailBlockWidth' 'linearRailBlockHLength' 'linearRailBlockCLength'\n");

linearRailAssemblyTotalHeight = 1;
linearRailHeight = 2;
linearRailWidth = 3;
linearRailBoltSize = 4;
linearRailBoltSeperation = 5;
linearRailBoltHeadInset = 6;
linearRailBoltHeadD = 7;
linearRailBlockWidth = 8;
linearRailBlockBoltSize = 9;
linearRailBlockBoltSeperation = 10;
linearRailBlockHeight = 11;
linearRailBlockHLength = 12;
linearRailBlockCLength = 13;
linearRailBlockCLengthBoltSeperation = 14;
linearRailBlockHLengthBoltSeperation = 15;
linearRailEndLength = 16;
linearRailBoltSeperationAcross = 17;
linearRailBlockHWidthBoltSeperation = 10;
linearRailBlockCWidthBoltSeperation = 18;


MGN_7_linearRailAssemblyTotalHeight = 8;
MGN_9_linearRailAssemblyTotalHeight = 10;
MGN_12_linearRailAssemblyTotalHeight = 13;
MGN_15_linearRailAssemblyTotalHeight = 16;
MGW_7_linearRailAssemblyTotalHeight = 9;
MGW_9_linearRailAssemblyTotalHeight = 12;
MGW_12_linearRailAssemblyTotalHeight = 14;
MGW_15_linearRailAssemblyTotalHeight = 16;

MGN_7_linearRailHeight = 4.8;
MGN_9_linearRailHeight = 6.5;
MGN_12_linearRailHeight = 8;
MGN_15_linearRailHeight = 10;
MGW_7_linearRailHeight = 5.2;
MGW_9_linearRailHeight = 7;
MGW_12_linearRailHeight = 8.5;
MGW_15_linearRailHeight = 9.5;

MGN_7_linearRailWidth = 7;
MGN_9_linearRailWidth = 9;
MGN_12_linearRailWidth = 12;
MGN_15_linearRailWidth = 15;
MGW_7_linearRailWidth = 14;
MGW_9_linearRailWidth = 18;
MGW_12_linearRailWidth = 24;
MGW_15_linearRailWidth = 42;

MGN_7_linearRailBoltSize = M2;
MGN_9_linearRailBoltSize = M3;
MGN_12_linearRailBoltSize = M3;
MGN_15_linearRailBoltSize = M3;
MGW_7_linearRailBoltSize = M3;
MGW_9_linearRailBoltSize = M3;
MGW_12_linearRailBoltSize = M4;
MGW_15_linearRailBoltSize = M4;

MGN_7_linearRailBoltSeperation = 15;
MGN_9_linearRailBoltSeperation = 20;
MGN_12_linearRailBoltSeperation = 25;
MGN_15_linearRailBoltSeperation = 40;
MGW_7_linearRailBoltSeperation = 30;
MGW_9_linearRailBoltSeperation = 30;
MGW_12_linearRailBoltSeperation = 40;
MGW_15_linearRailBoltSeperation = 40;

MGN_7_linearRailBoltHeadInset = 2.3;
MGN_9_linearRailBoltHeadInset = 3.5;
MGN_12_linearRailBoltHeadInset = 4.5;
MGN_15_linearRailBoltHeadInset = 4.5;
MGW_7_linearRailBoltHeadInset = 3.2;
MGW_9_linearRailBoltHeadInset = 4.5;
MGW_12_linearRailBoltHeadInset = 4.5;
MGW_15_linearRailBoltHeadInset = 4.5;

MGN_7_linearRailBoltHeadD = 4.2;
MGN_9_linearRailBoltHeadD = 6;
MGN_12_linearRailBoltHeadD = 6;
MGN_15_linearRailBoltHeadD = 6;
MGW_7_linearRailBoltHeadD = 6;
MGW_9_linearRailBoltHeadD = 6;
MGW_12_linearRailBoltHeadD = 8;
MGW_15_linearRailBoltHeadD = 8;

MGN_7_linearRailBlockWidth = 17;
MGN_9_linearRailBlockWidth = 20;
MGN_12_linearRailBlockWidth = 27;
MGN_15_linearRailBlockWidth = 32;
MGW_7_linearRailBlockWidth = 25;
MGW_9_linearRailBlockWidth = 30;
MGW_12_linearRailBlockWidth = 40;
MGW_15_linearRailBlockWidth = 60;

MGN_7_linearRailBlockBoltSize = M2;
MGN_9_linearRailBlockBoltSize = M3;
MGN_12_linearRailBlockBoltSize = M3;
MGN_15_linearRailBlockBoltSize = M3;
MGW_7_linearRailBlockBoltSize = M3;
MGW_9_linearRailBlockBoltSize = M3;
MGW_12_linearRailBlockBoltSize = M3;
MGW_15_linearRailBlockBoltSize = M4;

MGN_7_linearRailBlockBoltSeperation = 12;
MGN_9_linearRailBlockBoltSeperation = 15;
MGN_12_linearRailBlockBoltSeperation = 20;
MGN_15_linearRailBlockBoltSeperation = 25;
MGW_7_linearRailBlockBoltSeperation = 19;
MGW_9_linearRailBlockCWidthBoltSeperation = 21;
MGW_9_linearRailBlockHWidthBoltSeperation = 23;
MGW_12_linearRailBlockBoltSeperation = 28;
MGW_15_linearRailBlockBoltSeperation = 45;


MGN_7_linearRailBlockHeight = 6.5;
MGN_9_linearRailBlockHeight = 8;
MGN_12_linearRailBlockHeight = 10;
MGN_15_linearRailBlockHeight = 12;
MGW_7_linearRailBlockHeight = 7.1;
MGW_9_linearRailBlockHeight = 8.1;
MGW_12_linearRailBlockHeight = 10.6;
MGW_15_linearRailBlockHeight = 12.6;

MGN_7_linearRailBlockHLength = 30.8;
MGN_9_linearRailBlockHLength = 39.9;
MGN_12_linearRailBlockHLength = 45.4;
MGN_15_linearRailBlockHLength = 58.8;
MGW_7_linearRailBlockHLength = 41;
MGW_9_linearRailBlockHLength = 50.7;
MGW_12_linearRailBlockHLength = 60.4;
MGW_15_linearRailBlockHLength = 73.8;

MGN_7_linearRailBlockCLength = 22.5;
MGN_9_linearRailBlockCLength = 28.9;
MGN_12_linearRailBlockCLength = 34.7;
MGN_15_linearRailBlockCLength = 42.1;
MGW_7_linearRailBlockCLength = 31.2;
MGW_9_linearRailBlockCLength = 39.3;
MGW_12_linearRailBlockCLength = 46.1;
MGW_15_linearRailBlockCLength = 54.8;

MGN_7_linearRailBlockCLengthBoltSeperation = 8;
MGN_9_linearRailBlockCLengthBoltSeperation = 10;
MGN_12_linearRailBlockCLengthBoltSeperation = 15;
MGN_15_linearRailBlockCLengthBoltSeperation = 20;
MGW_7_linearRailBlockCLengthBoltSeperation = 10;
MGW_9_linearRailBlockCLengthBoltSeperation = 12;
MGW_12_linearRailBlockCLengthBoltSeperation = 15;
MGW_15_linearRailBlockCLengthBoltSeperation = 20;

MGN_7_linearRailBlockHLengthBoltSeperation = 13;
MGN_9_linearRailBlockHLengthBoltSeperation = 16;
MGN_12_linearRailBlockHLengthBoltSeperation = 20;
MGN_15_linearRailBlockHLengthBoltSeperation = 25;
MGW_7_linearRailBlockHLengthBoltSeperation = 19;
MGW_9_linearRailBlockHLengthBoltSeperation = 24;
MGW_12_linearRailBlockHLengthBoltSeperation = 28;
MGW_15_linearRailBlockHLengthBoltSeperation = 35;

MGN_7_linearRailEndLength = 5;
MGN_9_linearRailEndLength = 7.5;
MGN_12_linearRailEndLength = 10;
MGN_15_linearRailEndLength = 15;
MGW_7_linearRailEndLength = 10;
MGW_9_linearRailEndLength = 10;
MGW_12_linearRailEndLength = 15;
MGW_15_linearRailEndLength = 15;

MGN_7_linearRailBoltSeperationAcross = -1;
MGN_9_linearRailBoltSeperationAcross = -1;
MGN_12_linearRailBoltSeperationAcross = -1;
MGN_15_linearRailBoltSeperationAcross = -1;
MGW_7_linearRailBoltSeperationAcross = -1;
MGW_9_linearRailBoltSeperationAcross = -1;
MGW_12_linearRailBoltSeperationAcross = -1;
MGW_15_linearRailBoltSeperationAcross = 23;


railDimensionArray = [
["ScrewsMetricName", "MGN_7", "MGN_9", "MGN_12", "MGN_15", "MGW_7", "MGW_9", "MGW_12", "MGW_15"],
["linearRailAssemblyTotalHeight", MGN_7_linearRailAssemblyTotalHeight, MGN_9_linearRailAssemblyTotalHeight, MGN_12_linearRailAssemblyTotalHeight, MGN_15_linearRailAssemblyTotalHeight, MGW_7_linearRailAssemblyTotalHeight, MGW_9_linearRailAssemblyTotalHeight, MGW_12_linearRailAssemblyTotalHeight, MGW_15_linearRailAssemblyTotalHeight],
["linearRailHeight", MGN_7_linearRailHeight, MGN_9_linearRailHeight, MGN_12_linearRailHeight, MGN_15_linearRailHeight, MGW_7_linearRailHeight, MGW_9_linearRailHeight, MGW_12_linearRailHeight, MGW_15_linearRailHeight],
["linearRailWidth", MGN_7_linearRailWidth, MGN_9_linearRailWidth, MGN_12_linearRailWidth, MGN_15_linearRailWidth, MGW_7_linearRailWidth, MGW_9_linearRailWidth, MGW_12_linearRailWidth, MGW_15_linearRailWidth],
["linearRailBoltSize", MGN_7_linearRailBoltSize, MGN_9_linearRailBoltSize, MGN_12_linearRailBoltSize, MGN_15_linearRailBoltSize, MGW_7_linearRailBoltSize, MGW_9_linearRailBoltSize, MGW_12_linearRailBoltSize, MGW_15_linearRailBoltSize],
["linearRailBoltSeperation", MGN_7_linearRailBoltSeperation, MGN_9_linearRailBoltSeperation, MGN_12_linearRailBoltSeperation, MGN_15_linearRailBoltSeperation, MGW_7_linearRailBoltSeperation, MGW_9_linearRailBoltSeperation, MGW_12_linearRailBoltSeperation, MGW_15_linearRailBoltSeperation],
["linearRailBoltHeadInset", MGN_7_linearRailBoltHeadInset, MGN_9_linearRailBoltHeadInset, MGN_12_linearRailBoltHeadInset, MGN_15_linearRailBoltHeadInset, MGW_7_linearRailBoltHeadInset, MGW_9_linearRailBoltHeadInset, MGW_12_linearRailBoltHeadInset, MGW_15_linearRailBoltHeadInset],
["linearRailBoltHeadD", MGN_7_linearRailBoltHeadD, MGN_9_linearRailBoltHeadD, MGN_12_linearRailBoltHeadD, MGN_15_linearRailBoltHeadD, MGW_7_linearRailBoltHeadD, MGW_9_linearRailBoltHeadD, MGW_12_linearRailBoltHeadD, MGW_15_linearRailBoltHeadD],
["linearRailBlockWidth", MGN_7_linearRailBlockWidth, MGN_9_linearRailBlockWidth, MGN_12_linearRailBlockWidth, MGN_15_linearRailBlockWidth, MGW_7_linearRailBlockWidth, MGW_9_linearRailBlockWidth, MGW_12_linearRailBlockWidth, MGW_15_linearRailBlockWidth],
["linearRailBlockBoltSize", MGN_7_linearRailBlockBoltSize, MGN_9_linearRailBlockBoltSize, MGN_12_linearRailBlockBoltSize, MGN_15_linearRailBlockBoltSize, MGW_7_linearRailBlockBoltSize, MGW_9_linearRailBlockBoltSize, MGW_12_linearRailBlockBoltSize, MGW_15_linearRailBlockBoltSize],
["linearRailBlockBoltSeperation (linearRailBlockHWidthBoltSeperation)", MGN_7_linearRailBlockBoltSeperation, MGN_9_linearRailBlockBoltSeperation, MGN_12_linearRailBlockBoltSeperation, MGN_15_linearRailBlockBoltSeperation, MGW_7_linearRailBlockBoltSeperation, MGW_9_linearRailBlockHWidthBoltSeperation, MGW_12_linearRailBlockBoltSeperation, MGW_15_linearRailBlockBoltSeperation],
["linearRailBlockHeight", MGN_7_linearRailBlockHeight, MGN_9_linearRailBlockHeight, MGN_12_linearRailBlockHeight, MGN_15_linearRailBlockHeight, MGW_7_linearRailBlockHeight, MGW_9_linearRailBlockHeight, MGW_12_linearRailBlockHeight, MGW_15_linearRailBlockHeight],
["linearRailBlockHLength", MGN_7_linearRailBlockHLength, MGN_9_linearRailBlockHLength, MGN_12_linearRailBlockHLength, MGN_15_linearRailBlockHLength, MGW_7_linearRailBlockHLength, MGW_9_linearRailBlockHLength, MGW_12_linearRailBlockHLength, MGW_15_linearRailBlockHLength],
["linearRailBlockCLength", MGN_7_linearRailBlockCLength, MGN_9_linearRailBlockCLength, MGN_12_linearRailBlockCLength, MGN_15_linearRailBlockCLength, MGW_7_linearRailBlockCLength, MGW_9_linearRailBlockCLength, MGW_12_linearRailBlockCLength, MGW_15_linearRailBlockCLength],
["linearRailBlockCLengthBoltSeperation", MGN_7_linearRailBlockCLengthBoltSeperation, MGN_9_linearRailBlockCLengthBoltSeperation, MGN_12_linearRailBlockCLengthBoltSeperation, MGN_15_linearRailBlockCLengthBoltSeperation, MGW_7_linearRailBlockCLengthBoltSeperation, MGW_9_linearRailBlockCLengthBoltSeperation, MGW_12_linearRailBlockCLengthBoltSeperation, MGW_15_linearRailBlockCLengthBoltSeperation],
["linearRailBlockHLengthBoltSeperation", MGN_7_linearRailBlockHLengthBoltSeperation, MGN_9_linearRailBlockHLengthBoltSeperation, MGN_12_linearRailBlockHLengthBoltSeperation, MGN_15_linearRailBlockHLengthBoltSeperation, MGW_7_linearRailBlockHLengthBoltSeperation, MGW_9_linearRailBlockHLengthBoltSeperation, MGW_12_linearRailBlockHLengthBoltSeperation, MGW_15_linearRailBlockHLengthBoltSeperation],
["linearRailEndLength", MGN_7_linearRailEndLength, MGN_9_linearRailEndLength, MGN_12_linearRailEndLength, MGN_15_linearRailEndLength, MGW_7_linearRailEndLength, MGW_9_linearRailEndLength, MGW_12_linearRailEndLength, MGW_15_linearRailEndLength],
["linearRailBoltSeperationAcross", MGN_7_linearRailBoltSeperationAcross, MGN_9_linearRailBoltSeperationAcross, MGN_12_linearRailBoltSeperationAcross, MGN_15_linearRailBoltSeperationAcross, MGW_7_linearRailBoltSeperationAcross, MGW_9_linearRailBoltSeperationAcross, MGW_12_linearRailBoltSeperationAcross, MGW_15_linearRailBoltSeperationAcross],
["linearRailBlockCWidthBoltSeperation", MGN_7_linearRailBlockBoltSeperation, MGN_9_linearRailBlockBoltSeperation, MGN_12_linearRailBlockBoltSeperation, MGN_15_linearRailBlockBoltSeperation, MGW_7_linearRailBlockBoltSeperation, MGW_9_linearRailBlockCWidthBoltSeperation, MGW_12_linearRailBlockBoltSeperation, MGW_15_linearRailBlockBoltSeperation]];

//("([^"]*)"|_([^,"\d]+)), (MG[NW]_\d\d?_)(, |\])
//\1, \4\2\3\5

linearRailHForm = 1;
linearRailCForm = 2;

function railDimensions(a, b) = railDimensionArray[b][a] == undef ? RailSystem_value_does_not_exist___Try_another_size_of_rail() : railDimensionArray[b][a]/Units==undef?railDimensionArray[b][a]:railDimensionArray[b][a]/Units;

function RailSystem_value_does_not_exist___Try_another_size_of_rail() = SG_proceedOnError?undef:RailSystem_value_does_not_exist___Try_another_size_of_rail();


function getActualRailLength(railType, length) = floor((length-railDimensions(railType, linearRailEndLength)*2)/railDimensions(railType, linearRailBoltSeperation)+0.99)*railDimensions(railType, linearRailBoltSeperation)+railDimensions(railType, linearRailEndLength)*2;

function getMaximumBoltNumber(railType, length) = (getActualRailLength(railType, length)-railDimensions(railType, linearRailEndLength)*2)/railDimensions(railType, linearRailBoltSeperation);

function getRailBoltPositions(railType, length, numberOfBoltsFromEnd = 1, prevOffset = [0, 0]) = numberOfBoltsFromEnd>getMaximumBoltNumber(railType, length)/2+1? getRailBoltPositions(railType, length, getMaximumBoltNumber(railType, length)/2+1, [0, 0]):numberOfBoltsFromEnd<=0?[]:railDimensions(railType, linearRailBoltSeperationAcross)==-1?
concat([[railDimensions(railType, linearRailEndLength), 0]+prevOffset, [getActualRailLength(railType, length)-railDimensions(railType, linearRailEndLength), 0]+prevOffset], 
getRailBoltPositions(railType, length-railDimensions(railType, linearRailBoltSeperation)*2, numberOfBoltsFromEnd - 1, prevOffset = [railDimensions(railType, linearRailBoltSeperation), 0])):
concat([[railDimensions(railType, linearRailEndLength), railDimensions(railType, linearRailBoltSeperationAcross)/2]+prevOffset, 
[railDimensions(railType, linearRailEndLength), -railDimensions(railType, linearRailBoltSeperationAcross)/2]+prevOffset, 
[getActualRailLength(railType, length)-railDimensions(railType, linearRailEndLength), railDimensions(railType, linearRailBoltSeperationAcross)/2]+prevOffset, 
[getActualRailLength(railType, length)-railDimensions(railType, linearRailEndLength), -railDimensions(railType, linearRailBoltSeperationAcross)/2]+prevOffset], 
getRailBoltPositions(railType, length-railDimensions(railType, linearRailBoltSeperation)*2, numberOfBoltsFromEnd - 1, prevOffset = [railDimensions(railType, linearRailBoltSeperation), 0]));

function getRailBlockBoltPositions(railType, form = linearRailHForm) = form==linearRailHForm?[
[railDimensions(railType, linearRailBlockHLength)/2-railDimensions(railType, linearRailBlockHLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2-railDimensions(railType, linearRailBlockHWidthBoltSeperation)/2],
[railDimensions(railType, linearRailBlockHLength)/2+railDimensions(railType, linearRailBlockHLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2-railDimensions(railType, linearRailBlockHWidthBoltSeperation)/2],
[railDimensions(railType, linearRailBlockHLength)/2+railDimensions(railType, linearRailBlockHLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2+railDimensions(railType, linearRailBlockHWidthBoltSeperation)/2],
[railDimensions(railType, linearRailBlockHLength)/2-railDimensions(railType, linearRailBlockHLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2+railDimensions(railType, linearRailBlockHWidthBoltSeperation)/2]]:
[[railDimensions(railType, linearRailBlockCLength)/2-railDimensions(railType, linearRailBlockCLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2-railDimensions(railType, linearRailBlockCWidthBoltSeperation)/2],
[railDimensions(railType, linearRailBlockCLength)/2+railDimensions(railType, linearRailBlockCLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2-railDimensions(railType, linearRailBlockCWidthBoltSeperation)/2],
[railDimensions(railType, linearRailBlockCLength)/2+railDimensions(railType, linearRailBlockCLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2+railDimensions(railType, linearRailBlockCWidthBoltSeperation)/2],
[railDimensions(railType, linearRailBlockCLength)/2-railDimensions(railType, linearRailBlockCLengthBoltSeperation)/2, railDimensions(railType, linearRailBlockWidth)/2+railDimensions(railType, linearRailBlockCWidthBoltSeperation)/2]];


module railBoltPositionsTranslate(railType, length, numberOfBoltsFromEnd = 1){
   l = getActualRailLength(railType, length);
   bn = min(numberOfBoltsFromEnd, getMaximumBoltNumber(railType, length)/2+1);
   if(railDimensions(railType, linearRailBoltSeperationAcross)==-1){
      for(i = [0 : bn-1]){
         translate([railDimensions(railType, linearRailEndLength)+i*railDimensions(railType, linearRailBoltSeperation), 0])children();
         translate([l-railDimensions(railType, linearRailEndLength)-i*railDimensions(railType, linearRailBoltSeperation), 0])children();
      }
   }else{
      for(i = [0 : bn-1]){
         translate([railDimensions(railType, linearRailEndLength)+i*railDimensions(railType, linearRailBoltSeperation), railDimensions(railType, linearRailBoltSeperationAcross)/2])children();
         translate([l-railDimensions(railType, linearRailEndLength)-i*railDimensions(railType, linearRailBoltSeperation), railDimensions(railType, linearRailBoltSeperationAcross)/2])children();
      }
      mirror([0, 1])for(i = [0 : bn-1]){
         translate([railDimensions(railType, linearRailEndLength)+i*railDimensions(railType, linearRailBoltSeperation), railDimensions(railType, linearRailBoltSeperationAcross)/2])children();
         translate([l-railDimensions(railType, linearRailEndLength)-i*railDimensions(railType, linearRailBoltSeperation), railDimensions(railType, linearRailBoltSeperationAcross)/2])children();
      }
   }
}

module railBlockBoltPositionsTranslate(railType, form = linearRailHForm){
   for(i = getRailBlockBoltPositions(railType, form)){
      translate(i)children();
   }
}
module railBlockBoltPositionsTranslateMirroring(railType, form = linearRailHForm){
   lsep = railDimensions(railType, form == linearRailHForm ? linearRailBlockHLengthBoltSeperation:linearRailBlockCLengthBoltSeperation);
   wsep = railDimensions(railType, form == linearRailHForm ? linearRailBlockHWidthBoltSeperation:linearRailBlockCWidthBoltSeperation);
   l = railDimensions(railType, form == linearRailHForm ? linearRailBlockHLength:linearRailBlockCLength);
   w = railDimensions(railType, linearRailBlockWidth);
   translate([l/2, w/2]){
      translate([lsep/2, wsep/2])children();
      mirror([1, 0])translate([lsep/2, wsep/2])children();
      mirror([0, 1])translate([lsep/2, wsep/2])children();
      mirror([0, 1])mirror([1, 0])translate([lsep/2, wsep/2])children();
   }
}
module rail(railType, length, cutBlockHole = true, ERR = 0, position = -1, form = linearRailHForm, slowMode = false){
   translate([0, -railDimensions(railType, linearRailWidth)/2-ERR, -ERR])cube([getActualRailLength(railType, length), railDimensions(railType, linearRailWidth)+ERR*2, railDimensions(railType, linearRailHeight)+ERR]);
   if(cutBlockHole){
   translate([0, -railDimensions(railType, linearRailBlockWidth)/2-ERR, railDimensions(railType, linearRailAssemblyTotalHeight)-railDimensions(railType, linearRailBlockHeight)-ERR])cube([getActualRailLength(railType, length), railDimensions(railType, linearRailBlockWidth)+ERR*2, railDimensions(railType, linearRailBlockHeight)+ERR*2]);
   }
   %if(GHOST){
      if(position!=-1){
         intersection(){
            translate([position, -railDimensions(railType, linearRailBlockWidth)/2, railDimensions(railType, linearRailAssemblyTotalHeight)])ghostRailBlock(railType, form, slowMode);
            cube(0, 0, 0);
         }
      }
      difference(){
         hull()difference(){
            translate([0, -railDimensions(railType, linearRailWidth)/2, 0])cube([getActualRailLength(railType, length), railDimensions(railType, linearRailWidth), railDimensions(railType, linearRailHeight)]);
         translate([-0.001, -railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)])rotate([0, 90, 0])cylinder(d = railDimensions(railType, linearRailHeight)/8, h = getActualRailLength(railType, length)+0.002);
         translate([-0.001, railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)])rotate([0, 90, 0])cylinder(d = railDimensions(railType, linearRailHeight)/8, h = getActualRailLength(railType, length)+0.002);
         }
         translate([-0.001, -railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)*2/3])rotate([0, 90, 0])cylinder(d = railDimensions(railType, linearRailHeight)/4, h = getActualRailLength(railType, length)+0.002);
         translate([-0.001, railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)*2/3])rotate([0, 90, 0])cylinder(d = railDimensions(railType, linearRailHeight)/4, h = getActualRailLength(railType, length)+0.002);
         translate([-0.001, railDimensions(railType, linearRailWidth)/2-railDimensions(railType, linearRailHeight)/4, railDimensions(railType, linearRailHeight)*29/48])cube([getActualRailLength(railType, length)+0.002, railDimensions(railType, linearRailHeight)/4, railDimensions(railType, linearRailHeight)/8]);
         translate([-0.001, -railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)*29/48])cube([getActualRailLength(railType, length)+0.002, railDimensions(railType, linearRailHeight)/4, railDimensions(railType, linearRailHeight)/8]);
         railBoltPositionsTranslate(railType, length, getMaximumBoltNumber(railType, length)/2+1){
            translate([0, 0, -0.001])cylinder(d = getRodD(railDimensions(railType, linearRailBoltSize)), h = railDimensions(railType, linearRailHeight)+0.002);
            translate([0, 0, railDimensions(railType, linearRailHeight)-railDimensions(railType, linearRailBoltHeadInset)])cylinder(d = railDimensions(railType, linearRailBoltHeadD), h = railDimensions(railType, linearRailBoltHeadInset)+0.001);
         }
      }
   }
}
module railBlock(railType, form, ERR = 0, slowMode = false){
   l = railDimensions(railType, form == linearRailHForm ? linearRailBlockHLength:linearRailBlockCLength);
   w = railDimensions(railType, linearRailBlockWidth);
   translate([-ERR, -ERR, -railDimensions(railType, linearRailBlockHeight)])cube([l+ERR*2+0.002, w+ERR*2, railDimensions(railType, linearRailBlockHeight)]);
   %if(GHOST){
      lsep = railDimensions(railType, form == linearRailHForm ? linearRailBlockHLengthBoltSeperation:linearRailBlockCLengthBoltSeperation);
      wsep = railDimensions(railType, form == linearRailHForm ? linearRailBlockHWidthBoltSeperation:linearRailBlockCWidthBoltSeperation);
      if(slowMode)intersection(){
         union()for(i = [0:l*4*0.8/railDimensions(railType, linearRailHeight)]){
            translate([i*railDimensions(railType, linearRailHeight)/4+l/10, w/2-railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)*2/3-railDimensions(railType, linearRailAssemblyTotalHeight)])sphere(d = railDimensions(railType, linearRailHeight)/4, $fn = 20);
            translate([i*railDimensions(railType, linearRailHeight)/4+l/10, w/2+railDimensions(railType, linearRailWidth)/2, railDimensions(railType, linearRailHeight)*2/3-railDimensions(railType, linearRailAssemblyTotalHeight)])sphere(d = railDimensions(railType, linearRailHeight)/4, $fn = 20);
         }
         translate([-0.001, w/2-railDimensions(railType, linearRailWidth)/2, -railDimensions(railType, linearRailAssemblyTotalHeight)-0.001])cube([l+0.002, railDimensions(railType, linearRailWidth), railDimensions(railType, linearRailHeight)]);
      }
      difference(){
         translate([0, 0, -railDimensions(railType, linearRailBlockHeight)])cube([l, w, railDimensions(railType, linearRailBlockHeight)]);
         translate([-0.001, w/2-railDimensions(railType, linearRailWidth)/2, -railDimensions(railType, linearRailAssemblyTotalHeight)-0.001])cube([l+0.002, railDimensions(railType, linearRailWidth), railDimensions(railType, linearRailHeight)]);
         translate([-0.001, w/2-railDimensions(railType, linearRailWidth)*0.45, -0.2])cube([l+0.002, railDimensions(railType, linearRailWidth)*0.9, railDimensions(railType, linearRailHeight)]);
         translate([0, 0, -getRodD(railDimensions(railType, linearRailBlockBoltSize))])railBlockBoltPositionsTranslate(railType, form)cylinder(d = getRodD(railDimensions(railType, linearRailBlockBoltSize)), h = getRodD(railDimensions(railType, linearRailBlockBoltSize))+0.001);
      }
   }
}
module railBlockFullHeight(railType, form, ERR = 0, slowMode = false){
   l = railDimensions(railType, form == linearRailHForm ? linearRailBlockHLength:linearRailBlockCLength);
   w = railDimensions(railType, linearRailBlockWidth);
   translate([-ERR, -ERR, -railDimensions(railType, linearRailAssemblyTotalHeight)])cube([l+ERR*2+0.002, w+ERR*2, railDimensions(railType, linearRailAssemblyTotalHeight)]);
   intersection(){
      railBlock(railType, form, ERR, slowMode);
      cube(0);
   }
}