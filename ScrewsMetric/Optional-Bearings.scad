//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-sizeDeclaration.scad>;
SG_proceedOnError = false;
bearingBore = 1;
bearingOuterDiam = 2;
bearingThickness = 3;



600_seriesBearings = 1;
620_seriesBearings = 21;
630_seriesBearings = 41;
670_seriesBearings = 41;

KLNJ_seriesBearings = 81;
LJ_seriesBearings = 101;

firstFitSeries = -1;

BEARING_SYSTEM_BEARING_SET_SEPARATION = 20;


6032_bearing = 1;
604_bearing = 2;
605_bearing = 3;
606_bearing = 4;
607_bearing = 5;
608_bearing = 6;
609_bearing = 7;
6000_bearing = 8;
6001_bearing = 9;
6002_bearing = 10;
6003_bearing = 11;
6004_bearing = 12;
6005_bearing = 13;
6006_bearing = 14;

623_bearing = 21;
624_bearing = 22;
625_bearing = 23;
626_bearing = 24;
627_bearing = 25;
628_bearing = 26;
629_bearing = 27;
6200_bearing = 28;
6201_bearing = 29;
6202_bearing = 30;
6203_bearing = 31;
6204_bearing = 32;
6205_bearing = 33;
6206_bearing = 34;

633_bearing = 41;
634_bearing = 42;
635_bearing = 43;
636_bearing = 44;
637_bearing = 45;
638_bearing = 46;
639_bearing = 47;
6300_bearing = 48;
6301_bearing = 49;
6302_bearing = 50;
6303_bearing = 51;
6304_bearing = 52;
6305_bearing = 53;
6306_bearing = 54;

673_bearing = 61;
674_bearing = 62;
675_bearing = 63;
676_bearing = 64;
677_bearing = 65;
678_bearing = 66;
679_bearing = 67;
6700_bearing = 68;
6701_bearing = 69;
6702_bearing = 70;
6703_bearing = 71;
6704_bearing = 72;
6705_bearing = 73;
6706_bearing = 74;

KLNJ_1_8_bearing = 81;
KLNJ_3_16_bearing = 82;
KLNJ_1_4_bearing = 83;
KLNJ_3_8_bearing = 84;
KLNJ_1_2_bearing = 85;
KLNJ_5_8_bearing = 86;
KLNJ_3_4_bearing = 87;
KLNJ_7_8_bearing = 88;
KLNJ_1_bearing = 89;

LJ_1_2_bearing = 101;
LJ_5_8_bearing = 102;
LJ_3_4_bearing = 103;
LJ_7_8_bearing = 104;
LJ_1_bearing = 105;



echo(str(SCREWS_SYSTEM_MODE, " Bearings loaded, this is an optional additional section. Valid bearings: '6032_bearing' '604_bearing' '605_bearing' '606_bearing' '608_bearing' '6000_bearing' '6001_bearing' '6002_bearing' '6003_bearing' '6004_bearing' '6005_bearing' '623_bearing' '624_bearing' '625_bearing' '626_bearing' '628_bearing' '6200_bearing' '6201_bearing' '6202_bearing' '6203_bearing' '6204_bearing' '6205_bearing'"));
echo(str(SCREWS_SYSTEM_MODE, " Bearings: supported bearings series: '600_seriesBearings' '620_seriesBearings' '630_seriesBearings'"));
echo(str(SCREWS_SYSTEM_MODE, " Bearings: to get a bearing of a particular type use BearingType()  to get one of a general form for the particular size of rod, use BearingFromSize() and give it a bolt size, or to get a bearing given a internal diameter, use BearingFromDiam() and give it the diameter.\n"));

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

607_bearingBore = 7;
607_bearingOuterDiam = 19;
607_bearingThickness = 6;

608_bearingBore = 8;
608_bearingOuterDiam = 22;
608_bearingThickness = 7;

609_bearingBore = 9;
609_bearingOuterDiam = 24;
609_bearingThickness = 7;

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

6006_bearingBore = 30;
6006_bearingOuterDiam = 55;
6006_bearingThickness = 13;



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

