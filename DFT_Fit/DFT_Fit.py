#!/usr/bin/env python3
#Usage          :: hybrid_parameter_fit.py [AtomList] [MoleList] [AtomCode]
#Purpose        :: To optimize the hybrid parameter in DFT against the specified atomization set
#Authors        :: Igor Ying Zhang, and Xin Xu
__version__     = '0.3(20100731)'
#Interpretation :: to fluctuate the hybrid parameter in XYG3 form like this:
#History        ::  V0.1    1) implement simply DFT parameters optimization based on several complicated 
#                              input files
#                           2) parallel it
#                   V0.2    1) standardize input file by the class of "IGOR_MODULES_PATH/my_io.py/ConfigIO"
#                           2) XYG3 type functionals optimization
#                   V0.3    1) xMP2 optimization combined with Q-Chem package
#                           2) parallel it
#                   V0.4    1) SCMP2 optimization combined with FHI-aims package


__info__	= ['#Filename:  DFT_Fit',
    '#Author  :  Igor Ying Zhang, Xin Xu',
    '#Version :  %s' % __version__,
    '#Purpose :  DFT optimization using several algorithms']
iprint	= 1

import sys
import os
import re
import math
import multiprocessing
import multiprocessing.managers
import scipy.optimize as opt
from numpy          import array
from numpy          import reshape
from numpy          import arange
from numpy          import exp
from numpy          import power
from scipy.special  import erfc
from scipy.special  import erf

def calc_statistic(C,FitClass):
    '''\
    a wrapper for statistic calculations of different optimization jobs\
    '''
    if FitClass.OptJob == 'xyg3':
        return calc_statistic_xyg3(C,FitClass)
    elif FitClass.OptJob == 'xmp2':
        return calc_statistic_xmp2(C,FitClass)
    elif FitClass.OptJob == 'scpt2':
        return calc_statistic_scpt2(C,FitClass)
    elif FitClass.OptJob == 'scsrpa':
        return calc_statistic_scsrpa(C,FitClass)
    elif FitClass.OptJob == 'rest_pseudo':
        return calc_statistic_pseudo(C, FitClass)

def calc_statistic_xyg3(C,FitClass):
    '''\
    return statistic informations for "XYG3" type optimization\
    '''
    from my_io      import print_List 
    from my_io      import print_Error

    from opt_func   import opt_func

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    #for x,y in FitClass.CompDict.iteritems():
    #    print x,y
    FitClass.run_OptCalc(opt_func,C)
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in returning required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def calc_statistic_xmp2(C,FitClass):
    '''\
    return statistic informations for xMP2 type optimization\
    '''
    from my_io      import print_List
    from my_io      import print_Error

    from opt_func   import update_qchem_xmp2 

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    update_qchem_xmp2(C,FitClass)
    FitClass.run_QcmBatch()
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def calc_statistic_scpt2(C,FitClass):
    '''\
    return statistic informations for SCPT2 type optimization\
    '''
    from my_io      import print_List
    from my_io      import print_Error

    from opt_func   import update_aims_scpt2 

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    update_aims_scpt2(C,FitClass)
    FitClass.run_AimBatch()
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    returnresc

