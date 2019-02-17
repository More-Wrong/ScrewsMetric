//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-sizeDeclaration.scad>;
SG_proceedOnError = false;
bearingBore = 1;
bearingOuterDiam = 2;
bearingThickness = 3;

600_seriesBearings = 1;
620_seriesBearings = 21;
firstFitSeries = -1;

BEARING_SYSTEM_BEARING_SET_SEPARATION = 20;

6032_bearing = 1;
604_bearing = 2;
605_bearing = 3;
606_bearing = 4;
608_bearing = 5;
6000_bearing = 6;
6001_bearing = 7;
6002_bearing = 8;
6003_bearing = 9;
6004_bearing = 10;
6005_bearing = 11;
623_bearing = 21;
624_bearing = 22;
625_bearing = 23;
626_bearing = 24;
628_bearing = 25;
6200_bearing = 26;
6201_bearing = 27;
6202_bearing = 28;
6203_bearing = 29;
6204_bearing = 30;
6205_bearing = 31;

echo(str(SCREWS_SYSTEM_MODE, " Bearings loaded, this is an optional additional section. Valid bearings: '6032_bearing' '604_bearing' '605_bearing' '606_bearing' '608_bearing' '6000_bearing' '6001_bearing' '6002_bearing' '6003_bearing' '6004_bearing' '6005_bearing' '623_bearing' '624_bearing' '625_bearing' '626_bearing' '628_bearing' '6200_bearing' '6201_bearing' '6202_bearing' '6203_bearing' '6204_bearing' '6205_bearing'"));
echo(str(SCREWS_SYSTEM_MODE, " Bearings: supported bearings series: '600_seriesBearings' '620_seriesBearings'"));
echo(str(SCREWS_SYSTEM_MODE, " Bearings: to get a bearing of a particular type use BearingType()  to get one of a general form for the particular size of rod, use BearingFromSize() and give it a metric size, e.g. M2, or to get a bearing given a rod diameter, use BearingFromDiam() and give it the diameter.\n"));

6032_bearingBore = 3;
6032_bearingOuterDiam = 9;
6032_bearingThickness = 5;

604_bearingBore = 4;
604_bearingOuterDiam = 12;
604_bearingThickness = 4;

605_bearingBore = 5;
605_bearingOuterDiam = 14;
605_bearingThickness = 5;

606_bearingBore = 6;
606_bearingOuterDiam = 17;
606_bearingThickness = 6;

608_bearingBore = 8;
608_bearingOuterDiam = 22;
608_bearingThickness = 7;

6000_bearingBore = 10;
6000_bearingOuterDiam = 26;
6000_bearingThickness = 8;

6001_bearingBore = 12;
6001_bearingOuterDiam = 28;
6001_bearingThickness = 8;

6002_bearingBore = 16;
6002_bearingOuterDiam = 32;
6002_bearingThickness = 9;

6003_bearingBore = 17;
6003_bearingOuterDiam = 35;
6003_bearingThickness = 10;

6004_bearingBore = 20;
6004_bearingOuterDiam = 42;
6004_bearingThickness = 12;

6005_bearingBore = 25;
6005_bearingOuterDiam = 47;
6005_bearingThickness = 12;


623_bearingBore = 3;
623_bearingOuterDiam = 10;
623_bearingThickness = 4;

624_bearingBore = 4;
624_bearingOuterDiam = 13;
624_bearingThickness = 5;

625_bearingBore = 5;
625_bearingOuterDiam = 16;
625_bearingThickness = 4;

626_bearingBore = 6;
626_bearingOuterDiam = 19;
626_bearingThickness = 6;

628_bearingBore = 8;
628_bearingOuterDiam = 24;
628_bearingThickness = 8;

6200_bearingBore = 10;
6200_bearingOuterDiam = 30;
6200_bearingThickness = 9;

6201_bearingBore = 12;
6201_bearingOuterDiam = 32;
6201_bearingThickness = 10;

6202_bearingBore = 16;
6202_bearingOuterDiam = 35;
6202_bearingThickness = 11;

6203_bearingBore = 17;
6203_bearingOuterDiam = 40;
6203_bearingThickness = 12;

6204_bearingBore = 20;
6204_bearingOuterDiam = 47;
6204_bearingThickness = 14;

6205_bearingBore = 25;
6205_bearingOuterDiam = 52;
6205_bearingThickness = 14;



