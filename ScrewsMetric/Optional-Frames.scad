//Copyright 2017 Robert Witts
//This library is licensed under the LGPL 3.0 See http://creativecommons.org/licenses/LGPL/3.0/
include<ScrewsMetric-sizeDeclaration.scad>;

module frames_curveToSlope(x, y, $fn = 100){
   resize([x, y])intersection(){
      translate([10, 10])circle(r = 10, $fn = $fn);
      square([10, 10]);
   }
}
module minimalBridge(minW, h = undef, h1 = undef, h2 = undef, d = undef, r = undef, d1 = undef, d2 = undef, r1 = undef, r2 = undef, sep = undef, l = undef, l1 = undef, l2 = undef, minH = undef, flatL = undef, flatProportion = undef, curveR = undef, curveR1 = undef, curveR2 = undef, half = undef, bias = undef, speed = 0, $fn = 500, hRoundfn = 100){
   module cylinderSection(r, h, ang, cta, dist, $fn){
      function cylinderPoints(currAng, addAng) = currAng>ang+addAng?[]:concat([[r*cos(currAng), r*sin(currAng), 0], [r*cos(currAng), r*sin(currAng), h]], cylinderPoints(currAng+addAng, addAng));
      function cylinderfaces(l) = l-3<0?[]:concat([[l, l-1, l-3, l-2]], cylinderfaces(l-2));
      function cylindertop(l) = l<0?[]:concat([l], cylindertop(l-2));
      function cylinderbottom(l) = l<0?[]:concat(cylinderbottom(l-2), [l]);
      ps = concat([[-cos(cta)*dist, -sin(cta)*dist, 0], [-cos(cta)*dist, -sin(cta)*dist, h]], cylinderPoints(0, ang/$fn));
      fs = concat(cylinderfaces(len(ps)-1), [[1, 0, len(ps)-2, len(ps)-1], cylindertop(len(ps)-1), cylinderbottom(len(ps)-2)]);
      polyhedron(points = ps, faces = fs);
   }
   cd1 = d != undef?d:r!=undef?r*2:r1!=undef&&r2!=undef?r1*2:d1;
   cd2 = d != undef?d:r!=undef?r*2:r1!=undef&&r2!=undef?r2*2:d2;
   dist = sep!=undef?sep: l!=undef? sqrt(l[0]*l[0]+l[1]*l[1]): l1!=undef &&l2!=undef? sqrt(pow(l2[0]-l1[0], 2)+pow(l2[1]-l1[1], 2)):0;
   ch = minH==undef?h1==undef||h2==undef?h:min(h1, h2):minH;
   eh1 = h!=undef?h:speed==2?min(h1, h2, ch):h1;
   eh2 = h!=undef?h:speed==2?min(h1, h2, ch):h2;
   biasInt = half == undef?bias==undef?undef:bias/2+0.5:half==0?0:1;
   if(sep!=undef){
      minimalBridgeInternal(cd1, cd2, eh1, eh2, dist, $fn);
      if(speed == 2){
        cylinder(d = cd1, h = h1);
        translate([sep, 0, 0])cylinder(d = cd2, h = h2);
      }
   }else if(l!=undef){
      rotate([0, 0, atan2(l[1], l[0])])minimalBridgeInternal(cd1, cd2, eh1, eh2, dist, $fn);
      if(speed == 2){
        cylinder(d = cd1, h = h1);
        translate(l)cylinder(d = cd2, h = h2);
      }
   }else if(l1!=undef &&l2!=undef){
      translate(l1)rotate([0, 0, atan2(l2[1]-l1[1], l2[0]-l1[0])])minimalBridgeInternal(cd1, cd2, eh1, eh2, dist, $fn);
      if(speed == 2){
        translate(l1)cylinder(d = cd1, h = h1);
        translate(l2)cylinder(d = cd2, h = h2);
      }
   }
   module minimalBridgeInternal(d1, d2, h1, h2, sep, n){
      h = speed!=2?max(h1, h2):min(h1, h2);
      module intersectAllowanceConvexEdge(height){
         slack = min(d1, d2)-minW;
         minWpb = minW+(1-biasInt*2)*slack;
         a = -pow(d1-d2, 2)/sep/sep/4;
         bpb = d1-minWpb-(d1*d1/4-d2*d2/4+sep*sep)*(d1-d2)/sep/sep/2;
         cpb = d1*d1/4-minWpb*minWpb/4-pow((d1*d1/4-d2*d2/4+sep*sep)/2/sep, 2);
         rpb = a==0?(minWpb*minWpb/4+sep*sep/4-d1*d1/4)/(d1-minWpb):(-bpb+sqrt(bpb*bpb-4*a*cpb))/2/a;
         distXpb = (pow(d1/2+rpb, 2)-pow(d2/2+rpb, 2)+pow(sep, 2))/2/sep;
         