def calc_statistic_pseudo(C, FitClass):
    '''\
    return statistic informations for PSEUDO type optimization for REST\
    '''
    from my_io      import print_List  #solve the question of remote connection by revising *python.analysis.extraPaths*
    from my_io      import print_Error
    from my_io      import print_String

    print_List(FitClass.IOut,C,
        4,Info='Initial parameters in this round')

    if FitClass.RescaleStat:
        import rescaling_func as res
        if FitClass.RescaleMod[:4] == 'auto':
            print_String(FitClass.IOut, "Auto rescaling has not complete yet", 1)
        elif FitClass.RescaleMod[:3] == "all" or FitClass.RescaleMod[:4] == "angm":
            for i in range(len(C)):
                if i < len(C)/2:
                    C[i] = res.inverse_func_all(C[i])
                else:
                    C[i] = res.inverse_func_positive(C[i])
        elif FitClass.RescaleMod[:5] == 'coeff':
            for i in range(len(C)):
                C[i] = res.inverse_func_all(C[i])
        elif FitClass.RescaleMod[:4] == 'gexp':
            for i in range(len(C)):
                C[i] = res.inverse_func_positive(C[i])
        elif FitClass.RescaleMod[:6] == 'manual':
            for i in range(len(FitClass.RescalePos)):
                C[FitClass.RescalePos[i]-1] = res.inverse_func_all(C[FitClass.RescalePos[i]-1])

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    
    def generate_ecp(C_array, ptype, AngM, mod, path):
        if mod == 'mixed':
            generate_ecp_mixed(C_array, ptype, AngM, path)
        elif mod == 'ptype':
            generate_ecp_ptype(C_array, ptype, AngM, path)
        elif mod[:4] == 'angm':
            generate_ecp_angm(C_array, ptype, AngM, path)
        elif mod == 'all':
            generate_ecp_all(C_array, ptype, AngM, path)
        elif mod == 'manual':
            generate_ecp_manual(C_array, ptype, AngM, path)
        else:
            print_Error(FitClass.IOut, "Unknown PseudoMod: %s" % mod)
        return
    
    def generate_ecp_mixed(C_array, ptype, AngM, path):

        angular_momentum = [AngM]

        import os
        import json
        
        with open(path, "r") as f:
            data = json.load(f)
            print_String(FitClass.IOut,
                         f"All the angular_momentum values: {[p['angular_momentum'] for p in data['ecp_potentials']]}" ,1)

        for parameter in data['ecp_potentials']:

            if parameter['angular_momentum'] != angular_momentum:
                continue

            if ptype == 'coeff':
                if len(C_array) == len(parameter['coefficients'][0]):   
                    coefficients = [["%.8f" % x for x in C_array]]  # reserve 8 decimal places
                    parameter['coefficients'] = coefficients
                    label = 'coefficients'
                else:
                    print_Error(FitClass.IOut,
                                "Length of C does not match the number of coefficients.")
            elif ptype == 'gexp':
                if len(C_array) == len(parameter['gaussian_exponents']):
                    gexp = ["%.8f" % x for x in C_array]
                    parameter['gaussian_exponents'] = gexp
                    label = 'gaussian_exponents'
                else:
                    print_Error(FitClass.IOut,
                                "Length of C does not match the number of gaussian exponents.")
            else:
                print_Error(FitClass.IOut, "Unknown type: %s" % type)
    
            break
        else:
            print_Error(FitClass.IOut, f"{angular_momentum} not found in the data.")

        with open(path, "w") as f:
            json.dump(data, f, indent=4)
            f.flush()
            os.fsync(f.fileno())  # Ensure data is written to disk
        
        print_String(FitClass.IOut, 
                     f"Pseudo basis {parameter[label]} generate for angular momentum {angular_momentum} with type {type}.", 1)

        return
    
    def generate_ecp_manual(C_array, ptype, AngM, path):

        angular_momentum = [AngM]

        import os
        import json
        
        with open(path, "r") as f:
            data = json.load(f)
            print_String(FitClass.IOut,
                         f"All the angular_momentum values: {[p['angular_momentum'] for p in data['ecp_potentials']]}" ,1)

        if len(C_array) != len(FitClass.CoeffPos) + len(FitClass.GexpPos):
            print_Error(FitClass.IOut,
                        "Length of C does not match the number of parameters.")


        for parameter in data['ecp_potentials']:
            if parameter['angular_momentum'] != angular_momentum:
                continue
  
            coefficients = parameter['coefficients']  
            for i in range(len(FitClass.CoeffPos)):
                coefficients[0][FitClass.CoeffPos[i]-1] = "%.8f" % C_array[i]
            parameter['coefficients'] = coefficients
            
            gexp = parameter['gaussian_exponents']
            for i in range(len(FitClass.GexpPos)):
                gexp[FitClass.GexpPos[i]-1] = "%.8f" % C_array[len(FitClass.CoeffPos)+i]
            parameter['gaussian_exponents'] = gexp
            break


        with open(path, "w") as f:
            json.dump(data, f, indent=4)
            f.flush()
            os.fsync(f.fileno())  # Ensure data is written to disk
        
        print_String(FitClass.IOut, 
                     f"Pseudo basis {parameter['coefficients']} and \
                        {parameter['gaussian_exponents']} generate for angular momentum {AngM}.", 1)

        return

    def generate_ecp_ptype(C_array, ptype, AngM, path):

        import os
        import json
        
        with open(path, "r") as f:
            data = json.load(f)
            print_String(FitClass.IOut,
                         f"All the angular_momentum values: {[p['angular_momentum'] for p in data['ecp_potentials']]}" ,1)

        count = 0

        if ptype == 'coeff':
            label = 'coefficients'
            for parameter in data['ecp_potentials']:
                count += len(parameter['coefficients'][0])
        elif ptype == 'gexp':
            label = 'gaussian_exponents'
            for parameter in data['ecp_potentials']:
                count += len(parameter['gaussian_exponents'])
        else:
            print_Error(FitClass.IOut, "Unknown PseudoType: %s" % ptype)
        
        if len(C_array) != count:
            print_Error(FitClass.IOut,
                        "Length of C does not match the number of parameters.")

        loc_start = 0
        loc_end = 0
        for parameter in data['ecp_potentials']:
            if ptype == 'coeff':
                loc_end = loc_start+len(parameter['coefficients'][0])
                coefficients = [["%.8f" % x for x in C_array[loc_start:loc_end]]]  # reserve 8 decimal places
                parameter['coefficients'] = coefficients
                loc_start = loc_end
            elif ptype == 'gexp':
                loc_end = loc_start+len(parameter['gaussian_exponents'])
                gexp = ["%.8f" % x for x in C_array[loc_start:loc_end]]
                parameter['gaussian_exponents'] = gexp
                loc_start = loc_end
            print_String(FitClass.IOut, 
                    f"Pseudo basis {parameter[label]} generate with type {ptype}.", 1)

        with open(path, "w") as f:
            json.dump(data, f, indent=4)
            f.flush()
            os.fsync(f.fileno())  # Ensure data is written to disk

        return
    
    def generate_ecp_angm(C_array, ptype, AngM, path):

        angular_momentum = [AngM]

        import os
        import json
        
        with open(path, "r") as f:
            data = json.load(f)
            print_String(FitClass.IOut,
                         f"All the angular_momentum values: {[p['angular_momentum'] for p in data['ecp_potentials']]}" ,1)

        count = 0
        for parameter in data['ecp_potentials']:
            if parameter['angular_momentum'] != angular_momentum:
                continue
            count += len(parameter['coefficients'][0])
            count += len(parameter['gaussian_exponents'])
            if count != len(C_array):
                print_Error(FitClass.IOut,
                            f"Length of C does not match the number of basis of {AngM}.")
            break
        
        loc_start = 0
        loc_end = 0
        for parameter in data['ecp_potentials']:
            if parameter['angular_momentum'] != angular_momentum:
                continue

            loc_end = loc_start+len(parameter['coefficients'][0])  
            coefficients = [["%.8f" % x for x in C_array[loc_start:loc_end]]]  # reserve 8 decimal places
            parameter['coefficients'] = coefficients
            loc_start = loc_end
            loc_end = loc_start+len(parameter['gaussian_exponents'])
            gexp = ["%.8f" % x for x in C_array[loc_start:loc_end]]
            parameter['gaussian_exponents'] = gexp
            break


        with open(path, "w") as f:
            json.dump(data, f, indent=4)
            f.flush()
            os.fsync(f.fileno())  # Ensure data is written to disk
        
        print_String(FitClass.IOut, 
                     f"Pseudo basis {parameter['coefficients']} and \
                        {parameter['gaussian_exponents']} generate for angular momentum {AngM}.", 1)

        return

    def generate_ecp_all(C_array, ptype, AngM, path):

        import os
        import json
        
        with open(path, "r") as f:
            data = json.load(f)

        count = 0

        for parameter in data['ecp_potentials']:
            count += len(parameter['coefficients'][0])
        
        if len(C_array) != 2*count:
            print_Error(FitClass.IOut,
                        "Length of C does not match the number of parameters.")

        loc_start = 0
        loc_end = 0
        for parameter in data['ecp_potentials']:
            loc_end = loc_start+len(parameter['coefficients'][0])
            coefficients = [["%.8f" % x for x in C_array[loc_start:loc_end]]]  # reserve 8 decimal places
            parameter['coefficients'] = coefficients
            loc_start = loc_end
            print_String(FitClass.IOut, 
                    f"Pseudo basis {parameter['coefficients']} is generated.", 1)
        
        for parameter in data['ecp_potentials']:
            loc_end = loc_start+len(parameter['gaussian_exponents'])
            gexp = ["%.8f" % x for x in C_array[loc_start:loc_end]]
            parameter['gaussian_exponents'] = gexp
            loc_start = loc_end
            print_String(FitClass.IOut, 
                    f"Pseudo basis {parameter['gaussian_exponents']} is generated.", 1)

        with open(path, "w") as f:
            json.dump(data, f, indent=4)
            f.flush()
            os.fsync(f.fileno())  # Ensure data is written to disk

        return
    
    if FitClass.OptAlgo[:5] != 'batch':
        generate_ecp(C,FitClass.PseudoType,FitClass.AngM,FitClass.PseudoMod,FitClass.WrittenDir)
    #====================================================
    
    if FitClass.OptAlgo[:6] == 'gbasis':
        print_String(FitClass.IOut, 
            'Basis generation is completed.', 1)
        exit(0)

    FitClass.run_RESTBatch()

    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def calc_statistic_scsrpa(C,FitClass):
    '''\
    return statistic informations for SCPT2 type optimization\
    '''
    import time
    from os.path import isdir, abspath, isfile, splitext
    from os import listdir, remove, system
    from my_io import print_List
    from my_io import print_String
    from my_io import print_Error
    from opt_func import update_aims_scsrpa
    import re

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    # Initialize the running folder
    if isdir(FitClass.ProjDir):
        for xFile in listdir(FitClass.ProjDir):
            axFile = '%s/%s' %(FitClass.ProjDir, xFile)
            if isfile(axFile) and xFile[-4:]=='.log':
                remove(axFile)
            if isdir(axFile):
                for yFile in listdir(axFile):
                    ayFile = '%s/%s' %(axFile, yFile)
                    if isfile(ayFile) and\
                       yFile=='RUNNING' or\
                       yFile[-4:]=='.log':
                        remove(ayFile)
    time.sleep(2)
    update_aims_scsrpa(C,FitClass)
    if FitClass.BatchType == 'serial':
        FitClass.run_AimBatch()
    elif FitClass.BatchType == 'queue': 
        # we should not re-run all finished jobs during this check
        tmpProjCtrl = FitClass.ProjCtrl
        FitClass.ProjCtrl = 2
        # we would like to turn of detailed output during the check
        tmpIPrint = FitClass.IPrint
        FitClass.IPrint = 0
        FlagBatch = FitClass.run_AimBatch()
        interval = 0
        while not FlagBatch:
            time.sleep(10)
            #if interval >= 36000:
            if interval >= 200:
                if FitClass.BatchCmd =='bsub':
                    qq = 'bjobs'
                else:
                    qq = 'qstate'
                qn = FitClass.BatchQueueName
                un = 'wenxinz'
                system('bjobs > checkFile')
                cFile = open('checkFile','r')
                tFile = cFile.read()
                cFile.close()
                #WARNNING: dangerous! should be updated by further effort
                tmpString =\
                   '(?P<iters>\d+)\s*%s\s*RUN\s*%s\s*\S*\s*\S*\s*(?P<jobs>\S+)' %(un,qn) 
                p16 = re.compile(tmpString)
                p16p = p16.findall(tFile)
                for (jobi, jobn) in p16p:
                    for job in FitClass.BatcList:
                        fn, fe = splitext(job[2])
                        fR = '%s/%s/RUNNING' %(FitClass.ProjDir,fn)
                        if fn==jobn[-len(fn):] and isfile(fR):
                            remove(fR)
                            xFile = '%s/%s/%s.log' %(FitClass.ProjDir,fn,fn)
                            if isfile(xFile):
                                remove(xFile)
                            xFile = '%s/%s.log' %(FitClass.ProjDir,fn)
                            if isfile(xFile):
                                remove(xFile)
                            os.system('bkill %s' %jobi)
                            print_String(FitClass.IOut, 
                                'Unexpected error for the job of %s' 
                                %fn,1)
                            continue
                interval = 0
            FlagBatch = FitClass.run_AimBatch()
            interval = interval + 10
        FitClass.ProjType = tmpProjCtrl
        FitClass.IPrint = tmpIPrint
        # Print the results when all jobs are finished
        FlagBatch = FitClass.run_AimBatch()
        print_String(FitClass.IOut, 
                'This batch takes %i Seconds' %interval, 
                FitClass.IPrint)
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def run_optimization(FitClass):
    '''\
    run optimization based on FitClass\
    '''
    from my_io      import print_List
    from my_io      import print_String
    from my_io      import print_Error
    from my_io      import print_Matrix_numpy

    if FitClass.OptAlgo == 'leastsq':                                # leastsq algorithm
        plsq    = opt.leastsq(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]))
        tmpresult   = [float(x) for x in plsq[0]]
        #cov_matrix  = plsq[1]
        print_List(FitClass.IOut,tmpresult,
            4,Info='Optimized result by leastsq algorithm')
        #print_Matrix_numpy(FitClass.IOut, cov_matrix, Info='Covariance matrix')
        #print_List(FitClass.IOut,cov_matrix,
        #    4,Info='Error info')
        FitClass.InitGuess  = tmpresult[:]
    elif FitClass.OptAlgo[:6] == 'gbasis':
        plsq    = opt.fmin(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]))
    elif FitClass.OptAlgo[:13] == 'fmin_l_bfgs_b':      
        plsq    = opt.fmin_l_bfgs_b(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]),\
            approx_grad=True)
        print_List(FitClass.IOut,plsq[0],
            4,Info='Optimized result by fmin_l_bfgs_b algorithm')
        FitClass.InitGuess  = plsq[0][:]
    elif FitClass.OptAlgo[:11] == 'fmin_powell':           
        plsq    = opt.fmin_powell(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]),xtol=1e-2,ftol=1e-3)
        print_List(FitClass.IOut,plsq, 
            4,Info='Optimized result by fmin_powell algorithm')
        FitClass.InitGuess  = plsq[:]    
    elif FitClass.OptAlgo[:11] == 'fmin_cobyla':                     # fmin algorithm
        try:
            from opt_func   import opt_func_constrained
        except:
            print_Error(FitClass.IOut,'\"opt_func_constrained\"'+\
                ' is required for \"fmin_cobyla\"')
        interval = 1.0                                               #   Set initial changes
        for i in FitClass.InitGuess:
            if abs(i)<interval:
                interval = abs(i)
            if i == 0.0:
                interval = 1.0
                break
        plsq    = opt.fmin_cobyla(calc_statistic,FitClass.InitGuess,\
            cons=opt_func_constrained,
            args=tuple([FitClass]),rhobeg=interval)
        print_List(FitClass.IOut,plsq,
            4,Info='Optimized result by fmin_cobyla algorithm')
        FitClass.InitGuess  = plsq[:]
    elif FitClass.OptAlgo[:4] == 'fmin':                             # fmin algorithm
        plsq    = opt.fmin(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]),xtol= 1e0,ftol=1e-3)
        print_List(FitClass.IOut,plsq,
            4,Info='Optimized result by fmin algorithm')
        FitClass.InitGuess  = plsq[:]
    elif FitClass.OptAlgo[:5] == 'brute':                            # brute algorithm
        plsq    = opt.brute(calc_statistic,\
                ((-4.,-2.),(-1.,1.),(-4.,-2.),(-1.,1.)),\
            args=(FitClass))
        print_List(FitClass.IOut,plsq,
            4,Info='Optimized result by brute algorithm')
        FitClass.InitGuess  = plsq[:]
    elif FitClass.OptAlgo[:6] == 'anneal':                           # anneal algorithm
        plsq    = opt.anneal(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]),dwell=200,maxiter=2000,lower=0.0,upper=1.0, T0=200.0)
        print_List(FitClass.IOut,plsq[0],
            4,Info='Optimized result by anneal algorithm')
        FitClass.InitGuess  = plsq[0][:]
    elif FitClass.OptAlgo[:6] == 'optuna':                            
        import optuna
        FitClass.get_OptunaInfo()
        FitClass.tmpNT = FitClass.NTrials
        def run_optuna(FitClass):
            # shrink_factor=0.2 means searching area is [0.8*best, 1.2*best]
            sampler_simple = optuna.samplers.TPESampler(
                seed=1,
                n_startup_trials=FitClass.NStartup_trials,
                multivariate=False,
                group=False,
            )
            sampler_group = optuna.samplers.TPESampler(
                seed=1,
                n_startup_trials=FitClass.NStartup_trials,
                multivariate=True,
                group=True,
            )
            sampler_multi = optuna.samplers.TPESampler(
                seed=1,
                n_startup_trials=FitClass.NStartup_trials,
                multivariate=True,
                group=False,
            )

            if FitClass.OptunaOption == 'simple':
                sampler = sampler_simple
            elif FitClass.OptunaOption == 'group':
                sampler = sampler_group
            elif FitClass.OptunaOption == 'multi':
                sampler = sampler_multi
            else:
                print_Error(FitClass.IOut,
                    'Error in return required type of statistic data'+\
                    ' \"run_optuna()->%s\"' % FitClass.OptunaOption)
                
            study = optuna.create_study(direction="minimize", sampler=sampler)

            def objective(trial):
                C = []
                for i in range(len(FitClass.InitGuess)):
                    guess = FitClass.InitGuess[i]
                    if guess > 0:
                        min_val = (1 - FitClass.ShrinkFactor) * guess
                        max_val = (1 + FitClass.ShrinkFactor) * guess
                    else:
                        min_val = (1 + FitClass.ShrinkFactor) * guess
                        max_val = (1 - FitClass.ShrinkFactor) * guess
                    Ci = trial.suggest_float(f"c{i}", low=min_val, high=max_val)
                    C.append(Ci)
                return calc_statistic(C, FitClass)

            study.optimize(objective, n_trials=FitClass.tmpNT)

            try:
                FitClass.InitGuess = [study.best_params[f'c{i}'] for i in range(len(FitClass.InitGuess))]
            except KeyError as e:
                print_String(FitClass.IOut,f"Missing key in best_params: {e}, available keys: {study.best_params.keys()}",1)

            # update the search space based on the best result
            FitClass.InitGuess = [
                study.best_params.get(f'c{i}', FitClass.InitGuess[i])
                for i in range(len(FitClass.InitGuess))
            ]
            rms = study.best_value
            s_factor = FitClass.ShrinkFactor * exp(-(100-rms)/100)
            FitClass.ShrinkFactor = max(s_factor, 0.25)
            FitClass.tmpNT = int(0.125*FitClass.NTrials*(int(rms)+3))
            #FitClass.tmpNT = FitClass.NTrials
            #n_trials = int(FitClass.NTrials * exp(-(40-rms)/40))
            #FitClass.NTrials = max(n_trials, 25)
            n_startup_trials = int(FitClass.tmpNT * 0.15)
            FitClass.NStartup_trials = max(n_startup_trials, 5)
            
            print_String(FitClass.IOut,f"Initial guess moves to: {FitClass.InitGuess}",1)
            print_String(FitClass.IOut,f"Corresponding {FitClass.OptAlgo[:-3]} is: {rms}",1)
            print_String(FitClass.IOut,f"Shrink factor for next round is: {FitClass.ShrinkFactor}",1)
            print_String(FitClass.IOut,f"Number of trials for next round is: {FitClass.tmpNT}",1)
            print_String(FitClass.IOut,f"Number of startup trials for next round is: {FitClass.NStartup_trials}",1)

            return study

        for round_id in range(200):  # 跑5轮
            study = run_optuna(FitClass)
            print_String(FitClass.IOut,f"Round {round_id+1} finished.",1)
            

            

        #sampler = optuna.samplers.TPESampler(seed=1)
        #study = optuna.create_study(direction="minimize", sampler=sampler)
        #def objective(trial,FitClass):
        #    C = []
        #    for i in range(len(FitClass.InitGuess)):
        #        if FitClass.InitGuess[i]>0:
        #            min_val = 0.2*FitClass.InitGuess[i]
        #            max_val = 2*FitClass.InitGuess[i] 
        #        else:
        #            min_val = 2*FitClass.InitGuess[i]
        #            max_val = 0.2*FitClass.InitGuess[i]
        #        Ci = trial.suggest_float(f"c{i}", low=min_val, high=max_val)  # parameter range need to be adjusted by yourself
        #        C.append(Ci)
        #    return calc_statistic(C, FitClass)
        # study.optimize(lambda trial: objective(trial, FitClass), n_trials=100)
        plsq = study.best_params
        print_List(FitClass.IOut,[plsq[f'c{i}'] for i in range(len(FitClass.InitGuess))],
            4,Info='Optimized result by optuna algorithm')
        FitClass.InitGuess  = [plsq[f'c{i}'] for i in range(len(FitClass.InitGuess))]
    elif FitClass.OptAlgo[:5] == 'cmaes':
        import cma
        import numpy as np
        #sigma0  = FitClass.CmaSigma0
        FitClass.get_CmaInfo()
        sigma0 = 2.5
        opts = {
            "CMA_stds": FitClass.CmaStds,
            "maxfevals": 2500,
            "popsize": int(10+9* np.log(len(FitClass.InitGuess))),
            "tolx": 1e-3,
            "tolfun": 1e-4,
            "CMA_elitist": True, 
        }
        new_calc_statistic = cma.BoundDomainTransform(calc_statistic, [FitClass.LowerBounds,FitClass.UpperBounds])
        print_String(FitClass.IOut,f"Current Inital guess is: {FitClass.InitGuess}",1)
        plsq  = cma.fmin2(new_calc_statistic,FitClass.InitGuess,\
            sigma0,opts,args=tuple([FitClass]),restarts=3, restart_from_best=True,\
                incpopsize=2,eval_initial_x=True,bipop=True)
        print_List(FitClass.IOut,plsq[0],
            4,Info='Optimized result by cmaes algorithm')
        FitClass.InitGuess  = plsq[0][:]
    elif FitClass.OptAlgo[:12] == 'optuna_cmaes':    
        import optuna
        import numpy as np
        FitClass.get_OptunaInfo()
        FitClass.tmpNT = FitClass.NTrials
        
        def run_optuna(FitClass):
            # shrink_factor=0.2 means searching area is [0.8*best, 1.2*best]
            sampler_random = optuna.samplers.CmaEsSampler(
                seed=1,
                n_startup_trials=FitClass.NStartup_trials,
                independent_sampler= optuna.samplers.RandomSampler(seed=1),
                restart_strategy ='bipop',
            )
            sampler_group = optuna.samplers.TPESampler(
                seed=1,
                n_startup_trials=FitClass.NStartup_trials,
                multivariate=True,
                group=True,
            )
            sampler_multi = optuna.samplers.TPESampler(
                seed=1,
                n_startup_trials=FitClass.NStartup_trials,
                multivariate=True,
                group=False,
            )

            if FitClass.CmaOption == 'random':
                sampler = sampler_random
            elif FitClass.OptunaOption == 'group':
                sampler = sampler_group
            elif FitClass.OptunaOption == 'multi':
                sampler = sampler_multi
            else:
                print_Error(FitClass.IOut,
                    'Error in return required type of statistic data'+\
                    ' \"run_optuna()->%s\"' % FitClass.OptunaOption)
                
            study = optuna.create_study(direction="minimize", sampler=sampler)

            def objective(trial):
                C = []
                for i in range(len(FitClass.InitGuess)):
                    guess = FitClass.InitGuess[i]
                    if guess > 0:
                        min_val = (1 - FitClass.ShrinkFactor) * guess
                        max_val = (1 + FitClass.ShrinkFactor) * guess
                    else:
                        min_val = (1 + FitClass.ShrinkFactor) * guess
                        max_val = (1 - FitClass.ShrinkFactor) * guess
                    Ci = trial.suggest_float(f"c{i}", low=min_val, high=max_val)
                    C.append(Ci)
                return calc_statistic(C, FitClass)

            study.optimize(objective, n_trials=FitClass.tmpNT)

            try:
                FitClass.InitGuess = [study.best_params[f'c{i}'] for i in range(len(FitClass.InitGuess))]
            except KeyError as e:
                print_String(FitClass.IOut,f"Missing key in best_params: {e}, available keys: {study.best_params.keys()}",1)

            # update the search space based on the best result
            FitClass.InitGuess = [
                study.best_params.get(f'c{i}', FitClass.InitGuess[i])
                for i in range(len(FitClass.InitGuess))
            ]
            rms = study.best_value
            s_factor = FitClass.ShrinkFactor * np.exp(-(100-rms)/100)
            FitClass.ShrinkFactor = max(s_factor, 0.25)
            FitClass.tmpNT = int(0.125*FitClass.NTrials*(int(rms)+3))
            #FitClass.tmpNT = FitClass.NTrials
            #n_trials = int(FitClass.NTrials * np.exp(-(40-rms)/40))
            #FitClass.NTrials = max(n_trials, 25)
            n_startup_trials = int(FitClass.tmpNT * 0.15)
            FitClass.NStartup_trials = max(n_startup_trials, 5)
            
            print_String(FitClass.IOut,f"Initial guess moves to: {FitClass.InitGuess}",1)
            print_String(FitClass.IOut,f"Corresponding {FitClass.OptAlgo[:-3]} is: {rms}",1)
            print_String(FitClass.IOut,f"Shrink factor for next round is: {FitClass.ShrinkFactor}",1)
            print_String(FitClass.IOut,f"Number of trials for next round is: {FitClass.tmpNT}",1)
            print_String(FitClass.IOut,f"Number of startup trials for next round is: {FitClass.NStartup_trials}",1)

            return study

        for round_id in range(200):  # 跑5轮
            study = run_optuna(FitClass)
            print_String(FitClass.IOut,f"Round {round_id+1} finished.",1)

        plsq = study.best_params
        print_List(FitClass.IOut,[plsq[f'c{i}'] for i in range(len(FitClass.InitGuess))],
            4,Info='Optimized result by optuna algorithm')
        FitClass.InitGuess  = [plsq[f'c{i}'] for i in range(len(FitClass.InitGuess))]
    elif FitClass.OptAlgo[:5] == 'batch':                            # Just DEBUGING
        calc_statistic(FitClass.InitGuess,FitClass)
    return

