//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core.scad>;

mm = 1;
inches = 25.4;
Units = mm;

function isValueInScrewsDatabase(a, b) = isValueInScrewsMetric(a, b);

function getRodD(a) = M_getRodD(a);

echo("ScrewsMetric is active, this will provide a set of values for you programmes to use, for creating holes for metric parts, such as bolts, if you want UNC bolts, then use ScrewsUNC instead, for both, use ScrewsUniversal, but do not use the individual ones. By default the system will work in mm, to change this use Units = inches;\n");
echo("The wing nuts in this system are of the american kind, with square ends to the wings, if you are not using these, please be careful, as yours may not fit.\n");

echo("ScrewsMetric available values: 'ScrewsMetric_name', 'boltD', 'nutFlatD', 'nutPeakD', 'fullNutH', 'domeNutHexH', 'domeNutTotalH', 'allenBoltHeadD', 'allenBoltHeadH', 'nylocNutH''', 'studdingConnectorNutL', 'squareNutFlatD', 'squareNutPeakD', 'thinSquareNutH', 'hexHeadBoltHeadH', 'hexFlangeHeadH', 'hexHeadFlatD', 'hexHeadPeakD', 'hexFlangeT', 'hexFlangeD', 'allenBoltKeySize', 'allenButtonBoltKeySize', 'allenCountersunkBoltKeySize', 'allenButtonBoltHeadD', 'allenButtonBoltHeadH', 'allenCountersunkBoltHeadD', 'allenCountersunkBoltHeadH' 'squareNutH' 'wingNutBaseH' 'wingNutBaseD' 'wingNutWingT' 'wingNutWingExtension' 'wingNutWingH' \n");


