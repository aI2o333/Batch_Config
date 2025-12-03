=>Fitting start from Fri Oct 31 10:58:47 2025
=>This project aims to ::
  pseudo fit 2g
=>1) Project pool is 
  "/share/home/symei/comp/pp-fit/optuna_rms/br-all-10/br-fitting"
=>2) Project batch type is "0" which to run all the jobs
=>3) QC package employed is "rest"
=>There are 1 <Macro-Path>s specified in br-fitting.ctl :
  Macro-Path :   <PATH1> = /share/home/symei/comp/ae-data
=>Loaded ConfigIO.BatcList :
==----------------------------------------------------------------------------==
Index        Name                        Direction    JobInput         JobType
--------------------------------------------------------------------------------
  0th           h  /share/home/symei/comp/ae-da...           h      energy|xdh
  1th          br  /share/home/symei/comp/ae-da...          br      energy|xdh
  2th         br2  /share/home/symei/comp/ae-da...         br2      energy|xdh
  3th         ch4  /share/home/symei/comp/ae-da...         ch4      energy|xdh
  4th       ch3br  /share/home/symei/comp/ae-da...       ch3br      energy|xdh
  5th      ch2br2  /share/home/symei/comp/ae-da...      ch2br2      energy|xdh
  6th       chbr3  /share/home/symei/comp/ae-da...       chbr3      energy|xdh
  7th        cbr4  /share/home/symei/comp/ae-da...        cbr4      energy|xdh
  8th     ring-c6  /share/home/symei/comp/ae-da...     ring-c6      energy|xdh
  9th  ring-c6br1  /share/home/symei/comp/ae-da...  ring-c6br1      energy|xdh
 10th         ccc  /share/home/symei/comp/ae-da...         ccc      energy|xdh
 11th      cccbr1  /share/home/symei/comp/ae-da...      cccbr1      energy|xdh
 12th         hbr  /share/home/symei/comp/ae-da...         hbr      energy|xdh
 13th         c=c  /share/home/symei/comp/ae-da...         c=c      energy|xdh
 14th      cbrcbr  /share/home/symei/comp/ae-da...      cbrcbr      energy|xdh
 15th        cc=c  /share/home/symei/comp/ae-da...        cc=c      energy|xdh
 16th    c-cbrcbr  /share/home/symei/comp/ae-da...    c-cbrcbr      energy|xdh
 17th       cc=cc  /share/home/symei/comp/ae-da...       cc=cc      energy|xdh
 18th  c-cbrcbr-c  /share/home/symei/comp/ae-da...  c-cbrcbr-c      energy|xdh
 19th        nabr  /share/home/symei/comp/ae-da...        nabr      energy|xdh
 20th        brcl  /share/home/symei/comp/ae-da...        brcl      energy|xdh
 21th          cl  /share/home/symei/comp/ae-da...          cl      energy|xdh
 22th          na  /share/home/symei/comp/ae-da...          na      energy|xdh
 23th         h2o  /share/home/symei/comp/ae-da...         h2o      energy|xdh
 24th        hobr  /share/home/symei/comp/ae-da...        hobr      energy|xdh
 25th           p  /share/home/symei/comp/ae-da...           p      energy|xdh
 26th        pbr3  /share/home/symei/comp/ae-da...        pbr3      energy|xdh
==----------------------------------------------------------------------------==
=>Loaded ConfigIO.EngyList :
==----------------------------------------------------------------------------==
 Num. Ind. Sca. Ind. Sca. Ind. Sca. Ind. Sca.       Ref. Data  Weight
