=>Fitting start from Wed Nov  5 22:03:05 2025
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
  3.05753454E+02  1.67089483E+01 -4.41810419E+00  1.22700246E+02  2.26207289E+01
  1.23016909E+02  2.91936662E-01  8.95138841E-02  4.66368585E+00 -2.16297961E-01
 -3.49949162E+00  2.89559239E+01  4.40644384E+01  1.78983166E+01  4.10941584E+01
  1.46205420E+01  2.41863869E+01  1.90869541E+01  3.12832408E-01  9.41573559E+01
  3.78486170E-01  4.12808470E+01
=>Optimization Algorithm employed is batch
=>Pseudopotential fitting mod is all
  Revised basis dir :/share/home/symei/basis/br/TZVPP-10-o-all/Br.json
=>Testing parameters in this round
  3.05753454E+02  1.67089483E+01 -4.41810419E+00  1.22700246E+02  2.26207289E+01
  1.23016909E+02  2.91936662E-01  8.95138841E-02  4.66368585E+00 -2.16297961E-01
 -3.49949162E+00  2.89559239E+01  4.40644384E+01  1.78983166E+01  4.10941584E+01
  1.46205420E+01  2.41863869E+01  1.90869541E+01  3.12832408E-01  9.41573559E+01
  3.78486170E-01  4.12808470E+01
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
=>The SCF energy              :    -416.71940435
=>The (R)-xDH Energy          :    -416.04237775
=>Error :: AI Correction result was not found in br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -833.51595132
=>The (R)-xDH Energy          :    -832.16274363
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
=>The SCF energy              :    -456.69319640
=>The (R)-xDH Energy          :    -455.90391692
=>Error :: AI Correction result was not found in ch3br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -872.84653849
=>The (R)-xDH Energy          :    -871.38888370
=>Error :: AI Correction result was not found in ch2br2
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1288.99665115
=>The (R)-xDH Energy          :   -1286.87151779
=>Error :: AI Correction result was not found in chbr3
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :   -1705.14119486
=>The (R)-xDH Energy          :   -1702.35024127
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
=>The SCF energy              :    -652.13648918
=>The (R)-xDH Energy          :    -650.81745313
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
=>The SCF energy              :    -535.35535943
=>The (R)-xDH Energy          :    -534.34876587
=>Error :: AI Correction result was not found in cccbr1
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -417.36459555
=>The (R)-xDH Energy          :    -416.68665178
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
=>The SCF energy              :    -912.18493423
=>The (R)-xDH Energy          :    -910.61873759
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
=>The SCF energy              :    -951.51374251
=>The (R)-xDH Energy          :    -949.84181794
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
=>The SCF energy              :    -990.84819569
=>The (R)-xDH Energy          :    -989.06885704
=>Error :: AI Correction result was not found in c-cbrcbr-c
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -579.13881386
=>The (R)-xDH Energy          :    -578.15904690
=>Error :: AI Correction result was not found in nabr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -876.96999896
=>The (R)-xDH Energy          :    -875.81497604
=>Error :: AI Correction result was not found in brcl
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -460.16702572
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
=>The SCF energy              :    -492.57344308
=>The (R)-xDH Energy          :    -491.72118976
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
=>The SCF energy              :   -1591.73951176
=>The (R)-xDH Energy          :   -1589.29924502
=>Error :: AI Correction result was not found in pbr3
=>AI Correction               :              NAN
=>Batch corresponds to these parameters ::
  3.05753454E+02  1.67089483E+01 -4.41810419E+00  1.22700246E+02  2.26207289E+01
  1.23016909E+02  2.91936662E-01  8.95138841E-02  4.66368585E+00 -2.16297961E-01
 -3.49949162E+00  2.89559239E+01  4.40644384E+01  1.78983166E+01  4.10941584E+01
  1.46205420E+01  2.41863869E+01  1.90869541E+01  3.12832408E-01  9.41573559E+01
  3.78486170E-01  4.12808470E+01
==----------------------------------------------------------------------------==
=>        AD =      -0.90332954;        wAD =      -0.90332954
=>       MAD =       1.31436957;       wMAD =       1.31436957
=>       RMS =       1.74358682;       wRMS =       1.74358682
==----------------------------------------------------------------------------==
=>Statistic result of energy :
==----------------------------------------------------------------------------==
                        Name       Reference    Calc. Result    Deviation Weight
--------------------------------------------------------------------------------
                1*2th->2*1th     49.53741130     48.93832895        -0.60   1.00
      1*3th+1*2th->1*4th+...     -7.52038130     -5.92675866         1.59   1.00
      1*4th+1*2th->1*5th+...     -5.58537376     -5.56910977         0.02   1.00
      1*5th+1*2th->1*6th+...     -2.84437074     -4.10532774        -1.26   1.00
      1*6th+1*2th->1*7th+...      0.92445978     -1.65137364        -2.58   1.00
      1*8th+1*2th->1*9th+...    -14.35532087    -14.13739110         0.22   1.00
      1*10th+1*2th->1*11t...    -11.26635075    -10.34505048         0.92   1.00
      1*2th+1*23th->1*12t...     26.00499984     26.26714434         0.26   1.00
        1*13th+1*2th->1*14th    -34.24793895    -35.57640153        -1.33   1.00
        1*15th+1*2th->1*16th    -32.18526018    -34.48112530        -2.30   1.00
        1*17th+1*2th->1*18th    -34.66754848    -37.53111375        -2.86   1.00
         1*12th->1*1th+1*0th     93.13507599     91.27457573        -1.86   1.00
        1*20th->1*1th+1*21th     52.86891931     52.87246643         0.00   1.00
        1*19th->1*1th+1*22th     86.80595221     82.95747486        -3.85   1.00
        1*25th+3*1th->1*26th   -192.29949008   -192.23149811         0.07   1.00
--------------------------------------------------------------------------------
        AD =        -0.90332954
       MAD =         1.31436957
       RMS =         0.45019218
       wAD =        -0.90332954
      wMAD =         1.31436957
      wRMS =         0.45019218
==----------------------------------------------------------------------------==
=>Total job time:     242.08(wall)
=>Fitting end at Wed Nov  5 22:07:07 2025
=>----------------------------------------------------------------------------==
  #Filename:  DFT_Fit
  #Author  :  Igor Ying Zhang, Xin Xu
  #Version :  0.3(20100731)
  #Purpose :  DFT optimization using several algorithms