627_bearingBore = 7;
627_bearingOuterDiam = 22;
627_bearingThickness = 7;

628_bearingBore = 8;
628_bearingOuterDiam = 24;
628_bearingThickness = 8;

629_bearingBore = 9;
629_bearingOuterDiam = 26;
629_bearingThickness = 9;

6200_bearingBore = 10;
6200_bearingOuterDiam = 30;
6200_bearingThickness = 9;

6201_bearingBore = 12;
6201_bearingOuterDiam = 32;
6201_bearingThickness = 10;

6202_bearingBore = 15;
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

6206_bearingBore = 30;
6206_bearingOuterDiam = 62;
6206_bearingThickness = 16;



633_bearingBore = 3;
633_bearingOuterDiam = 13;
633_bearingThickness = 5;

634_bearingBore = 4;
634_bearingOuterDiam = 16;
634_bearingThickness = 5;

635_bearingBore = 5;
635_bearingOuterDiam = 19;
635_bearingThickness = 6;

636_bearingBore = 6;
636_bearingOuterDiam = 22;
636_bearingThickness = 7;

637_bearingBore = 7;
637_bearingOuterDiam = 26;
637_bearingThickness = 9;

638_bearingBore = 8;
638_bearingOuterDiam = 28;
638_bearingThickness = 9;

639_bearingBore = 9;
639_bearingOuterDiam = 30;
639_bearingThickness = 10;

6300_bearingBore = 10;
6300_bearingOuterDiam = 35;
6300_bearingThickness = 11;

6301_bearingBore = 12;
6301_bearingOuterDiam = 37;
6301_bearingThickness = 12;

6302_bearingBore = 15;
6302_bearingOuterDiam = 42;
6302_bearingThickness = 13;

6303_bearingBore = 17;
6303_bearingOuterDiam = 47;
6303_bearingThickness = 14;

6304_bearingBore = 20;
6304_bearingOuterDiam = 52;
6304_bearingThickness = 15;

6305_bearingBore = 25;
6305_bearingOuterDiam = 62;
6305_bearingThickness = 17;

6306_bearingBore = 30;
6306_bearingOuterDiam = 72;
6306_bearingThickness = 19;



673_bearingBore = 3;
673_bearingOuterDiam = 6;
673_bearingThickness = 2;

674_bearingBore = 4;
674_bearingOuterDiam = 7;
674_bearingThickness = 2;

675_bearingBore = 5;
675_bearingOuterDiam = 8;
675_bearingThickness = 2;

676_bearingBore = 6;
676_bearingOuterDiam = 10;
676_bearingThickness = 3;

677_bearingBore = 7;
677_bearingOuterDiam = 11;
677_bearingThickness = 3;

678_bearingBore = 8;
678_bearingOuterDiam = 12;
678_bearingThickness = 4;

679_bearingBore = 9;
679_bearingOuterDiam = 14;
679_bearingThickness = 4.5;

6700_bearingBore = 10;
6700_bearingOuterDiam = 15;
6700_bearingThickness = 4;

6701_bearingBore = 12;
6701_bearingOuterDiam = 18;
6701_bearingThickness = 4;

6702_bearingBore = 15;
6702_bearingOuterDiam = 21;
6702_bearingThickness = 4;

6703_bearingBore = 17;
6703_bearingOuterDiam = 23;
6703_bearingThickness = 4;

6704_bearingBore = 20;
6704_bearingOuterDiam = 27;
6704_bearingThickness = 4;

6705_bearingBore = 25;
6705_bearingOuterDiam = 32;
6705_bearingThickness = 4;

6706_bearingBore = 30;
6706_bearingOuterDiam = 37;
6706_bearingThickness = 4;



KLNJ_1_8_bearingBore = 25.4/8;
KLNJ_1_8_bearingOuterDiam = 25.4*3/8;
KLNJ_1_8_bearingThickness = 25.4*5/32;

