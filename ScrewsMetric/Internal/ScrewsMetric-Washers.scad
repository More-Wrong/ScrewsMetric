//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-core-Washers.scad>;

function WasherDimensions(a, b, c) = M_WasherDimensions(a, b, c);

function isValueInWasherDatabase(a, b, c) = isValueInScrewsMetricWasher(a, b, c);

function getWasherT(a, b) = M_getWasherT(a, b);
function getWasherOuterD(a, b) = M_getWasherOuterD(a, b);

module Washer(form, size, ERR = 0, hollow = false, VertERR = 0){
   M_Washer(form, size, ERR, hollow, VertERR);
}
echo("ScrewsMetric Washer system loaded: Washer forms A-G available, e.g. washerFormA\nTo create a washer use Washer(form, size);\nSpecific washers can also be created, but this is not reccomended, e.g. FormAWasher(size);\nTo access values in the database, use WasherDimensions(size, form, value), which contains washerT and washerOuterD\ngetWasherT(size, form) and getWasherOuterD(size, form) are shortcuts to this function\n");