bearingDimensionArray = [
["Name", "bearingBore", "bearingOuterDiam", "bearingThickness"], 
["6032_bearing", 6032_bearingBore, 6032_bearingOuterDiam, 6032_bearingThickness],
["604_bearing", 604_bearingBore, 604_bearingOuterDiam, 604_bearingThickness],
["605_bearing", 605_bearingBore, 605_bearingOuterDiam, 605_bearingThickness],
["606_bearing", 606_bearingBore, 606_bearingOuterDiam, 606_bearingThickness],
["608_bearing", 608_bearingBore, 608_bearingOuterDiam, 608_bearingThickness],
["6000_bearing", 6000_bearingBore, 6000_bearingOuterDiam, 6000_bearingThickness],
["6001_bearing", 6001_bearingBore, 6001_bearingOuterDiam, 6001_bearingThickness],
["6002_bearing", 6002_bearingBore, 6002_bearingOuterDiam, 6002_bearingThickness],
["6003_bearing", 6003_bearingBore, 6003_bearingOuterDiam, 6003_bearingThickness],
["6004_bearing", 6004_bearingBore, 6004_bearingOuterDiam, 6004_bearingThickness],
["6005_bearing", 6005_bearingBore, 6005_bearingOuterDiam, 6005_bearingThickness],
[],[],[],[],[],[],[],[],[],
["623_bearing", 623_bearingBore, 623_bearingOuterDiam, 623_bearingThickness],
["624_bearing", 624_bearingBore, 624_bearingOuterDiam, 624_bearingThickness],
["625_bearing", 625_bearingBore, 625_bearingOuterDiam, 625_bearingThickness],
["626_bearing", 626_bearingBore, 626_bearingOuterDiam, 626_bearingThickness],
["628_bearing", 628_bearingBore, 628_bearingOuterDiam, 628_bearingThickness],
["6200_bearing", 6200_bearingBore, 6200_bearingOuterDiam, 6200_bearingThickness],
["6201_bearing", 6201_bearingBore, 6201_bearingOuterDiam, 6201_bearingThickness],
["6202_bearing", 6202_bearingBore, 6202_bearingOuterDiam, 6202_bearingThickness],
["6203_bearing", 6203_bearingBore, 6203_bearingOuterDiam, 6203_bearingThickness],
["6204_bearing", 6204_bearingBore, 6204_bearingOuterDiam, 6204_bearingThickness],
["6205_bearing", 6205_bearingBore, 6205_bearingOuterDiam, 6205_bearingThickness]];

function BearingDimention(Type, Dimension) = bearingDimensionArray[Type][Dimension]==undef?ScrewsMetric_bearing_type_or_dimension_does_not_exist___Try_another_type():bearingDimensionArray[Type][Dimension]/Units;

function ScrewsMetric_bearing_type_or_dimension_does_not_exist___Try_another_type() = SG_proceedOnError?undef:ScrewsMetric_bearing_type_or_dimension_does_not_exist___Try_another_type();


module BearingType(type, ERR=0,hollow = false){
   difference(){
      translate([0, 0, -ERR])cylinder(d = BearingDimention(type, bearingOuterDiam)+ERR*2, h = BearingDimention(type, bearingThickness)+ERR*2);
      if (hollow)translate([0, 0, -0.001])cylinder(d = BearingDimention(type, bearingBore)+ERR*2, h = BearingDimention(type, bearingThickness)+0.002);
   }
   if(!hollow&&GHOST){
      %BearingType(type, 0, true);
   }
}
module BearingFromDiam(d, series = firstFitSeries, ERR=0, hollow = false){
   if(series == firstFitSeries){
      ScrewsMetricInternalBearingItterator(d, ERR, hollow, 1, len(bearingDimensionArray));
   }else{
      ScrewsMetricInternalBearingItterator(d, ERR, hollow, series, min(BEARING_SYSTEM_BEARING_SET_SEPARATION+series+1, len(bearingDimensionArray)));
   }
}
module BearingFromSize(size, series = firstFitSeries, ERR=0, hollow = false){
   if(series == firstFitSeries){
      ScrewsMetricInternalBearingItterator(getRodD(size), ERR, hollow, 1, len(bearingDimensionArray));
   }else{
      ScrewsMetricInternalBearingItterator(getRodD(size), ERR, hollow, series, min(BEARING_SYSTEM_BEARING_SET_SEPARATION+series+1, len(bearingDimensionArray)));
   }
}
module ScrewsMetricInternalBearingItterator(d, ERR, hollow, location, end){
   if(location==end){
      echo("No bearing found for given diameter");
   }else if(bearingDimensionArray[location][bearingBore]>=d){
      echo(str("Bearing finding operation resulted in a ", BearingDimention(location, name)));
      if(BearingDimention(location, bearingBore)!=d){
         echo(str("WARNING: Found bearing ", BearingDimention(location, bearingBore)-d, " too big, there may be some wobble."));
      }
      BearingType(location, ERR, hollow);
   }else{
      ScrewsMetricInternalBearingItterator(d, ERR, hollow, location+1, end);
   }
}