KLNJ_3_16_bearingBore = 25.4*3/16;
KLNJ_3_16_bearingOuterDiam = 25.4/2;
KLNJ_3_16_bearingThickness = 25.4*0.196;

KLNJ_1_4_bearingBore = 25.4/4;
KLNJ_1_4_bearingOuterDiam = 25.4*3/4;
KLNJ_1_4_bearingThickness = 25.4*9/32;

KLNJ_3_8_bearingBore = 25.4*3/8;
KLNJ_3_8_bearingOuterDiam = 25.4*7/8;
KLNJ_3_8_bearingThickness = 25.4*9/32;

KLNJ_1_2_bearingBore = 25.4/2;
KLNJ_1_2_bearingOuterDiam = 25.4*9/8;
KLNJ_1_2_bearingThickness = 25.4*5/16;

KLNJ_5_8_bearingBore = 25.4*5/8;
KLNJ_5_8_bearingOuterDiam = 25.4*11/8;
KLNJ_5_8_bearingThickness = 25.4*11/32;

KLNJ_3_4_bearingBore = 25.4*3/4;
KLNJ_3_4_bearingOuterDiam = 25.4*13/8;
KLNJ_3_4_bearingThickness = 25.4*5/16;

KLNJ_7_8_bearingBore = 25.4*7/8;
KLNJ_7_8_bearingOuterDiam = 25.4*15/8;
KLNJ_7_8_bearingThickness = 25.4*3/8;

KLNJ_1_bearingBore = 25.4;
KLNJ_1_bearingOuterDiam = 25.4*2;
KLNJ_1_bearingThickness = 25.4/2;



LJ_1_2_bearingBore = 25.4/2;
LJ_1_2_bearingOuterDiam = 25.4*21/16;
LJ_1_2_bearingThickness = 25.4*3/8;

LJ_5_8_bearingBore = 25.4*5/8;
LJ_5_8_bearingOuterDiam = 25.04*25/16;
LJ_5_8_bearingThickness = 25.4*7/16;

LJ_3_4_bearingBore = 25.4*3/4;
LJ_3_4_bearingOuterDiam = 25.4*15/8;
LJ_3_4_bearingThickness = 25.4*9/16;

LJ_7_8_bearingBore = 25.4*7/8;
LJ_7_8_bearingOuterDiam = 25.4*2;
LJ_7_8_bearingThickness = 25.4*9/16;

LJ_1_bearingBore = 25.4;
LJ_1_bearingOuterDiam = 25.4*9/4;
LJ_1_bearingThickness = 25.4*5/8;

LJ_9_8_bearingBore = 25.4*9/8;
LJ_9_8_bearingOuterDiam = 25.4*5/2;
LJ_9_8_bearingThickness = 25.4*5/8;

LJ_5_4_bearingBore = 25.4*5/4;
LJ_5_4_bearingOuterDiam = 25.4*11/4;
LJ_5_4_bearingThickness = 25.4*11/16;



//^((?:KLNJ|LJ|MJ)_[\d_]*+)$
//\1_bearingBore = 25.4*\n\1_bearingOuterDiam = 25.4*\n\1_bearingThickness = 25.4*\n

