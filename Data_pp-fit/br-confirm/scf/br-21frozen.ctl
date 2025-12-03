# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./br-21frozen       2                REST
# The project description
__Title__ :: 
pseudo FIT

"=========================== new added part ==========================="

# "There are several algorithms at present:                                  "
# "   0) batch           :: just batch the results based on intital guess    "
# "   1) leastsq         :: least square fit algorithm                       "
# "   2) fmin_rms        :: downhill simplex algorithm based on RMS          "
# "   3) fmin_mad        :: downhill simplex algorithm based on MAD          "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: batch

__optimization job__ :: rest_pseudo
"============================== ACONF set ============================="
"             This is br-series subset from ae-data                        "

# several global statements of ctrl.in for REST Package
#__rest_batch_type__ :: <1> <2> <3> <4>
#    <1>: serial or queue;
#    <2>: the command for submitting jobs
#    <3>: the script for submitting jobs
#    <4>: the queue name for running jobs
#    For serial, only parameters <1> and <3> are needed.
__rest_batch_type__ :: serial rest_runscr_xhpc1 
#__rest_batch_type__ :: queue bsub rest_runscr_xhpc1 small
#__rest_ :: <1> <2>
#    <1>: thread number
#    <2>: rest cmd name
__rest__ ::  4  rest.avx512 #核数 调用rest版本
     xc =                        "xygjos" 
     frozen_core_postscf =       21
     basis_path =                "/home/symei/def2-TZVPP" # For serial type, path in your container shouldbe used
     auxbas_path =               "/home/symei/def2-SV(P)-JKFIT"# refer to option "bind" in "REST_Environment"
     even_tempered_basis =       false
     etb_start_atom_number =     1
     etb_beta =                  1.0
     initial_guess =             "sad"
#     chkfile =                   "restart"
     chkfile_type =              "hdf5"
     fchk =                      false
     pruning =                   "nwchem"
     radial_grid_method =        "treutler"
     print_level =               3
end rest

# the highest calculated angular momentum
# Please write according to the index of l, the 1st line corresponding to l=0, 2nd line to l=1, etc.
# "PType" = "Coeff" : To fit the parameters of the coefficients of ECP.
           "Gexp" : To fit the exponents of ECP.
#                       "PType"       "AngMom"
__pseudo_property__  ::   Coeff          0
__initial guess__ ::
# For pseudo fitting, initial_guess can be coefficients or exponents
# but the lengths of coefficients and exponents belongs to one angular momentum must be the same.
# 49.99429300    281.02531700   61.57332600   21.84204000   28.46819100    0.24371300   0.32080400
49.99429300    281.02531700   61.57332600   11.4514000   28.46819100    0.24371300   0.32080400
end

#Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/share/home/symei/comp/ae-data' 
#化合物的路径

# The molecular set to batch:
#                17 is the total number of jobs in this batch list
__batch__ ::    27   #这个数字算的东西不一样要改
#"Flag"         "DIR"                        "InpName"       "JobType
              h    <PATH1>/br-simu                    h           energy|scf
             br    <PATH1>/br-simu                   br           energy|scf
            br2    <PATH1>/br-simu                  br2           energy|scf
            ch4    <PATH1>/br-simu                  ch4           energy|scf
          ch3br    <PATH1>/br-simu                ch3br           energy|scf
         ch2br2    <PATH1>/br-simu               ch2br2           energy|scf
          chbr3    <PATH1>/br-simu                chbr3           energy|scf
           cbr4    <PATH1>/br-simu                 cbr4           energy|scf
        ring-c6    <PATH1>/br-simu              ring-c6           energy|scf
     ring-c6br1    <PATH1>/br-simu           ring-c6br1           energy|scf
            ccc    <PATH1>/br-simu                  ccc           energy|scf
         cccbr1    <PATH1>/br-simu               cccbr1           energy|scf
            hbr    <PATH1>/br-simu                  hbr           energy|scf
            c=c    <PATH1>/br-simu                  c=c           energy|scf
         cbrcbr    <PATH1>/br-simu               cbrcbr           energy|scf
           cc=c    <PATH1>/br-simu                 cc=c           energy|scf
       c-cbrcbr    <PATH1>/br-simu             c-cbrcbr           energy|scf
          cc=cc    <PATH1>/br-simu                cc=cc           energy|scf
     c-cbrcbr-c    <PATH1>/br-simu           c-cbrcbr-c           energy|scf
           nabr    <PATH1>/br-simu                 nabr           energy|scf
           brcl    <PATH1>/br-simu                 brcl           energy|scf
             cl    <PATH1>/br-simu                   cl           energy|scf
             na    <PATH1>/br-simu                   na           energy|scf
            h2o    <PATH1>/br-simu                  h2o           energy|scf
           hobr    <PATH1>/br-simu                 hobr           energy|scf
              p    <PATH1>/br-simu                    p           energy|scf
           pbr3    <PATH1>/br-simu                 pbr3           energy|scf

#"Jobtype"列不影响实际计算，影响输出呈现
# Training set for the atomization energy
#                15 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol",
__energy__ ::    15  627.51 #“15”如果reference变了也要改
2    br2       -1     br       2      0    1.000
4    ch4       -1     br2     -1      ch3br           1      hbr      1      0.000      1.000
4    ch3br     -1     br2     -1      ch2br2          1      hbr      1      0.000      1.000
4    ch2br2    -1     br2     -1      chbr3           1      hbr      1      0.000      1.000
4    chbr3     -1     br2     -1      cbr4            1      hbr      1      0.000      1.000
4    ring-c6   -1     br2     -1      ring-c6br1      1      hbr      1      0.000      1.000
4    ccc       -1     br2     -1      cccbr1          1      hbr      1      0.000      1.000
4    br2       -1     h2o     -1      hbr             1      hobr     1      0.000      1.000
3    c=c       -1     br2     -1      cbrcbr          1        0.000      1.000
3    cc=c      -1     br2     -1      c-cbrcbr        1        0.000      1.000
3    cc=cc     -1     br2     -1      c-cbrcbr-c      1        0.000      1.000
3    hbr       -1     br       1      h               1        0.000      1.000
3    brcl       -1    br       1      cl              1        0.000      1.000
3    nabr       -1    br       1      na              1        0.000      1.000
3    p          -1    br      -3      pbr3            1        0.000      1.000

#第一列物种数量，“-1”代表是反应物且系数为1，倒数第二列能量，最后一列权重