--------------------------------------------------------------------------------
    2    2 -1.0    1  2.0                         49.53741130    1.00
    4    3 -1.0    2 -1.0    4  1.0   12  1.0     -7.52038130    1.00
    4    4 -1.0    2 -1.0    5  1.0   12  1.0     -5.58537376    1.00
    4    5 -1.0    2 -1.0    6  1.0   12  1.0     -2.84437074    1.00
    4    6 -1.0    2 -1.0    7  1.0   12  1.0      0.92445978    1.00
    4    8 -1.0    2 -1.0    9  1.0   12  1.0    -14.35532087    1.00
    4   10 -1.0    2 -1.0   11  1.0   12  1.0    -11.26635075    1.00
    4    2 -1.0   23 -1.0   12  1.0   24  1.0     26.00499984    1.00
    3   13 -1.0    2 -1.0   14  1.0              -34.24793895    1.00
    3   15 -1.0    2 -1.0   16  1.0              -32.18526018    1.00
    3   17 -1.0    2 -1.0   18  1.0              -34.66754848    1.00
    3   12 -1.0    1  1.0    0  1.0               93.13507599    1.00
    3   20 -1.0    1  1.0   21  1.0               52.86891931    1.00
    3   19 -1.0    1  1.0   22  1.0               86.80595221    1.00
    3   25 -1.0    1 -3.0   26  1.0             -192.29949008    1.00
==----------------------------------------------------------------------------==
=>No first-excitation PT2 data for training
=>No second-excitation PT2 data for training
=>No polar data for training
=>No nmr data for training
=>No geom data for training
=>Optimization job is rest_pseudo
=>This batch runs for rest
=>The batch type is serial
=>Initial Guess
  2.65377302E+02  2.47112315E+01 -9.91773410E+00  8.12700612E+01  2.70653009E+01
  1.85463190E+01  1.39548002E+01  6.09294378E+01
=>Optimization Algorithm employed is batch
=>Pseudopotential fitting mod is angm
  Revised basis dir :/share/home/symei/basis/br/TZVPP-10-o-all/Br.json
=>Testing parameters in this round
  2.65377302E+02  2.47112315E+01 -9.91773410E+00  8.12700612E+01  2.70653009E+01
  1.85463190E+01  1.39548002E+01  6.09294378E+01
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :      -0.50217635
=>The (R)-xDH Energy          :      -0.49881886
=>Error :: AI Correction result was not found in h
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -420.50138532
=>The (R)-xDH Energy          :    -419.80308839
=>Error :: AI Correction result was not found in br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -841.08020095
=>The (R)-xDH Energy          :    -839.68401901
=>Error :: AI Correction result was not found in br2
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -40.53917555
=>The (R)-xDH Energy          :     -40.41838019
=>Error :: AI Correction result was not found in ch4
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -460.47468080
=>The (R)-xDH Energy          :    -459.66391153
=>Error :: AI Correction result was not found in ch3br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -880.41196914
=>The (R)-xDH Energy          :    -878.91123599
=>Error :: AI Correction result was not found in ch2br2
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1300.34774943
=>The (R)-xDH Energy          :   -1298.15787300
=>Error :: AI Correction result was not found in chbr3
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1720.27934430
=>The (R)-xDH Energy          :   -1717.40189643
=>Error :: AI Correction result was not found in cbr4
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -235.97180635
=>The (R)-xDH Energy          :    -235.31883194
=>Error :: AI Correction result was not found in ring-c6
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -655.91916391
=>The (R)-xDH Energy          :    -654.57862252
=>Error :: AI Correction result was not found in ring-c6br1
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -119.19537711
=>The (R)-xDH Energy          :    -118.85618815
=>Error :: AI Correction result was not found in ccc
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -539.13746210
=>The (R)-xDH Energy          :    -538.10937023
=>Error :: AI Correction result was not found in cccbr1
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -421.14603788
=>The (R)-xDH Energy          :    -420.44678884
=>Error :: AI Correction result was not found in hbr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -78.62540448
=>The (R)-xDH Energy          :     -78.39929941
=>Error :: AI Correction result was not found in c=c
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -919.74964278
=>The (R)-xDH Energy          :    -918.14030928
=>Error :: AI Correction result was not found in cbrcbr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -117.96017591
=>The (R)-xDH Energy          :    -117.62412519
=>Error :: AI Correction result was not found in cc=c
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -959.07900349
=>The (R)-xDH Energy          :    -957.36413134
=>Error :: AI Correction result was not found in c-cbrcbr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -157.29178523
=>The (R)-xDH Energy          :    -156.84630382
=>Error :: AI Correction result was not found in cc=cc
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -998.41378898
=>The (R)-xDH Energy          :    -996.59133778
=>Error :: AI Correction result was not found in c-cbrcbr-c
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -582.91579805
=>The (R)-xDH Energy          :    -581.91440132
=>Error :: AI Correction result was not found in nabr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -880.75322228
=>The (R)-xDH Energy          :    -879.57656154
=>Error :: AI Correction result was not found in brcl
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -460.16702573
=>The (R)-xDH Energy          :    -459.68834072
=>Error :: AI Correction result was not found in cl
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -162.29127871
=>The (R)-xDH Energy          :    -161.98446811
=>Error :: AI Correction result was not found in na
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -76.46670518
=>The (R)-xDH Energy          :     -76.28695724
=>Error :: AI Correction result was not found in h2o
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -496.35809960
=>The (R)-xDH Energy          :    -495.48427988
=>Error :: AI Correction result was not found in hobr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -341.28064913
=>The (R)-xDH Energy          :    -340.86577164
=>Error :: AI Correction result was not found in p
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1603.08605676
=>The (R)-xDH Energy          :   -1600.58141186
=>Error :: AI Correction result was not found in pbr3
=>AI Correction               :              NAN
=>Batch corresponds to these parameters ::
  2.65377302E+02  2.47112315E+01 -9.91773410E+00  8.12700612E+01  2.70653009E+01
  1.85463190E+01  1.39548002E+01  6.09294378E+01