bearingDimensionArray = [
["Name", "bearingBore", "bearingOuterDiam", "bearingThickness"], 
["6032_bearing", 6032_bearingBore, 6032_bearingOuterDiam, 6032_bearingThickness],
["604_bearing", 604_bearingBore, 604_bearingOuterDiam, 604_bearingThickness],
["605_bearing", 605_bearingBore, 605_bearingOuterDiam, 605_bearingThickness],
["606_bearing", 606_bearingBore, 606_bearingOuterDiam, 606_bearingThickness],
["607_bearing", 607_bearingBore, 607_bearingOuterDiam, 607_bearingThickness],
["608_bearing", 608_bearingBore, 608_bearingOuterDiam, 608_bearingThickness],
["609_bearing", 609_bearingBore, 609_bearingOuterDiam, 609_bearingThickness],
["6000_bearing", 6000_bearingBore, 6000_bearingOuterDiam, 6000_bearingThickness],
["6001_bearing", 6001_bearingBore, 6001_bearingOuterDiam, 6001_bearingThickness],
["6002_bearing", 6002_bearingBore, 6002_bearingOuterDiam, 6002_bearingThickness],
["6003_bearing", 6003_bearingBore, 6003_bearingOuterDiam, 6003_bearingThickness],
["6004_bearing", 6004_bearingBore, 6004_bearingOuterDiam, 6004_bearingThickness],
["6005_bearing", 6005_bearingBore, 6005_bearingOuterDiam, 6005_bearingThickness],
["6006_bearing", 6006_bearingBore, 6006_bearingOuterDiam, 6006_bearingThickness],
[],[],[],[],[],[],
["623_bearing", 623_bearingBore, 623_bearingOuterDiam, 623_bearingThickness],
["624_bearing", 624_bearingBore, 624_bearingOuterDiam, 624_bearingThickness],
["625_bearing", 625_bearingBore, 625_bearingOuterDiam, 625_bearingThickness],
["626_bearing", 626_bearingBore, 626_bearingOuterDiam, 626_bearingThickness],
["627_bearing", 627_bearingBore, 627_bearingOuterDiam, 627_bearingThickness],
["628_bearing", 628_bearingBore, 628_bearingOuterDiam, 628_bearingThickness],
["629_bearing", 629_bearingBore, 629_bearingOuterDiam, 629_bearingThickness],
["6200_bearing", 6200_bearingBore, 6200_bearingOuterDiam, 6200_bearingThickness],
["6201_bearing", 6201_bearingBore, 6201_bearingOuterDiam, 6201_bearingThickness],
["6202_bearing", 6202_bearingBore, 6202_bearingOuterDiam, 6202_bearingThickness],
["6203_bearing", 6203_bearingBore, 6203_bearingOuterDiam, 6203_bearingThickness],
["6204_bearing", 6204_bearingBore, 6204_bearingOuterDiam, 6204_bearingThickness],
["6205_bearing", 6205_bearingBore, 6205_bearingOuterDiam, 6205_bearingThickness],
["6206_bearing", 6206_bearingBore, 6206_bearingOuterDiam, 6206_bearingThickness],
[],[],[],[],[],[],
["633_bearing", 633_bearingBore, 633_bearingOuterDiam, 633_bearingThickness],
["634_bearing", 634_bearingBore, 634_bearingOuterDiam, 634_bearingThickness],
["635_bearing", 635_bearingBore, 635_bearingOuterDiam, 635_bearingThickness],
["636_bearing", 636_bearingBore, 636_bearingOuterDiam, 636_bearingThickness],
["637_bearing", 637_bearingBore, 637_bearingOuterDiam, 637_bearingThickness],
["638_bearing", 638_bearingBore, 638_bearingOuterDiam, 638_bearingThickness],
["639_bearing", 639_bearingBore, 639_bearingOuterDiam, 639_bearingThickness],
["6300_bearing", 6300_bearingBore, 6300_bearingOuterDiam, 6300_bearingThickness],
["6301_bearing", 6301_bearingBore, 6301_bearingOuterDiam, 6301_bearingThickness],
["6302_bearing", 6302_bearingBore, 6302_bearingOuterDiam, 6302_bearingThickness],
["6303_bearing", 6303_bearingBore, 6303_bearingOuterDiam, 6303_bearingThickness],
["6304_bearing", 6304_bearingBore, 6304_bearingOuterDiam, 6304_bearingThickness],
["6305_bearing", 6305_bearingBore, 6305_bearingOuterDiam, 6305_bearingThickness],
["6306_bearing", 6306_bearingBore, 6306_bearingOuterDiam, 6306_bearingThickness],
[],[],[],[],[],[],
["673_bearing", 673_bearingBore, 673_bearingOuterDiam, 673_bearingThickness],
["674_bearing", 674_bearingBore, 674_bearingOuterDiam, 674_bearingThickness],
["675_bearing", 675_bearingBore, 675_bearingOuterDiam, 675_bearingThickness],
["676_bearing", 676_bearingBore, 676_bearingOuterDiam, 676_bearingThickness],
["677_bearing", 677_bearingBore, 677_bearingOuterDiam, 677_bearingThickness],
["678_bearing", 678_bearingBore, 678_bearingOuterDiam, 678_bearingThickness],
["679_bearing", 679_bearingBore, 679_bearingOuterDiam, 679_bearingThickness],
["6700_bearing", 6700_bearingBore, 6700_bearingOuterDiam, 6700_bearingThickness],
["6701_bearing", 6701_bearingBore, 6701_bearingOuterDiam, 6701_bearingThickness],
["6702_bearing", 6702_bearingBore, 6702_bearingOuterDiam, 6702_bearingThickness],
["6703_bearing", 6703_bearingBore, 6703_bearingOuterDiam, 6703_bearingThickness],
["6704_bearing", 6704_bearingBore, 6704_bearingOuterDiam, 6704_bearingThickness],
["6705_bearing", 6705_bearingBore, 6705_bearingOuterDiam, 6705_bearingThickness],
["6706_bearing", 6706_bearingBore, 6706_bearingOuterDiam, 6706_bearingThickness],
[],[],[],[],[],[],
["KLNJ_1_8_bearing", KLNJ_1_8_bearingBore, KLNJ_1_8_bearingOuterDiam, KLNJ_1_8_bearingThickness],
["KLNJ_3_16_bearing", KLNJ_3_16_bearingBore, KLNJ_3_16_bearingOuterDiam, KLNJ_3_16_bearingThickness],
["KLNJ_1_4_bearing", KLNJ_1_4_bearingBore, KLNJ_1_4_bearingOuterDiam, KLNJ_1_4_bearingThickness],
["KLNJ_3_8_bearing", KLNJ_3_8_bearingBore, KLNJ_3_8_bearingOuterDiam, KLNJ_3_8_bearingThickness],
["KLNJ_1_2_bearing", KLNJ_1_2_bearingBore, KLNJ_1_2_bearingOuterDiam, KLNJ_1_2_bearingThickness],
["KLNJ_5_8_bearing", KLNJ_5_8_bearingBore, KLNJ_5_8_bearingOuterDiam, KLNJ_5_8_bearingThickness],
["KLNJ_3_4_bearing", KLNJ_3_4_bearingBore, KLNJ_3_4_bearingOuterDiam, KLNJ_3_4_bearingThickness],
["KLNJ_7_8_bearing", KLNJ_7_8_bearingBore, KLNJ_7_8_bearingOuterDiam, KLNJ_7_8_bearingThickness],
["KLNJ_1_bearing", KLNJ_1_bearingBore, KLNJ_1_bearingOuterDiam, KLNJ_1_bearingThickness],
[],[],[],[],[],[],[],[],[],[],[],
["LJ_1_2_bearing", LJ_1_2_bearingBore, LJ_1_2_bearingOuterDiam, LJ_1_2_bearingThickness],
["LJ_5_8_bearing", LJ_5_8_bearingBore, LJ_5_8_bearingOuterDiam, LJ_5_8_bearingThickness],
["LJ_3_4_bearing", LJ_3_4_bearingBore, LJ_3_4_bearingOuterDiam, LJ_3_4_bearingThickness],
["LJ_7_8_bearing", LJ_7_8_bearingBore, LJ_7_8_bearingOuterDiam, LJ_7_8_bearingThickness],
["LJ_1_bearing", LJ_1_bearingBore, LJ_1_bearingOuterDiam, LJ_1_bearingThickness]];

