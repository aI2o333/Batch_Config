=>Fitting start from Tue Oct 21 11:01:02 2025
=>This project aims to ::
  pseudo fit 3g
=>1) Project pool is 
  "/share/home/symei/comp/pp-fit/fmin_rms/br-new-mixed/br-fitting"
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
    3   25 -1.0    1 -3.0   26  1.0             -192.29949010    1.00
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
  3.71525637E+01 -7.78954011E+00  1.79697876E+00  1.17208101E+00
=>Optimization Algorithm employed is batch
=>Pseudopotential fitting mod is angm
  Revised basis dir :/share/home/symei/def2-TZVPP-new-mixed/Br.json
=>Testing parameters in this round
  3.71525637E+01 -7.78954011E+00  1.79697876E+00  1.17208101E+00
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
=>The SCF energy              :     -14.01826301
=>The (R)-xDH Energy          :     -13.98197776
=>Error :: AI Correction result was not found in br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -28.11086031
=>The (R)-xDH Energy          :     -28.04014077
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
=>The SCF energy              :     -53.99209741
=>The (R)-xDH Energy          :     -53.84204362
=>Error :: AI Correction result was not found in ch3br
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -67.44433130
=>The (R)-xDH Energy          :     -67.26492808
=>Error :: AI Correction result was not found in ch2br2
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -80.89279290
=>The (R)-xDH Energy          :     -80.68494539
=>Error :: AI Correction result was not found in chbr3
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -94.33476970
=>The (R)-xDH Energy          :     -94.10017472
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
=>The SCF energy              :    -249.43424147
=>The (R)-xDH Energy          :    -248.75337193
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
=>The SCF energy              :    -132.65369063
=>The (R)-xDH Energy          :    -132.28583043
=>Error :: AI Correction result was not found in cccbr1
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :     -14.66567430
=>The (R)-xDH Energy          :     -14.62691141
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
=>The SCF energy              :    -106.78190147
=>The (R)-xDH Energy          :    -106.49355248
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
=>The SCF energy              :    -146.11001145
=>The (R)-xDH Energy          :    -145.71493771
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
=>The SCF energy              :    -185.44395541
=>The (R)-xDH Energy          :    -184.94109441
=>Error :: AI Correction result was not found in c-cbrcbr-c
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -176.44032129
=>The (R)-xDH Energy          :    -176.10064411
=>Error :: AI Correction result was not found in nabr
=>AI Correction               :              NAN
=>The direction of basis set is required
=>Basis set dir: 
=>This is a batch job for energy calculation
=>The SCF energy              :    -474.26751805
=>The (R)-xDH Energy          :    -473.75382825
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
=>The SCF energy              :     -89.86932123
=>The (R)-xDH Energy          :     -89.65775722
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
=>The SCF energy              :    -383.64231002
=>The (R)-xDH Energy          :    -383.12151531
=>Error :: AI Correction result was not found in pbr3
=>AI Correction               :              NAN
=>Batch corresponds to these parameters ::
  3.71525637E+01 -7.78954011E+00  1.79697876E+00  1.17208101E+00
==----------------------------------------------------------------------------==
=>        AD =      -0.52123285;        wAD =      -0.52123285
=>       MAD =       1.13415867;       wMAD =       1.13415867
=>       RMS =       1.34347435;       wRMS =       1.34347435
==----------------------------------------------------------------------------==
=>Statistic result of energy :
==----------------------------------------------------------------------------==
                        Name       Reference    Calc. Result    Deviation Weight
--------------------------------------------------------------------------------
                1*2th->2*1th     49.53741130     47.80700165        -1.73   1.00
      1*3th+1*2th->1*4th+...     -7.52038130     -6.54747680         0.97   1.00
      1*4th+1*2th->1*5th+...     -5.58537376     -6.05867149        -0.47   1.00
      1*5th+1*2th->1*6th+...     -2.84437074     -4.25950487        -1.42   1.00
      1*6th+1*2th->1*7th+...      0.92445978     -1.25500193        -2.18   1.00
      1*8th+1*2th->1*9th+...    -14.35532087    -13.37263073         0.98   1.00
      1*10th+1*2th->1*11t...    -11.26635075    -10.29926923         0.97   1.00
      1*2th+1*23th->1*12t...     26.00499984     26.62486413         0.62   1.00
        1*13th+1*2th->1*14th    -34.24793895    -33.95601075         0.29   1.00
        1*15th+1*2th->1*16th    -32.18526018    -31.79702991         0.39   1.00
        1*17th+1*2th->1*18th    -34.66754848    -34.29330372         0.37   1.00
         1*12th->1*1th+1*0th     93.13507599     91.68848955        -1.45   1.00
        1*20th->1*1th+1*21th     52.86891931     52.40321220        -0.47   1.00
        1*19th->1*1th+1*22th     86.80595221     84.21073118        -2.60   1.00
        1*25th+3*1th->1*26th   -192.29949010   -194.40910873        -2.11   1.00
--------------------------------------------------------------------------------
        AD =        -0.52123285
       MAD =         1.13415867
       RMS =         0.34688359
       wAD =        -0.52123285
      wMAD =         1.13415867
      wRMS =         0.34688359
==----------------------------------------------------------------------------==
=>Total job time:     340.74(wall)
=>Fitting end at Tue Oct 21 11:06:42 2025
=>----------------------------------------------------------------------------==
  #Filename:  DFT_Fit
  #Author  :  Igor Ying Zhang, Xin Xu
  #Version :  0.3(20100731)
  #Purpose :  DFT optimization using several algorithms