==----------------------------------------------------------------------------==
=>        AD =      -1.58631937;        wAD =      -1.58631937
=>       MAD =       2.16828175;       wMAD =       2.16828175
=>       RMS =       2.90385905;       wRMS =       2.90385905
==----------------------------------------------------------------------------==
=>Statistic result of energy :
==----------------------------------------------------------------------------==
                        Name       Reference    Calc. Result    Deviation Weight
--------------------------------------------------------------------------------
                1*2th->2*1th     49.53741130     48.84678252        -0.69   1.00
      1*3th+1*2th->1*4th+...     -7.52038130     -5.20906857         2.31   1.00
      1*4th+1*2th->1*5th+...     -5.58537376     -6.33426660        -0.75   1.00
      1*5th+1*2th->1*6th+...     -2.84437074     -5.90288705        -3.06   1.00
      1*6th+1*2th->1*7th+...      0.92445978     -4.26284065        -5.19   1.00
      1*8th+1*2th->1*9th+...    -14.35532087    -14.15688765         0.20   1.00
      1*10th+1*2th->1*11t...    -11.26635075    -10.00998555         1.26   1.00
      1*2th+1*23th->1*12t...     26.00499984     25.04237773        -0.96   1.00
        1*13th+1*2th->1*14th    -34.24793895    -35.76233945        -1.51   1.00
        1*15th+1*2th->1*16th    -32.18526018    -35.13248903        -2.95   1.00
        1*17th+1*2th->1*18th    -34.66754848    -38.28748688        -3.62   1.00
         1*12th->1*1th+1*0th     93.13507599     90.91465081        -2.22   1.00
        1*20th->1*1th+1*21th     52.86891931     53.42145146         0.55   1.00
        1*19th->1*1th+1*22th     86.80595221     79.59639720        -7.21   1.00
        1*25th+3*1th->1*26th   -192.29949008   -192.25341553         0.05   1.00
--------------------------------------------------------------------------------
        AD =        -1.58631937
       MAD =         2.16828175
       RMS =         0.74977318
       wAD =        -1.58631937
      wMAD =         2.16828175
      wRMS =         0.74977318
==----------------------------------------------------------------------------==
=>Total job time:     245.76(wall)
=>Fitting end at Fri Oct 31 11:02:53 2025
=>----------------------------------------------------------------------------==
  #Filename:  DFT_Fit
  #Author  :  Igor Ying Zhang, Xin Xu
  #Version :  0.3(20100731)
  #Purpose :  DFT optimization using several algorithms