//^\[\"([^"]+)\"]
//["\1", \1Bore, \1OuterDiam, \1Thickness]

function BearingDimention(Type, Dimension) = bearingDimensionArray[Type][Dimension]==undef?ScrewsBearingSystem_bearing_type_or_dimension_does_not_exist___Try_another_type():bearingDimensionArray[Type][Dimension]/Units==undef?bearingDimensionArray[Type][Dimension]:bearingDimensionArray[Type][Dimension]/Units;

function ScrewsBearingSystem_bearing_type_or_dimension_does_not_exist___Try_another_type() = SG_proceedOnError?undef:ScrewsBearingSystem_bearing_type_or_dimension_does_not_exist___Try_another_type();


module BearingType(type, ERR=0,hollow = false){
   if(!hollow){
      translate([0, 0, -ERR])cylinder(d = BearingDimention(type, bearingOuterDiam)+ERR*2, h = BearingDimention(type, bearingThickness)+ERR*2);
   } else {
      difference(){
         translate([0, 0, -ERR])cylinder(d = BearingDimention(type, bearingOuterDiam)+ERR*2, h = BearingDimention(type, bearingThickness)+ERR*2);
         translate([0, 0, -0.001])cylinder(d = BearingDimention(type, bearingBore)+ERR*2, h = BearingDimention(type, bearingThickness)+0.002);
         translate([0, 0, -0.001])cylinder(d = BearingDimention(type, bearingOuterDiam)*0.87+BearingDimention(type, bearingBore)*0.1+ERR*2, h = BearingDimention(type, bearingThickness)*0.1+0.002);
         translate([0, 0, BearingDimention(type, bearingThickness)*0.9-0.001])cylinder(d = BearingDimention(type, bearingOuterDiam)*0.87+BearingDimention(type, bearingBore)*0.1+ERR*2, h = BearingDimention(type, bearingThickness)*0.1+0.002);
      }
      difference(){
         cylinder(d = BearingDimention(type, bearingBore)*0.95+BearingDimention(type, bearingOuterDiam)*0.1, h = BearingDimention(type, bearingThickness));
         translate([0, 0, -0.001])cylinder(d = BearingDimention(type, bearingBore)+ERR*2, h = BearingDimention(type, bearingThickness)+0.002);
      }
   }
   if(!hollow&&GHOST){
      %BearingType(type, 0, true);
   }
}
module BearingFromDiam(d, series = firstFitSeries, ERR=0, hollow = false){
   if(series == firstFitSeries){
      ScrewsInternalBearingItterator(d, ERR, hollow, 1, len(bearingDimensionArray));
   }else{
      ScrewsInternalBearingItterator(d, ERR, hollow, series, min(BEARING_SYSTEM_BEARING_SET_SEPARATION+series+1, len(bearingDimensionArray)));
   }
}
module BearingFromSize(size, series = firstFitSeries, ERR=0, hollow = false){
   if(series == firstFitSeries){
      ScrewsInternalBearingItterator(getRodD(size), ERR, hollow, 1, len(bearingDimensionArray));
   }else{
      ScrewsInternalBearingItterator(getRodD(size), ERR, hollow, series, min(BEARING_SYSTEM_BEARING_SET_SEPARATION+series+1, len(bearingDimensionArray)));
   }
}

module ScrewsInternalBearingItterator(d, ERR, hollow, location, end, bestLoc = -1, bestD = 100000000){
   if(location==end){
      if(bestLoc==-1){
         echo("No bearing found for given diameter");
      } else{
         echo(str("Bearing finding operation resulted in a ", BearingDimention(bestLoc, 0)));
         if(BearingDimention(bestLoc, bearingBore)!=d){
            echo(str("WARNING: Found bearing ", BearingDimention(bestLoc, bearingBore)-d, " too big, there may be some wobble."));
         }
         BearingType(bestLoc, ERR, hollow);
      }
   } else if(bearingDimensionArray[location][bearingBore]==d){
      echo(str("Bearing finding operation resulted in a ", BearingDimention(location, 0)));
      BearingType(location, ERR, hollow);
   } else {
      if(bearingDimensionArray[location][bearingBore]>d&&bearingDimensionArray[location][bearingBore]-d<bestD-d){
         ScrewsInternalBearingItterator(d, ERR, hollow, location+1, end, location, bearingDimensionArray[location][bearingBore]);
      }else {
         ScrewsInternalBearingItterator(d, ERR, hollow, location+1, end, bestLoc, bestD);
      }
   }
}