def main(argv=None):
    from os      import getcwd
    from os      import getenv
    from os      import chdir
    from os.path import isfile
    from os.path import split
    from os.path import splitext
    from time    import ctime
    from time    import time
    import sys
    if argv is None: argv=sys.argv
    WorkDir	= getcwd().strip()                                       # STRING, current DIR 
    HomeDir	= getenv('HOME')                                         # STRING, Home DIR
    ModuDir='/share/home/symei/pseudo_fitting/Modules'           # Direction include my_io.py and xxx_manage.py
    #ModuDir='/share/home/symei/pseudo_fitting/test_optuna'
    sys.path.append(ModuDir)                                     # Append it into "sys.path"
    sys.path.append(WorkDir)                                     # Append it into "sys.path"
    #if getenv('IGOR_MODULES_PATH'):                                  # STRING, private module DIR
    #    ModuDir=getenv('IGOR_MODULES_PATH')
    #    sys.path.append(ModuDir)                                     # Append it into "sys.path"
    #    sys.path.append(WorkDir)                                     # Append it into "sys.path"
    #else:
    #    print ('Error in getting grobal environment '+\
    #        '\"$IGOR_MODULES_PATH\" which is the ' +\
    #        'direction to private modules')
    #        sys.exit(1)
    from my_io             import print_Error                        # Import private modules
    from my_io             import print_List
    from my_io             import print_String
    from my_io             import ConfigIO
         
    filename	= argv[1]
    WorkPath, JobName   = split(filename)
    Name, Suffix        = splitext(JobName)
    if len(WorkPath)>0:
        chdir(WorkPath)
    iout	= open('%s.Fit' % Name,'w')                              # Open the output file
    # iout	= file('%s.Fit' % Name,'w') 
    # file is the built-in function in python2.7

    print_String(iout,'Fitting start from '+ctime(),1)               # Count time consuming
    TimeStart   = time()

    MainFit   = ConfigIO(iout,fn=filename,bugctrl=iprint)       # Analysis config file
    MainFit.get_ProjEnvr()
    MainFit.get_Batch()
    MainFit.get_TrainSet()
    MainFit.get_OptJob()
    if MainFit.OptJob == 'xyg3':                                # XYG3-like optimization job
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_OptComp()
        MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit

    elif MainFit.OptJob.lower() == 'xmp2':                      # extend MP2 optimization job
        if MainFit.ProjTool != 'qchem':
            print_String(iout,'At present, the optimization for'+\
                'could only be combined with Q-Chem package',1)
            return
        MainFit.get_QcmIOCmd()
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit

    elif MainFit.OptJob.lower() == 'scpt2' or\
            MainFit.OptJob.lower() == 'scsrpa':
        if MainFit.ProjTool != 'aims':
            print_String(iout,'At present, the optimization for'+\
                'could only be combined with FHI-aims package',1)
            return
        MainFit.get_AimIOCmd()
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit
    elif MainFit.OptJob.lower() == 'rest_pseudo':
        MainFit.get_RESTIOCmd()
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_PseudoCoeff()
        #MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit
        
    if MainFit.OptAlgo != 'batch':
        #MainFit.OptAlgo = 'batch'
        run_optimization(MainFit)                                    # Print details for final one

    MainFit.get_Result()                                    # Get the results of optimization
    TimeEnd = time() - TimeStart                                     # Count time consuming
    print_String(iout,'Total job time: %10.2f(wall)' % TimeEnd,1)
    print_String(iout,'Fitting end at '+ctime(),1)
    print_List(iout,__info__,2,'%s' % '-'*76+'==')                   # Print Authors Info.

    iout.close()
    return

main()