         minWnb = minW-(1-biasInt*2)*slack;
         bnb = d1-minWnb-(d1*d1/4-d2*d2/4+sep*sep)*(d1-d2)/sep/sep/2;
         cnb = d1*d1/4-minWnb*minWnb/4-pow((d1*d1/4-d2*d2/4+sep*sep)/2/sep, 2);
         rnb = a==0?(minWnb*minWnb/4+sep*sep/4-d1*d1/4)/(d1-minWnb):(-bnb+sqrt(bnb*bnb-4*a*cnb))/2/a;
         distXnb = (pow(d1/2+rnb, 2)-pow(d2/2+rnb, 2)+pow(sep, 2))/2/sep;
         c1sp = d1/2*sin(atan2(rpb+minWpb/2, distXpb));
         c2sp = d2/2*sin(atan2(rpb+minWpb/2, sep-distXpb));
         c1sn = d1/2*sin(atan2(rnb+minWnb/2, distXnb));
         c2sn = d2/2*sin(atan2(rnb+minWnb/2, sep-distXnb));
         angleOfSlope = atan2(abs(d2/2-d1/2), sep);
         if (minWnb*(1+sin(angleOfSlope)/2)>d1/2+d2/2) {
             distToUse = minWnb*(1+sin(angleOfSlope)/2);
             posToUse = distXpb+sin(angleOfSlope)*(rpb+minWpb/2-distToUse);
             rnb2 = -(posToUse*posToUse+posToUse*(d2*d2/4-d1*d1/4-sep*sep)/sep+d1*d1/4-distToUse*distToUse/4)/(d1-distToUse+posToUse*(d2-d1)/sep);
             distXnb2 = -(d2*d2/4-d1*d1/4-sep*sep)/2/sep+(d1-d2)/2/sep*rnb2;
             distYnb = sqrt(pow(-rnb2-d1/2, 2)-distXnb2*distXnb2);
             ang1nb = atan2(distXnb2, distYnb);
             ang2nb = atan2(sep-distXnb2, distYnb);
             translate([distXnb2, distYnb, 0])rotate([0, 0, 90-ang1nb])cylinderSection(rnb2, height, ang1nb+ang2nb, ang1nb/2+ang2nb/2, -rnb2-d1/2-d2/2, n);
         }
         if (minWpb*(1+sin(angleOfSlope)/2)>d1/2+d2/2) {
            distToUse = minWpb*(1+sin(angleOfSlope)/2);
            posToUse = distXnb+sin(angleOfSlope)*(rnb+minWnb/2-distToUse);
            rpb2 = -(posToUse*posToUse+posToUse*(d2*d2/4-d1*d1/4-sep*sep)/sep+d1*d1/4-distToUse*distToUse/4)/(d1-distToUse+posToUse*(d2-d1)/sep);
            distXpb2 = -(d2*d2/4-d1*d1/4-sep*sep)/2/sep+(d1-d2)/2/sep*rpb2;
            distYpb = sqrt(pow(-rpb2-d1/2, 2)-distXpb2*distXpb2);
            ang1pb = atan2(distXpb2, distYpb);
            ang2pb = atan2(sep-distXpb2, distYpb);
            translate([distXpb2, -distYpb, 0])rotate([0, 0, -90-ang2pb])cylinderSection(rpb2, height, ang1pb+ang2pb, ang1pb/2+ang2pb/2, -rpb2-d1/2-d2/2, n);
         }
      }
      intersection(){
difference(){
            if(minW>=d1 || minW >= d2){
               hull(){
                 cylinder(d = d1, h = h);
                 translate([sep, 0, 0])cylinder(d = d2, h = h);
               }
            }else {
               if(biasInt == undef){
                  a = -pow(d1-d2, 2)/sep/sep/4;
                  b = d1-minW-(d1*d1/4-d2*d2/4+sep*sep)*(d1-d2)/sep/sep/2;
                  c = d1*d1/4-minW*minW/4-pow((d1*d1/4-d2*d2/4+sep*sep)/2/sep, 2);
                  r = a==0?(minW*minW/4+sep*sep/4-d1*d1/4)/(d1-minW):(-b+sqrt(b*b-4*a*c))/2/a;
                  distX = (pow(d1/2+r, 2)-pow(d2/2+r, 2)+pow(sep, 2))/2/sep;
                  c1s = d1/2*sin(atan2(r+minW/2, distX));
                  c2s = d2/2*sin(atan2(r+minW/2, sep-distX));
                  difference(){
                     union(){
                       cylinder(d = d1, h = h);
                       translate([sep, 0, 0])cylinder(d = d2, h = h);
                       translate([0, -c1s, 0])cube([distX, c1s*2, h]);
                       translate([distX, -c2s, 0])cube([sep-distX, c2s*2, h]);
                     }
                     ang1 = atan2(distX, r+minW/2);
                     ang2 = atan2(sep-distX, r+minW/2);
                     translate([distX, r+minW/2, -0.001])rotate([0, 0, -90-ang1])cylinderSection(r, h+0.002, ang1+ang2, ang1, d1/2, n);
                     translate([distX, -r-minW/2, -0.001])rotate([0, 0, 90-ang2])cylinderSection(r, h+0.002, ang1+ang2, ang2, d2/2, n);
                  }
               } else {
                  slack = min(d1, d2)-minW;
                  minWpb = minW+(1-biasInt*2)*slack;
                  a = -pow(d1-d2, 2)/sep/sep/4;
                  bpb = d1-minWpb-(d1*d1/4-d2*d2/4+sep*sep)*(d1-d2)/sep/sep/2;
                  cpb = d1*d1/4-minWpb*minWpb/4-pow((d1*d1/4-d2*d2/4+sep*sep)/2/sep, 2);
                  rpb = a==0?(minWpb*minWpb/4+sep*sep/4-d1*d1/4)/(d1-minWpb):(-bpb+sqrt(bpb*bpb-4*a*cpb))/2/a;
                  distXpb = (pow(d1/2+rpb, 2)-pow(d2/2+rpb, 2)+pow(sep, 2))/2/sep;
                  
                  minWnb = minW-(1-biasInt*2)*slack;
                  bnb = d1-minWnb-(d1*d1/4-d2*d2/4+sep*sep)*(d1-d2)/sep/sep/2;
                  cnb = d1*d1/4-minWnb*minWnb/4-pow((d1*d1/4-d2*d2/4+sep*sep)/2/sep, 2);
                  rnb = a==0?(minWnb*minWnb/4+sep*sep/4-d1*d1/4)/(d1-minWnb):(-bnb+sqrt(bnb*bnb-4*a*cnb))/2/a;
                  distXnb = (pow(d1/2+rnb, 2)-pow(d2/2+rnb, 2)+pow(sep, 2))/2/sep;
                  c1sp = d1/2*sin(atan2(rpb+minWpb/2, distXpb));
                  c2sp = d2/2*sin(atan2(rpb+minWpb/2, sep-distXpb));
                  c1sn = d1/2*sin(atan2(rnb+minWnb/2, distXnb));
                  c2sn = d2/2*sin(atan2(rnb+minWnb/2, sep-distXnb));
                  angleOfSlope = atan2(abs(d2/2-d1/2), sep);
                  if(abs(angleOfSlope)>10&&biasInt!=undef&&(biasInt>1||biasInt<0)){
                     echo("WARNING: highly biased minimal bridges with different sized end points are unreliable, you may want to use ends with similar sizes, place them further apart, or use less bias.");
                  }else if(biasInt>4||biasInt<-3){
                     echo("WARNING: minimal bridges with bias values of more than 7, or less than -7 are unreliable, you may want to reduce the bias.");
                  }
                  difference(){
                     union(){
                       cylinder(d = d1, h = h);
                       translate([sep, 0, 0])cylinder(d = d2, h = h);
                        
                       if(minWpb<min(d1, d2)){
                          cube([distXpb, c1sp, h]);
                          translate([distXpb, 0, 0])cube([sep-distXpb, c2sp, h]);
                       } else if (minWpb*(1+sin(angleOfSlope)/2)>d1/2+d2/2) {
                          distToUse = minWpb*(1+sin(angleOfSlope)/2);
                          posToUse = distXnb+sin(angleOfSlope)*(rnb+minWnb/2-distToUse);
                          rpb2 = -(posToUse*posToUse+posToUse*(d2*d2/4-d1*d1/4-sep*sep)/sep+d1*d1/4-distToUse*distToUse/4)/(d1-distToUse+posToUse*(d2-d1)/sep);
                          distXpb2 = -(d2*d2/4-d1*d1/4-sep*sep)/2/sep+(d1-d2)/2/sep*rpb2;
                          distYpb = sqrt(pow(-rpb2-d1/2, 2)-distXpb2*distXpb2);
                          ang1pb = atan2(distXpb2, distYpb);
                          ang2pb = atan2(sep-distXpb2, distYpb);
                          translate([distXpb2, -distYpb, 0])rotate([0, 0, -90-ang2pb])cylinderSection(rpb2, h, ang1pb+ang2pb, ang1pb/2+ang2pb/2, -rpb2-d1/2-d2/2, n);
                          if(c1sn>0){
                              translate([-d1/2, 0, 0])cube([distXnb+d1/2, -rpb2, h]);
                          }else{
                             translate([-d1/2, -c2sn, 0])cube([distXnb+d1/2, -c2sn-rpb2, h]);
                          }
                          if(c2sn>0){
                              translate([distXnb, 0, 0])cube([distXnb+d2/2, -rpb2, h]);
                          }else{
                             translate([distXnb, -c2sn, 0])cube([sep-distXnb+d2/2, -c2sn-rpb2, h]);
                          }
                       } else {
                          translate([-d1/2, 0, 0])cube([sep+d1/2+d2/2, max(d1, d2)/2, h]);
                       }
                       if(minWnb<min(d1, d2)){
                          translate([0, -c1sn, 0])cube([distXnb, c1sn, h]);
                          translate([distXnb, -c2sn, 0])cube([sep-distXnb, c2sn, h]);
                       } else if (minWnb*(1+sin(angleOfSlope)/2)>d1/2+d2/2) {
                          distToUse = minWnb*(1+sin(angleOfSlope)/2);
                          posToUse = distXpb+sin(angleOfSlope)*(rpb+minWpb/2-distToUse);
                          rnb2 = -(posToUse*posToUse+posToUse*(d2*d2/4-d1*d1/4-sep*sep)/sep+d1*d1/4-distToUse*distToUse/4)/(d1-distToUse+posToUse*(d2-d1)/sep);
                          distXnb2 = -(d2*d2/4-d1*d1/4-sep*sep)/2/sep+(d1-d2)/2/sep*rnb2;
                          distYnb = sqrt(pow(-rnb2-d1/2, 2)-distXnb2*distXnb2);
                          ang1nb = atan2(distXnb2, distYnb);
                          ang2nb = atan2(sep-distXnb2, distYnb);
                          translate([distXnb2, distYnb, 0])rotate([0, 0, 90-ang1nb])cylinderSection(rnb2, h, ang1nb+ang2nb, ang1nb/2+ang2nb/2, -rnb2-d1/2-d2/2, n);
                          if(c1sp>0){
                              translate([-d1/2, rnb2, 0])cube([distXpb+d1/2, -rnb2, h]);
                          }else{
                              translate([-d1/2, -rpb, 0])cube([distXpb+d1/2, rpb+c1sp, h]);
                          }
                          if(c2sp>0){
                              translate([distXpb, rnb2, 0])cube([sep-distXpb+d2/2, -rnb2, h]);
                          }else{
                              translate([distXpb, -rpb, 0])cube([sep-distXpb+d2/2, rpb+c2sp, h]);
                          }
                       } else {
                           translate([-d1/2, -max(d1, d2)/2, 0])cube([sep+d1/2+d2/2, max(d1, d2)/2, h]);
                       }
                     }
                     ang1nb = atan2(distXnb, rnb+minWnb/2);
                     ang2nb = atan2(sep-distXnb, rnb+minWnb/2);
                     ang1pb = atan2(distXpb, rpb+minWpb/2);
                     ang2pb = atan2(sep-distXpb, rpb+minWpb/2);
                     if(minWpb<min(d1, d2))translate([distXpb, rpb+minWpb/2, -0.001])rotate([0, 0, -90-ang1pb])cylinderSection(rpb, h+0.002, ang1pb+ang2pb, ang1pb, d1/2+d2/2+rpb+sep, n);
                     if(minWnb<min(d1, d2))translate([distXnb, -rnb-minWnb/2, -0.001])rotate([0, 0, 90-ang2nb])cylinderSection(rnb, h+0.002, ang1nb+ang2nb, ang2nb, d1/2+d2/2+rnb+sep, n);
                  }
               }
            }
            if(speed==0){
               if(minH!=undef&&minH<h1&&minH<h2){
                  ratio = (h1-minH)/(h2-minH);
                  fs = flatL!=undef?sep-d1/2-d2/2-flatL:(sep-d1/2-d2/2)*(1-(flatProportion!=undef?flatProportion:0));
                  cr1 = max(curveR1!=undef?curveR1:curveR!=undef?curveR:ratio/(ratio+1)*fs+d1/2, d1/2);
                  cr2 = max(curveR2!=undef?curveR2:curveR!=undef?curveR:fs-ratio/(ratio+1)*fs+d2/2, d2/2);
                  translate([0, 0, minH+0.001])rotate([0, 0, -90])rotate_extrude(angle = biasInt!=undef&&(biasInt>1||biasInt<0)?360:180, $fn = hRoundfn)rotate([0, 180, -90]){
                     translate([0, d1/2])frames_curveToSlope(h1-minH, cr1-d1/2, hRoundfn);
                     translate([h1-minH-0.001, 0])square([h2-h1+0.002, cr1]);
                  };
                  translate([sep, 0, minH+0.001])rotate([0, 0, 90])rotate_extrude(angle = biasInt!=undef&&(biasInt>1||biasInt<0)?360:180, $fn = hRoundfn)rotate([0, 180, -90]){
                     translate([0, d2/2])frames_curveToSlope(h2-minH, cr2-d2/2, hRoundfn);
                     translate([h2-minH, 0])square([h1-h2+0.001, cr2]);
                  };
               }else if(h1>h2){
                  translate([0, 0, h2+0.001])rotate([0, 0, -90])rotate_extrude(angle = biasInt!=undef&&(biasInt>1||biasInt<0)?360:180, $fn = hRoundfn)rotate([0, 180, -90]){
                     translate([0, d1/2])frames_curveToSlope(h1-h2, sep-d1/2, hRoundfn);
                     translate([0, sep])square([h1-h2, d2/2+0.002]);
                  };
               }else if(h2>h1){
                  translate([sep, 0, h1+0.001])rotate([0, 0, 90])rotate_extrude(angle = biasInt!=undef&&(biasInt>1||biasInt<0)?360:180, $fn = hRoundfn)rotate([0, 180, -90]){
                     translate([0, d2/2])frames_curveToSlope(h2-h1, sep-d2/2, hRoundfn);
                     translate([0, sep])square([h2-h1, d1/2+0.002]);
                  };
               }
            }
         }
         if(speed==1){
            cylinder(d = d1, h = h1);
            translate([sep, 0, 0])cylinder(d = d2, h = h2);
            hull(){
              difference(){
                 cylinder(d = d1, h = h1);
                 translate([-d1/2-0.001, -d1/2-0.001, 0])cube([d1/2, d1, h1]);
              }
              translate([sep, 0, 0])difference(){
                 cylinder(d = d2, h = h2);
                 translate([0, -d2/2-0.001, -0.001])cube([d2/2, d2, h2+0.002]);
              }
            }
         }else if(speed==0&&minH!=undef&&minH<h1&&minH<h2){
            ratio = (h1-minH)/(h2-minH);
            fs = flatL!=undef?sep-d1/2-d2/2-flatL:(sep-d1/2-d2/2)*(1-(flatProportion!=undef?flatProportion:0));
            cr1 = max(curveR1!=undef?curveR1:curveR!=undef?curveR:ratio/(ratio+1)*fs+d1/2, d1/2);
            cr2 = max(curveR2!=undef?curveR2:curveR!=undef?curveR:fs-ratio/(ratio+1)*fs+d2/2, d2/2);
            hull(){
               cylinder(d = d1, h = minH);
               translate([sep, 0, 0])cylinder(d = d2, h = minH);
               if(biasInt!=undef&&(biasInt>1||biasInt<0))intersectAllowanceConvexEdge(minH);
            }
            intersection(){
               union(){
                  cylinder(d = cr1*2*cos(360/hRoundfn)-0.001, h = h1+0.001);
                  translate([sep, 0, 0])cylinder(d = cr2*2*cos(360/hRoundfn)-0.001, h = h2+0.001);
               }
               hull(){
                  cylinder(d = d1, h = max(h1, h2));
                  translate([sep, 0, 0])cylinder(d = d2, h = max(h1, h2));
                  if(biasInt!=undef&&(biasInt>1||biasInt<0))intersectAllowanceConvexEdge(max(h1, h2));
               }
            }
         }else if(biasInt!=undef){
            hull(){
               cylinder(d = d1, h = max(h1, h2));
               translate([sep, 0, 0])cylinder(d = d2, h = max(h1, h2));
               if(biasInt!=undef&&(biasInt>1||biasInt<0))intersectAllowanceConvexEdge(max(h1, h2));
            }
         }else{
            hull(){
               cylinder(d = d1, h = max(h1, h2));
               translate([sep, 0, 0])cylinder(d = d2, h = max(h1, h2));
            }
         }
      }
   }
}
module minimalBridgeTriangle(minW, d, h, l1, l2, l3, curve = 0){
   slack = d-minW;
   y = ((l1[0]*l1[0]+l1[1]*l1[1]-l2[0]*l2[0]-l2[1]*l2[1])*(l1[0]-l3[0])-(l1[0]*l1[0]+l1[1]*l1[1]-l3[0]*l3[0]-l3[1]*l3[1])*(l1[0]-l2[0]))/2/((l1[1]-l2[1])*(l1[0]-l3[0])-(l1[1]-l3[1])*(l1[0]-l2[0]));
   x = (l1[0]-l2[0])==0?(l1[0]*l1[0]+l1[1]*l1[1]-l3[0]*l3[0]-l3[1]*l3[1]-2*(l1[1]-l3[1])*y)/2/(l1[0]-l3[0]):(l1[0]*l1[0]+l1[1]*l1[1]-l2[0]*l2[0]-l2[1]*l2[1]-2*(l1[1]-l2[1])*y)/2/(l1[0]-l2[0]);
   r = sqrt(pow(x-l1[0], 2)+pow(y-l1[1], 2));
   curDist12 = sqrt(pow(x-l1[0]/2-l2[0]/2, 2)+pow(y-l1[1]/2-l2[1]/2, 2));
   curDist23 = sqrt(pow(x-l2[0]/2-l3[0]/2, 2)+pow(y-l2[1]/2-l3[1]/2, 2));
   curDist13 = sqrt(pow(x-l1[0]/2-l3[0]/2, 2)+pow(y-l1[1]/2-l3[1]/2, 2));
   minimalBridge(minW, d = d, h = h, l1 = l1, l2 = l2, bias = ((r-curDist12)/slack*2-1)*curve);
   minimalBridge(minW, d = d, h = h, l1 = l2, l2 = l3, bias = ((r-curDist23)/slack*2-1)*curve);
   minimalBridge(minW, d = d, h = h, l1 = l1, l2 = l3, bias = (1-(r-curDist13)/slack*2)*curve);
}


