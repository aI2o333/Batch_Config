# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./br-fitting        0               REST
# The project description
__Title__ :: 
pseudo fit 2g

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
# "   6) optuna_rms      ::
# "   7) optuna_mad      ::
__optimization algorithm__ :: optuna_rms 
# "There are several job types in support at present:
# " xyg3/xmp2/scpt2/scsrpa/rest_pseudo "
__optimization job__ :: rest_pseudo

"=========================== optuna option ============================"
#     "Optuna Option" = "simple" : multivariate=False,group=False,
#                     = "multi"  : multivariate=True ,group=False,
#                     = "group"  : multivariate=True ,group=True,
__optuna_option__ :: group
__shrink_factor__ :: 0.6
__n_trials__ :: 2
__n_startup_trials__ ::1

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
__rest__ ::  4   #核数 调用rest版本
     xc =                        "xygjos" 
     frozen_core_postscf =        0 
     basis_path =                "/home/symei/TZVPP-debug" # For serial type, path in your container should be used
     auxbas_path =               "/home/symei/def2-SV(P)-JKFIT"# refer to option "bind" in "REST_Environment"
     even_tempered_basis =       false
     etb_start_atom_number =     1
     etb_beta =                  1.0
     initial_guess =             "sad"
     chkfile_type =              "hdf5"
     fchk =                      false
     pruning =                   "nwchem"
     radial_grid_method =        "treutler"
     scf_acc_rho =               1.0e-8
     scf_acc_eev =               1.0e-8
     max_scf_cycle =             250
end rest


"=========================== pseudo part ==========================="

# "There are several mods at present:                                  "
# "  0) AngMom  :: fit coeff and exp of same angular momentum together "
# "  1) PType   :: fit all the coeff(or all the exp) together          "
# "  2) mixed   :: fit parameters of typical angular momentum and type "
# "  3) all     :: fit all the parameters at the same time             "
__pseudo_mod__  :: all
# Even though you don't need that parameter, you should type something 
# "PType" = "Coeff" : To fit the parameters of the coefficients of ECP.
            "Gexp"  : To fit the exponents of ECP.
#                       "PType"       "AngMom"
#    mixed example   ::  coeff           2
#   angmom example   ::  NAN            2
#    ptype example   ::  coeff          -114514
__pseudo_property__  ::   gexp          -114
__basis_dir__  ::/share/home/symei/TZVPP-debug/Br.json
__initial guess__ ::
# For pseudo fitting, initial_guess can be coefficients or exponents
# but the lengths of coefficients and exponents belonging to one angular momentum must be the same
# For angmom mod, please type all the coefficients first, then the gexp.
46.81551351
82.26846858
13.66081722
2.686496239
66.22958936
23.19460693
1.392536887
1.642249544
11.15639822
2.403460369
-6.731973866
15.71819651
4.958059223
1.43245898
2.741572597
18.74502795
6.229856815
2.365667578
1.484721669
2.516610423
0.886893481
3.735401057
end

#Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/share/home/symei/comp/ae-data' 
#化合物的路径

# The molecular set to batch:
#                17 is the total number of jobs in this batch list
__batch__ ::    4   #这个数字算的东西不一样要改
#"Flag"         "DIR"                        "InpName"       "JobType
              h    <PATH1>/br-simu                    h           energy|xdh
             br    <PATH1>/br-simu                   br           energy|xdh
            br2    <PATH1>/br-simu                  br2           energy|xdh
            hbr    <PATH1>/br-simu                  hbr           energy|xdh

#"Jobtype"列不影响实际计算，影响输出呈现
# Training set for the atomization energy
#                15 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol",
__energy__ ::    2  627.51 #“15”如果reference变了也要改
2    br2       -1     br       2                                            49.53741130  1.000
3    hbr       -1     br       1      h               1                     93.13507599  1.000

#第一列物种数量，“-1”代表是反应物且系数为1，倒数第二列能量，最后一列权重
