Clear["Global`*"]

g = 9.8;
k = 0.1;
m = 0.02;
L0 = 1;
tm = 500;(*--*)
xinitial = {0, 0.5};
yinitial = {-L0, 0};

equs = {
   m x''[t] == -k x[t] (1 - L0/Sqrt[x[t]^2 + y[t]^2]),
   m y''[t] == k y[t] (-1 + L0/Sqrt[x[t]^2 + y[t]^2]) - m g,
   x[0] == xinitial[[1]], x'[0] == xinitial[[2]],
   y[0] == yinitial[[1]], y'[0] == yinitial[[2]]
   };
s = NDSolve[equs, {x, y}, {t, 0, tm}];
{x, y} = {x, y} /. s[[1]];

Manipulate[
 ParametricPlot[{x[t], y[t]}, {t, 0, tt}, 
  PlotRange -> {{-0.5, 0.5}, {-5, 0.5}}, AspectRatio -> 0.5], {tt, 
  0.0001, tm}]
Manipulate[
 Show[{Graphics[{Disk[{x[tt], y[tt]}, 0.03], {Dashed, 
      Line[{{0, 0}, {x[tt], y[tt]}}]}}, 
    PlotRange -> {{-0.5, 0.5}, {-5, 0.5}}, AspectRatio -> Automatic], 
   ParametricPlot[{x[t], y[t]}, {t, 0, tt}, 
    PlotRange -> {{-0.5, 0.5}, {-5, 0.5}}, 
    AspectRatio -> Automatic]}], {tt, 0.0001, tm}]