frames_flatBase = 1;
frames_roundedBase = 2;
frames_pyramidBase = 3;
frames_sphericalBase = 4;
frames_inverseCurve = 5;
frames_hullBase = 6;
frames_bridgeBase = 7;

module frames_base(baseType, boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular = false, center = false, speed = 0){
   if(baseType == frames_flatBase){
      frames_flatBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, center);
   }else if(baseType == frames_roundedBase){
      frames_roundedBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, center);
   }else if(baseType == frames_pyramidBase){
      frames_pyramidBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular, center);
   }else if(baseType == frames_sphericalBase){
      frames_sphericalBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular, center);
   }else if(baseType == frames_inverseCurve){
      frames_inverseCurve(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular, center);
   }else if(baseType == frames_hullBase){
      frames_hullBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, circular, center);
   }else if(baseType == frames_bridgeBase){
      frames_bridgeBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular, center, speed);
   }else{
      echo("Available base types: frames_flatBase frames_roundedBase frames_roundBase frames_pyramidBase frames_sphericalBase frames_inverseCurve frames_hullBase frames_bridgeBase");
      echo("Available base parameters: baseType, boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, boltNum, circular, center, speed");
   }
}

module frames_flatBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, center = false){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0])difference(){
      hull(){
         cylinder(d = cornerD, h = baseT);
         translate([boltSepX, 0, 0])cylinder(d = cornerD, h = baseT);
         translate([0, boltSepY, 0])cylinder(d = cornerD, h = baseT);
         translate([boltSepX, boltSepY, 0])cylinder(d = cornerD, h = baseT);
      }
      translate([0, 0, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([boltSepX, 0, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([0, boltSepY, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([boltSepX, boltSepY, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
   }
}

module frames_roundedBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, center = false){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0])difference(){
      hull(){
         cylinder(d = cornerD, h = h);
         translate([boltSepX, 0, 0])cylinder(d = cornerD, h = h);
         translate([0, boltSepY, 0])cylinder(d = cornerD, h = h);
         translate([boltSepX, boltSepY, 0])cylinder(d = cornerD, h = h);
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([0, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
   }
}
module frames_pyramidBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular = false, center = false){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0])difference(){
      union(){
         hull(){
            difference(){
               translate([-cornerD/2, -cornerD/2, 0])cube([boltSepX+cornerD, boltSepY+cornerD, baseT]);
               translate([-cornerD/2, -cornerD/2, 0])cube([corneringEffectLevel, corneringEffectLevel, baseT]);
               translate([boltSepX-corneringEffectLevel+cornerD/2, -cornerD/2, 0])cube([corneringEffectLevel, corneringEffectLevel, baseT]);
               translate([-cornerD/2, boltSepY-corneringEffectLevel+cornerD/2, 0])cube([corneringEffectLevel, corneringEffectLevel, baseT]);
               translate([boltSepX-corneringEffectLevel+cornerD/2, boltSepY-corneringEffectLevel+cornerD/2, 0])cube([corneringEffectLevel, corneringEffectLevel, baseT]);
            }
            if(circular){
               translate([boltSepX/2, boltSepY/2, 0])cylinder(d = topDimensions[0]==undef?topDimensions:topDimensions[0], h = h);
            }else{
               translate([boltSepX/2-(topDimensions[0]==undef?topDimensions:topDimensions[0])/2, boltSepY/2-(topDimensions[1]==undef?topDimensions:topDimensions[1])/2, 0])cube([topDimensions[0]==undef?topDimensions:topDimensions[0], topDimensions[1]==undef?topDimensions:topDimensions[1], h]);
            }
         }
         hull(){
            cylinder(d = cornerD, h = baseT);
            translate([boltSepX, 0, 0])cylinder(d = cornerD, h = baseT);
            translate([0, boltSepY, 0])cylinder(d = cornerD, h = baseT);
            translate([boltSepX, boltSepY, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([0, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
   }
}

module frames_sphericalBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular = false, center = false){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0])difference(){
      union(){
         if(circular){
            translate([boltSepX/2, boltSepY/2, 0])cylinder(d = td+corneringEffectLevel*2, h = baseT);
            translate([boltSepX/2, boltSepY/2, 0])cylinder(d = td, h = h);
            td = topDimensions[0]==undef?topDimensions:topDimensions[0];
            translate([boltSepX/2, boltSepY/2, baseT])rotate_extrude(){
               translate([td/2, 0])resize([corneringEffectLevel, h-baseT])intersection(){
                  circle(d = 5);
                  square([10, 5]);
               }
            }
         }else{
            td1 = topDimensions[0]==undef?topDimensions:topDimensions[0];
            td2 = topDimensions[1]==undef?topDimensions:topDimensions[1];
            translate([boltSepX/2, boltSepY/2, 0])hull(){
               translate([td1/2, td2/2, 0])cylinder(r = corneringEffectLevel, h = baseT);
               translate([-td1/2, td2/2, 0])cylinder(r = corneringEffectLevel, h = baseT);
               translate([td1/2, -td2/2, 0])cylinder(r = corneringEffectLevel, h = baseT);
               translate([-td1/2, -td2/2, 0])cylinder(r = corneringEffectLevel, h = baseT);
            }
            translate([boltSepX/2, boltSepY/2, 0])hull(){
               translate([td1/2, td2/2, baseT])resize([corneringEffectLevel, corneringEffectLevel, h-baseT])difference(){
                  sphere(d = 10);
                  translate([-5, -5, -5])cube([10, 10, 5]);
                  translate([-5, -5, 0])cube([10, 5, 5]);
                  translate([-5, -5, 0])cube([5, 10, 5]);
               }
               translate([-td1/2, td2/2, baseT])resize([corneringEffectLevel, corneringEffectLevel, h-baseT])difference(){
                  sphere(d = 10);
                  translate([-5, -5, -5])cube([10, 10, 5]);
                  translate([-5, -5, 0])cube([10, 5, 5]);
                  translate([0, -5, 0])cube([5, 10, 5]);
               }
               translate([td1/2, -td2/2, baseT])resize([corneringEffectLevel, corneringEffectLevel, h-baseT])difference(){
                  sphere(d = 10);
                  translate([-5, -5, -5])cube([10, 10, 5]);
                  translate([-5, 0, 0])cube([10, 5, 5]);
                  translate([-5, -5, 0])cube([5, 10, 5]);
               }
               translate([-td1/2, -td2/2, baseT])resize([corneringEffectLevel, corneringEffectLevel, h-baseT])difference(){
                  sphere(d = 10);
                  translate([-5, -5, -5])cube([10, 10, 5]);
                  translate([-5, 0, 0])cube([10, 5, 5]);
                  translate([0, -5, 0])cube([5, 10, 5]);
               }
            }
         }
         hull(){
            cylinder(d = cornerD, h = baseT);
            translate([boltSepX, 0, 0])cylinder(d = cornerD, h = baseT);
            translate([0, boltSepY, 0])cylinder(d = cornerD, h = baseT);
            translate([boltSepX, boltSepY, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([0, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
   }
}

module frames_inverseCurve(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular = false, center = false){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0])difference(){
      union(){
         if(circular){
            td = topDimensions[0]==undef?topDimensions:topDimensions[0];
            translate([boltSepX/2, boltSepY/2, 0])cylinder(d = td+corneringEffectLevel*2, h = h);
         }else{
            td1 = topDimensions[0]==undef?topDimensions:topDimensions[0];
            td2 = topDimensions[1]==undef?topDimensions:topDimensions[1];
            translate([boltSepX/2-td1/2-corneringEffectLevel, boltSepY/2-td2/2-corneringEffectLevel, 0])cube([td1+corneringEffectLevel*2, td2+corneringEffectLevel*2, h]);
         }
         hull(){
            cylinder(d = cornerD, h = baseT);
            translate([boltSepX, 0, 0])cylinder(d = cornerD, h = baseT);
            translate([0, boltSepY, 0])cylinder(d = cornerD, h = baseT);
            translate([boltSepX, boltSepY, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([0, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      
      if(circular){
         td = topDimensions[0]==undef?topDimensions:topDimensions[0];
         translate([boltSepX/2, boltSepY/2, baseT])rotate_extrude(){
            translate([td/2, 0])frames_curveToSlope(corneringEffectLevel+0.001, h-baseT+0.001);
         }
      }else{
         td1 = topDimensions[0]==undef?topDimensions:topDimensions[0];
         td2 = topDimensions[1]==undef?topDimensions:topDimensions[1];
         translate([boltSepX/2+td1/2, boltSepY/2+td2/2+corneringEffectLevel+0.001, baseT])rotate([90, 0, 0])linear_extrude(height = td2+corneringEffectLevel*2+0.002)frames_curveToSlope(corneringEffectLevel+0.001, h-baseT+0.001);
         translate([boltSepX/2-td1/2, boltSepY/2-td2/2-corneringEffectLevel-0.001, baseT])rotate([90, 0, 180])linear_extrude(height = td2+corneringEffectLevel*2+0.002)frames_curveToSlope(corneringEffectLevel+0.001, h-baseT+0.001);
         translate([boltSepX/2-td1/2-corneringEffectLevel-0.001, boltSepY/2+td2/2, baseT])rotate([90, 0, 90])linear_extrude(height = td1+corneringEffectLevel*2+0.002)frames_curveToSlope(corneringEffectLevel+0.001, h-baseT+0.001);
         translate([boltSepX/2+td1/2+corneringEffectLevel+0.001, boltSepY/2-td2/2, baseT])rotate([90, 0, -90])linear_extrude(height = td1+corneringEffectLevel*2+0.002)frames_curveToSlope(corneringEffectLevel+0.001, h-baseT+0.001);
      }
   }
}

module frames_hullBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, circular = false, center = false){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0])difference(){
      union(){
         hull(){
            if(circular){
               translate([boltSepX/2, boltSepY/2, 0])cylinder(d = topDimensions[0]==undef?topDimensions:topDimensions[0], h = h);
            }else{
               translate([boltSepX/2-(topDimensions[0]==undef?topDimensions:topDimensions[0])/2, boltSepY/2-(topDimensions[1]==undef?topDimensions:topDimensions[1])/2, 0])cube([topDimensions[0]==undef?topDimensions:topDimensions[0], topDimensions[1]==undef?topDimensions:topDimensions[1], h]);
            }
            cylinder(d = cornerD, h = baseT);
            translate([boltSepX, 0, 0])cylinder(d = cornerD, h = baseT);
            translate([0, boltSepY, 0])cylinder(d = cornerD, h = baseT);
            translate([boltSepX, boltSepY, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([0, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      translate([boltSepX, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
   }
}
module frames_bridgeBase(boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, circular = false, center = false, speed = 0){
   translate([center?-boltSepX/2:0, center?-boltSepY/2:0, 0]){
      difference(){
         union(){
            if(circular){
               centerD = topDimensions[0]==undef?topDimensions:topDimensions[0];
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = centerD, d2 = cornerD, l1 = [boltSepX/2, boltSepY/2], l2 = [0, 0], speed = speed);
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = centerD, d2 = cornerD, l1 = [boltSepX/2, boltSepY/2], l2 = [boltSepX, 0], speed = speed);
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = centerD, d2 = cornerD, l1 = [boltSepX/2, boltSepY/2], l2 = [0, boltSepY], speed = speed);
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = centerD, d2 = cornerD, l1 = [boltSepX/2, boltSepY/2], l2 = [boltSepX, boltSepY], speed = speed);
            }else{
               td1 = topDimensions[0]==undef?topDimensions:topDimensions[0];
               td2 = topDimensions[1]==undef?topDimensions:topDimensions[1];
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = cornerD, d2 = cornerD, l1 = [boltSepX/2-td1/2+cornerD/4, boltSepY/2-td2/2+cornerD/4], l2 = [0, 0], speed = speed);
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = cornerD, d2 = cornerD, l1 = [boltSepX/2+td1/2-cornerD/4, boltSepY/2-td2/2+cornerD/4], l2 = [boltSepX, 0], speed = speed);
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = cornerD, d2 = cornerD, l1 = [boltSepX/2-td1/2+cornerD/4, boltSepY/2+td2/2-cornerD/4], l2 = [0, boltSepY], speed = speed);
               minimalBridge(corneringEffectLevel, h1 = h, h2 = baseT, d1 = cornerD, d2 = cornerD, l1 = [boltSepX/2+td1/2-cornerD/4, boltSepY/2+td2/2-cornerD/4], l2 = [boltSepX, boltSepY], speed = speed);
               hull(){
                  translate([boltSepX/2-td1/2+cornerD/4, boltSepY/2+td2/2-cornerD/4, 0])cylinder(d = cornerD, h = h);
                  translate([boltSepX/2+td1/2-cornerD/4, boltSepY/2+td2/2-cornerD/4, 0])cylinder(d = cornerD, h = h);
                  translate([boltSepX/2-td1/2+cornerD/4, boltSepY/2-td2/2+cornerD/4, 0])cylinder(d = cornerD, h = h);
                  translate([boltSepX/2+td1/2-cornerD/4, boltSepY/2-td2/2+cornerD/4, 0])cylinder(d = cornerD, h = h);
               }
            }
         }
         translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
         translate([boltSepX, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
         translate([0, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
         translate([boltSepX, boltSepY, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h, silent = true);
      }
   }
}

framesTop_none = 0;
framesTop_square = 1;
framesTop_cylindrical = 2;
framesTop_crossCylinder1 = 3;
framesTop_crossCylinder2 = 4;
module frames_base2(baseType, boltSep, baseWidth, baseT, boltType, boltSize, h, topType, topW = undef, topL = undef, center = false, speed = 0){
   topL = topL==undef?baseWidth:topL;
   topW = topW==undef?baseWidth:topW;
   if(baseType == frames_flatBase){
      frames_flatBase2(boltSep, baseWidth, baseT, boltType, boltSize, center);
   }else if(baseType == frames_roundedBase){
      frames_roundedBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topType, center);
   }else if(baseType == frames_pyramidBase){
      frames_pyramidBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center);
   }else if(baseType == frames_sphericalBase){
      frames_sphericalBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center);
   }else if(baseType == frames_inverseCurve){
      frames_inverseCurve2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center);
   }else if(baseType == frames_hullBase){
      frames_hullBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center);
   }else if(baseType == frames_bridgeBase){
      frames_bridgeBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center, speed);
   }else{
      echo("Available base types: frames_flatBase frames_roundedBase frames_roundBase frames_pyramidBase frames_sphericalBase frames_inverseCurve frames_hullBase frames_bridgeBase");
      echo("Available top type: framesTop_square framesTop_cylindrical framesTop_crossCylinder1 framesTop_crossCylinder2");
      echo("Available base parameters: baseType, boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, boltNum, circular, center, speed");
   }
}

module frames_flatBase2(boltSep, baseWidth, baseT, boltType, boltSize, center = false){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      hull(){
         cylinder(d = baseWidth, h = baseT);
         translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
      }
      translate([0, 0, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
   }
}


module frames_roundedBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topType, center = false){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      union(){
         hull(){
            cylinder(d = baseWidth, h = h);
            translate([boltSep, 0, 0])cylinder(d = baseWidth, h = h);
         }
         if(topType == framesTop_cylindrical)translate([boltSep/2, 0, 0])cylinder(d = topW, h=h);
         if(topType == framesTop_crossCylinder2)translate([0, 0, h])if(topW<baseWidth){
            intersection(){
               hull(){
                  cylinder(d = baseWidth, h = topW/2);
                  translate([boltSep, 0, 0])cylinder(d = baseWidth, h = topW/2);
               }
               translate([-baseWidth/2, 0, 0])rotate([0, 90, 0])cylinder(d = topW, h = boltSep+baseWidth);
            }
         }else{
            translate([-baseWidth/2, 0, 0])rotate([0, 90, 0])cylinder(d = topW, h = boltSep+baseWidth);
         }
         if(topType == framesTop_crossCylinder1){
            translate([boltSep/2, -baseWidth/2, h])rotate([-90, 0, 0])cylinder(d = topW, h = baseWidth);
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
   }
}
module frames_pyramidBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center = false){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      union(){
         hull(){
            cylinder(d = baseWidth, h = baseT);
            translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
         }
         if(topType == framesTop_crossCylinder2){
            translate([boltSep/2-topL/2, 0, h])rotate([0, 90, 0])cylinder(d = topW, h = topL);
         }
         hull(){
            translate([0, -baseWidth/2, 0])cube([boltSep, baseWidth, baseT]);
            if(topType == framesTop_square){
               translate([boltSep/2-topW/2, -baseWidth/2, 0])cube([topW, baseWidth, h]);
            }
            if(topType == framesTop_cylindrical){
               intersection(){
                  translate([0, -baseWidth/2, baseT])cube([boltSep, baseWidth, h-baseT]);
                  translate([boltSep/2, 0, 0])cylinder(d = topW, h=h);
               }
            }
            if(topType == framesTop_crossCylinder2)difference(){
               translate([boltSep/2-topL/2, 0, h])rotate([0, 90, 0])cylinder(d = topW, h = topL);
               translate([boltSep/2-topL/2-0.001, -topW/2, h])cube([topL+0.002, topW, topW/2+0.001]);
            }
            if(topType == framesTop_crossCylinder1){
               translate([boltSep/2, -baseWidth/2, h])rotate([-90, 0, 0])cylinder(d = topW, h = baseWidth);
            }
         }
         if(topType == framesTop_cylindrical)translate([boltSep/2, 0, 0])cylinder(d = topW, h=h);
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
   }
}
module frames_sphericalBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center = false){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      union(){
         hull(){
            cylinder(d = baseWidth, h = baseT);
            translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
         }
         if(topType == framesTop_cylindrical){
            translate([boltSep/2, 0, 0])cylinder(d = topW, h = h);
            intersection(){
               translate([0, -baseWidth/2, baseT])cube([boltSep, baseWidth, h-baseT]);
               translate([boltSep/2, 0, baseT])rotate_extrude()
                  translate([-boltSep/2, h-baseT])rotate([180, 0, 0])frames_curveToSlope(boltSep/2-topW/2, h-baseT);
            }
         }else if(topType==framesTop_square||topType==framesTop_crossCylinder1||topType==framesTop_crossCylinder2){
            w = topType==framesTop_crossCylinder2?topW:baseWidth;
            l = topType==framesTop_crossCylinder2?topL:topW;
            intersection(){
               translate([0, -l/2, baseT])cube([boltSep, l, h-baseT]);
               union(){
                  translate([boltSep/2-l/2, -w/2, baseT])rotate([-90, 0, 0])resize([boltSep-l, h*2-baseT*2, w])cylinder(d = 10, h = 10);
                  translate([boltSep/2+l/2, -w/2, baseT])rotate([-90, 0, 0])resize([boltSep-l, h*2-baseT*2, w])cylinder(d = 10, h = 10);
               }
            }
            translate([boltSep/2-l/2, -w/2, baseT])cube([l, w, h-baseT]);
            if(topType==framesTop_crossCylinder1){
               translate([boltSep/2, -w/2, h])rotate([-90, 0, 0])cylinder(d = topW, h = baseWidth);
            }
            if(topType==framesTop_crossCylinder2){
               translate([boltSep/2-l/2, 0, h])rotate([0, 90, 0])cylinder(d = topW, h = topL);
               translate([0, -w/2, 0])cube([boltSep, w, baseT]);
               hull(){
                  translate([0, baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  translate([0, -baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  translate([boltSep, baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  translate([boltSep, -baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  cylinder(d = baseWidth, h = baseT);
                  translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
               }
            }
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
   }
}
module frames_inverseCurve2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center = false){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      union(){
         hull(){
            cylinder(d = baseWidth, h = baseT);
            translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
         }
         if(topType == framesTop_cylindrical){
            cw = boltSep/2-topW/2;
            translate([boltSep/2, 0, 0])cylinder(d = topW, h = h);
            intersection(){
               translate([0, -baseWidth/2, baseT])cube([boltSep, baseWidth, h-baseT]);
               translate([boltSep/2, 0, baseT])rotate_extrude()
                  translate([topW/2, 0])rotate([0, 0, 0])difference(){
                     square([cw, h-baseT]);
                     frames_curveToSlope(cw, h-baseT);
                  }
            }
         }else if(topType==framesTop_square||topType==framesTop_crossCylinder1||topType==framesTop_crossCylinder2){
            w = topType==framesTop_crossCylinder2?topW:baseWidth;
            l = topType==framesTop_crossCylinder2?topL:topW;
            cw = boltSep/2-l/2;
            intersection(){
               translate([0, -w/2, baseT])cube([boltSep, w, h-baseT]);
               union(){
                  translate([boltSep/2+l/2, w/2, baseT])rotate([90, 0, 0])linear_extrude(height = w)difference(){
                     square([cw, h-baseT]);
                     frames_curveToSlope(cw, h-baseT);
                  }
                  translate([boltSep/2-l/2, -w/2, baseT])rotate([90, 0, 180])linear_extrude(height = w)difference(){
                     square([cw, h-baseT]);
                     frames_curveToSlope(cw, h-baseT);
                  }
               }
            }
            translate([boltSep/2-l/2, -w/2, baseT])cube([l, w, h-baseT]);
            if(topType==framesTop_crossCylinder1){
               translate([boltSep/2, -w/2, h])rotate([-90, 0, 0])cylinder(d = topW, h = baseWidth);
            }
            if(topType==framesTop_crossCylinder2){
               translate([boltSep/2-l/2, 0, h])rotate([0, 90, 0])cylinder(d = topW, h = topL);
               translate([0, -w/2, 0])cube([boltSep, w, baseT]);
               hull(){
                  translate([0, baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  translate([0, -baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  translate([boltSep, baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  translate([boltSep, -baseWidth/2, 0])cylinder(r = w/2-baseWidth/2, h = baseT);
                  cylinder(d = baseWidth, h = baseT);
                  translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
               }
            }
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
   }
}
module frames_hullBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center = false){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      union(){
         hull(){
            cylinder(d = baseWidth, h = baseT);
            translate([boltSep, 0, 0])cylinder(d = baseWidth, h = baseT);
            if(topType == framesTop_cylindrical){
               translate([boltSep/2, 0, 0])cylinder(d = topW, h = h);
            }else if(topType==framesTop_square){
               translate([boltSep/2-topW/2, -baseWidth/2, 0])cube([topW, baseWidth, h]);
            }else if(topType==framesTop_crossCylinder1){
               translate([boltSep/2, -baseWidth/2, h])rotate([-90, 0, 0])cylinder(d = topW, h = baseWidth);
            }else if(topType==framesTop_crossCylinder2){
               translate([boltSep/2-topL/2, 0, h])rotate([0, 90, 0])cylinder(d = topW, h = topL);
            }
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
   }
}
module frames_bridgeBase2(boltSep, baseWidth, baseT, boltType, boltSize, h, topW, topL, topType, center = false, speed = 0){
   translate([center?-boltSep/2:0, 0, 0])difference(){
      union(){
         if(topType == framesTop_cylindrical){
            minimalBridge(baseWidth/2, h1 = h, h2 = baseT, d1 = topW, d2 = baseWidth, l1 = [boltSep/2, 0], l2 = [0, 0], speed = speed);
            minimalBridge(baseWidth/2, h1 = h, h2 = baseT, d1 = topW, d2 = baseWidth, l1 = [boltSep/2, 0], l2 = [boltSep, 0], speed = speed);
         }else if(topType==framesTop_square||topType==framesTop_crossCylinder1||topType==framesTop_crossCylinder2){
            w = topType==framesTop_crossCylinder2?topW:baseWidth;
            l = topType==framesTop_crossCylinder2?topL:topW;
            bh = topType==framesTop_square?h:h-topW/2;
            minimalBridge(baseWidth/2, h1 = bh, h2 = baseT, d1 = w, d2 = baseWidth, l1 = [boltSep/2-l/2, 0], l2 = [0, 0], speed = speed);
            minimalBridge(baseWidth/2, h1 = bh, h2 = baseT, d1 = w, d2 = baseWidth, l1 = [boltSep/2+l/2, 0], l2 = [boltSep, 0], speed = speed);
            translate([boltSep/2-l/2, -w/2, 0])cube([l, w, bh]);
            if(topType==framesTop_crossCylinder1){
               hull(){
                  translate([boltSep/2, -baseWidth/2, h])rotate([-90, 0, 0])cylinder(d = topW, h = baseWidth);
                  translate([boltSep/2-l/2, 0, 0])cylinder(d = w, h = bh);
                  translate([boltSep/2+l/2, 0, 0])cylinder(d = w, h = bh);
               }
            }else if(topType==framesTop_crossCylinder2){
               hull(){
                  translate([boltSep/2-topL/2, 0, h])rotate([0, 90, 0])cylinder(d = topW, h = topL);
                  translate([boltSep/2-l/2, 0, 0])cylinder(d = w, h = bh);
                  translate([boltSep/2+l/2, 0, 0])cylinder(d = w, h = bh);
               }
            }
         }
      }
      translate([0, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
      translate([boltSep, 0, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, h+topW/2, silent = true);
   }
}
module frames_baseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, center = false, strutOutside = true, speed = 0){
   translate([center?-plateW/2:0, 0, 0]){
      if(baseType == frames_flatBase){
         frames_flatBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD);
      }else if(baseType == frames_roundedBase){
         frames_roundedBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT);
      }else if(baseType == frames_pyramidBase){
         frames_pyramidBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, strutOutside);
      }else if(baseType == frames_sphericalBase){
         frames_sphericalBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT);
      }else if(baseType == frames_inverseCurve){
         frames_inverseCurveAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, strutOutside);
      }else if(baseType == frames_hullBase){
         frames_hullBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT);
      }else if(baseType == frames_bridgeBase){
         frames_bridgeBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, speed);
      }else{
         echo("Available base types: frames_flatBase frames_roundedBase frames_roundBase frames_pyramidBase frames_sphericalBase frames_inverseCurve frames_hullBase frames_bridgeBase");
         echo("Available top type: framesTop_square framesTop_cylindrical framesTop_crossCylinder1 framesTop_crossCylinder2");
         echo("Available base parameters: baseType, boltSepX, boltSepY, baseT, boltType, boltSize, cornerD, h, topDimensions, corneringEffectLevel, boltNum, circular, center, speed");
      }
   }
}
function getBaseAngleFrontXBoltSep(baseType, plateW, strutT, cornerD) = baseType==frames_flatBase?plateW+cornerD:
baseType==frames_bridgeBaseAngle?plateW+cornerD*3:plateW+cornerD+strutT*2;
function getBaseAngleRearXBoltSep(baseType, plateW, strutT, cornerD) = baseType==frames_flatBase?plateW+cornerD:
baseType==frames_bridgeBaseAngle?plateW+cornerD:plateW+cornerD+strutT*2;

module frames_flatBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD){
   cube([plateW, plateT, plateH+baseT]);
   difference(){
      hull(){
         translate([-cornerD/2, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         translate([plateW+cornerD/2, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         translate([-cornerD/2, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         translate([plateW+cornerD/2, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
      }
      translate([-cornerD/2, cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([plateW+cornerD/2, cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([-cornerD/2, baseHoleSep+cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([plateW+cornerD/2, baseHoleSep+cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
   }
}
module frames_roundedBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT){
   cube([plateW, plateT, plateH+baseT]);
   hull(){
      translate([-strutT, 0, 0])cube([strutT, plateT, plateH+baseT]);
      translate([-strutT, 0, 0])cube([strutT, baseHoleSep+cornerD, baseT]);
   }
   hull(){
      translate([plateW, 0, 0])cube([strutT, plateT, plateH+baseT]);
      translate([plateW, 0, 0])cube([strutT, baseHoleSep+cornerD, baseT]);
   }
   difference(){
      hull(){
         translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         translate([plateW+cornerD/2+strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
      }
      translate([-cornerD/2-strutT, cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([plateW+cornerD/2+strutT, cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
   }
}
module frames_sphericalBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT){
   translate([-strutT, 0, 0])cube([plateW+strutT*2, plateT, plateH+baseT]);
   difference(){
      union(){
         intersection(){
            translate([-strutT, 0, baseT])cube([strutT, baseHoleSep+cornerD, plateH]);
            translate([-strutT, plateT, baseT])rotate([0, 90, 0])resize([plateH*2, baseHoleSep*2+cornerD*2-plateT*2, strutT])cylinder(d = plateH+baseT, h = strutT);
         }
         intersection(){
            translate([plateW, 0, baseT])cube([strutT, baseHoleSep+cornerD, plateH]);
            translate([plateW, plateT, baseT])rotate([0, 90, 0])resize([plateH*2, baseHoleSep*2+cornerD*2-plateT*2, strutT])cylinder(d = plateH+baseT, h = strutT);
         }
         hull(){
            translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([-cornerD/2-strutT, cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([plateW+cornerD/2+strutT, cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
      translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltNormalWithSurface(boltType, boltSize, baseT+0.002, silent = true);
   }
}
module frames_inverseCurveAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, strutOutside = true){
   translate([-strutT, 0, 0])cube([plateW+strutT*2, plateT, plateH+baseT]);
   difference(){
      union(){
         difference(){
            hull(){
               translate([-strutT, 0, 0])cube([strutT, baseHoleSep+cornerD, plateH+baseT]);
               if(strutOutside){
                  translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = plateH+baseT);
                  translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = plateH+baseT);
               }
            }
            translate([-strutT-cornerD-0.001, baseHoleSep+cornerD, plateH+baseT])rotate([0, 90, 0])resize([plateH*2, baseHoleSep*2+cornerD*2-plateT*2, strutT+cornerD+0.002])cylinder(d = plateH+baseT, h = strutT);
            if(strutOutside)translate([-strutT-cornerD-0.001, -0.001, plateH+baseT])rotate([0, 90, 90])resize([plateH*2, cornerD*2, baseHoleSep+cornerD])cylinder(d = plateH+baseT, h = strutT);
         }
         difference(){
            hull(){
               translate([plateW, 0, 0])cube([strutT, baseHoleSep+cornerD, plateH+baseT]);
               if(strutOutside){
                  translate([cornerD/2+plateW+strutT, cornerD/2, 0])cylinder(d = cornerD, h = plateH+baseT);
                  translate([cornerD/2+plateW+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = plateH+baseT);
               }
            }
            translate([plateW-0.001, baseHoleSep+cornerD, plateH+baseT])rotate([0, 90, 0])resize([plateH*2, baseHoleSep*2+cornerD*2-plateT*2, strutT+cornerD+0.002])cylinder(d = plateH+baseT, h = strutT);
            if(strutOutside)translate([plateW+cornerD+strutT-0.001, -0.001, plateH+baseT])rotate([0, 90, 90])resize([plateH*2, cornerD*2, baseHoleSep+cornerD])cylinder(d = plateH+baseT, h = strutT);
         }
         hull(){
            translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([-cornerD/2-strutT, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2+strutT, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
   }
}
module frames_hullBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT){
   cube([plateW, plateT, plateH+baseT]);
   difference(){
      union(){
         hull(){
            translate([-strutT, 0, 0])cube([strutT, plateT, plateH+baseT]);
            translate([-strutT, 0, 0])cube([strutT, baseHoleSep+cornerD, baseT]);
            translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         }
         hull(){
            translate([plateW, 0, 0])cube([strutT, plateT, plateH+baseT]);
            translate([plateW, 0, 0])cube([strutT, baseHoleSep+cornerD, baseT]);
            translate([plateW+cornerD/2+strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         }
         hull(){
            translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([-cornerD/2-strutT, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2+strutT, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
   }
}
module frames_bridgeBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, speed){
   translate([-cornerD/2, 0, 0])cube([plateW+cornerD, plateT, plateH+baseT]);
   difference(){
      union(){
         minimalBridge(plateT, h = baseT, d = cornerD, l1 = [-cornerD*3/2, cornerD/2], l2 = [plateW+cornerD*3/2, cornerD/2], half = 1, speed = speed);
         minimalBridge(strutT, h1 = plateH+baseT, h2 = baseT, d = cornerD, l1 = [-cornerD/2, cornerD/2], l2 = [-cornerD/2, baseHoleSep+cornerD/2], speed = speed);
         minimalBridge(strutT, h1 = plateH+baseT, h2 = baseT, d = cornerD, l1 = [plateW+cornerD/2, cornerD/2], l2 = [plateW+cornerD/2, baseHoleSep+cornerD/2], speed = speed);
         minimalBridge(strutT/2, h = baseT, d = cornerD, l1 = [-cornerD/2, baseHoleSep+cornerD/2], l2 = [plateW+cornerD/2, baseHoleSep+cornerD/2]);
      }
      translate([-cornerD*3/2, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD*3/2, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([-cornerD/2, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
   }
}
module frames_pyramidBaseAngle(baseType, plateW, plateH, baseHoleSep, baseT, plateT, boltType, boltSize, cornerD, strutT, strutOutside){
   cube([plateW, plateT, plateH+baseT]);
   
   difference(){
      union(){
         hull(){
            translate([-strutT, 0, 0])cube([strutT, plateT, plateH+baseT]);
            translate([-strutT, 0, 0])cube([strutT, baseHoleSep+cornerD, baseT]);
            if(strutOutside){
               translate([-strutT-cornerD, cornerD, 0])cube([cornerD, baseHoleSep-cornerD, baseT]);
            }
         }
         hull(){
            translate([plateW, 0, 0])cube([strutT, plateT, plateH+baseT]);
            translate([plateW, 0, 0])cube([strutT, baseHoleSep+cornerD, baseT]);
            if(strutOutside){
               translate([plateW+strutT, cornerD, 0])cube([cornerD, baseHoleSep-cornerD, baseT]);
            }
         }
         hull(){
            translate([-cornerD/2-strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
            translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, 0])cylinder(d = cornerD, h = baseT);
         }
      }
      translate([-cornerD/2-strutT, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2+strutT, cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([-cornerD/2-strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
      translate([plateW+cornerD/2+strutT, baseHoleSep+cornerD/2, baseT+0.001])BoltInHoleFromNormal(boltType, boltSize, baseT+0.002, plateH, silent = true);
   }
}
echo(str(SCREWS_SYSTEM_MODE, " Frames system loaded, this is an optional additional section. To create a minimalised strut, use 'minimalBridge()' for example 'minimalBridge(3, d = 5, h = 3, sep = 20)'\n To create a frame, use 'frames_base()' 'frames_base2()' or 'frames_baseAngle()'\n The styles available are: 'frames_flatBase' 'frames_roundedBase' 'frames_hullBase' 'frames_pyramidBase' 'frames_sphericalBase' 'frames_inverseCurve' 'frames_bridgeBase'\nThe tops available for frames_base2 include: 'framesTop_square' 'framesTop_cylindrical' 'framesTop_crossCylinder1' 'framesTop_crossCylinder2'\n"));




