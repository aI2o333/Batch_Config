=>Fitting start from Tue Oct 28 00:06:42 2025
=>This project aims to ::
  pseudo fit 2g
=>1) Project pool is 
  "/share/home/symei/comp/pp-fit/optuna_rms/br-all-10/fmin_rms-o10/br-fitting"
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
  1.40989920E+01  1.61346800E-01  2.59424826E+01  4.83773440E-01
=>Optimization Algorithm employed is batch
=>Pseudopotential fitting mod is angm
  Revised basis dir :/share/home/symei/TZVPP-10-o-all/Br.json
=>Testing parameters in this round
  1.40989920E+01  1.61346800E-01  2.59424826E+01  4.83773440E-01
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
=>The SCF energy              :    -415.90333750
=>The (R)-xDH Energy          :    -414.77034829
=>Error :: AI Correction result was not found in br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -831.88199605
=>The (R)-xDH Energy          :    -829.63662391
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
=>The SCF energy              :    -455.87403491
=>The (R)-xDH Energy          :    -454.64654179
=>Error :: AI Correction result was not found in ch3br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -871.19564855
=>The (R)-xDH Energy          :    -868.86070426
=>Error :: AI Correction result was not found in ch2br2
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1286.50506283
=>The (R)-xDH Energy          :   -1283.06163529
=>Error :: AI Correction result was not found in chbr3
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1701.80263420
=>The (R)-xDH Energy          :   -1697.24962977
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
=>The SCF energy              :    -651.31233745
=>The (R)-xDH Energy          :    -649.55605102
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
=>The SCF energy              :    -534.53316891
=>The (R)-xDH Energy          :    -533.08904465
=>Error :: AI Correction result was not found in cccbr1
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -416.54208167
=>The (R)-xDH Energy          :    -415.42723525
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
=>The SCF energy              :    -910.53631332
=>The (R)-xDH Energy          :    -908.09432645
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
=>The SCF energy              :    -949.86594844
=>The (R)-xDH Energy          :    -947.31801962
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
=>The SCF energy              :    -989.19958615
=>The (R)-xDH Energy          :    -986.54375575
=>Error :: AI Correction result was not found in c-cbrcbr-c
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -578.32348216
=>The (R)-xDH Energy          :    -576.90786858
=>Error :: AI Correction result was not found in nabr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -876.15385403
=>The (R)-xDH Energy          :    -874.54773790
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
=>The SCF energy              :    -491.74664182
=>The (R)-xDH Energy          :    -490.44701738
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
=>The SCF energy              :   -1589.23647433
=>The (R)-xDH Energy          :   -1585.47636520
=>Error :: AI Correction result was not found in pbr3
=>AI Correction               :              NAN
=>Batch corresponds to these parameters ::
  1.40989920E+01  1.61346800E-01  2.59424826E+01  4.83773440E-01
==----------------------------------------------------------------------------==
=>        AD =       2.73298754;        wAD =       2.73298754
=>       MAD =       5.46420686;       wMAD =       5.46420686
=>       RMS =       6.26717093;       wRMS =       6.26717093
==----------------------------------------------------------------------------==
=>Statistic result of energy :
==----------------------------------------------------------------------------==
                        Name       Reference    Calc. Result    Deviation Weight
--------------------------------------------------------------------------------
                1*2th->2*1th     49.53741130     60.19535402        10.66   1.00
      1*3th+1*2th->1*4th+...     -7.52038130    -11.78020187        -4.26   1.00
      1*4th+1*2th->1*5th+...     -5.58537376     -2.99561332         2.59   1.00
      1*5th+1*2th->1*6th+...     -2.84437074      5.30724602         8.15   1.00
      1*6th+1*2th->1*7th+...      0.92445978     13.42505869        12.50   1.00
      1*8th+1*2th->1*9th+...    -14.35532087    -17.46386949        -3.11   1.00
      1*10th+1*2th->1*11t...    -11.26635075    -14.72630202        -3.46   1.00
      1*2th+1*23th->1*12t...     26.00499984     30.95414304         4.95   1.00
        1*13th+1*2th->1*14th    -34.24793895    -36.64855131        -2.40   1.00
        1*15th+1*2th->1*16th    -32.18526018    -35.93782846        -3.75   1.00
        1*17th+1*2th->1*18th    -34.66754848    -38.17019227        -3.50   1.00
         1*12th->1*1th+1*0th     93.13507599     99.18931017         6.05   1.00
        1*20th->1*1th+1*21th     52.86891931     55.87906413         3.01   1.00
        1*19th->1*1th+1*22th     86.80595221     96.04177435         9.24   1.00
        1*25th+3*1th->1*26th   -192.29949008   -187.96979526         4.33   1.00
--------------------------------------------------------------------------------
        AD =         2.73298754
       MAD =         5.46420686
       RMS =         1.61817657
       wAD =         2.73298754
      wMAD =         5.46420686
      wRMS =         1.61817657
==----------------------------------------------------------------------------==
=>Total job time:     188.61(wall)
=>Fitting end at Tue Oct 28 00:09:51 2025
=>----------------------------------------------------------------------------==
  #Filename:  DFT_Fit
  #Author  :  Igor Ying Zhang, Xin Xu
  #Version :  0.3(20100731)
  #Purpose :  DFT optimization using several algorithms
