#!/bin/env python3
# Module     :: REST_nage
# Authors    :: Igor Ying Zhang
# Purpose    :: 1) Analysis the input file of rest package;
#            :: 2) Generate the input file of rest package;
#            :: 3) Collect results from rest output;
#            :: All in all, a well-defined private interface with REST 
# Version    :: 0.1(20231124)
# Revise     :: 2023-11-24


class RESTIO:
    AtDict = {'x': 0, 'h': 1, 'he': 2, 'li': 3, 'be': 4, 'b': 5, 'c': 6,
              'n': 7, 'o': 8, 'f': 9, 'ne': 10,
              'na': 11, 'mg': 12, 'al': 13, 'si': 14, 'p': 15,
              's': 16, 'cl': 17, 'ar': 18,
              'k': 19, 'ca': 20, 'ga': 31, 'ge': 32, 'as': 33,
              'se': 34, 'br': 35, 'kr': 36,
              'sc': 21, 'ti': 22,  'v': 23, 'cr': 24, 'mn': 25,
              'fe': 26, 'co': 27, 'ni': 28, 'cu': 29, 'zn': 30,
              'rb': 37, 'sr': 38, 'in': 49, 'sn': 50, 'sb': 51,
              'te': 52,  'i': 53, 'xe': 54,
              'y': 39, 'zr': 40, 'nb': 41, 'mo': 42, 'tc': 43,
              'ru':44, 'rh': 45, 'pd': 46, 'ag': 47, 'cd': 48,
              'hf':72, 'ta': 73, 'w' : 74, 're': 75, 
              'os':76, 'ir': 77, 'pt':78, 'au': 79, 'hg': 80,
              'pb': 82, 'bi': 83, 'rn': 86
              }

    def __init__(self, iout, proj=None, bugctrl=0,InitGuess=None):
        '''Initialize variables belonged to RESTIO'''
        from os import getcwd, getenv
        from os.path import splitext
        from my_io import print_String, print_Error

        if getenv('IGOR_MODULES_PATH'):   # STRING, DIR to private modules
            self.ModuDir = getenv('IGOR_MODULES_PATH')
        else:
            print_Error(self.IOut,
                        'Error in getting grobal environment ' +
                        '\"$IGOR_MODULES_PATH\" which is the ' +
                        'direction to private modules')

        self.IOut = iout        # Flow of the output file
        self.IPrint = bugctrl   # to control the printing out
        fn, fe = splitext(proj)
        self.Proj = fn          # Name of the project

        self.WorkDir = getcwd().strip()  # STRING, current DIR
        self.HomeDir = getenv('HOME')    # STRING, home DIR
        self.BasisDir = ''
        print_String(self.IOut, 
                'The direction of basis set is required', 
                self.IPrint)
        if InitGuess is not None:
            self.InitGuess = InitGuess
        else:
            self.InitGuess = [1.0]*10

        self.BasisDir = ''   # basis set direction

        self.Charge = 0
        self.Spin = 0
        self.ElemNum = 0
        self.Elems = []
        # SCF, EcRPA, RPA, RPA+SE, RPA+rSEd, RPA+rSEf, RPA+, and ExHF
        self.Energy = {}
        self.Basis = {}
        self.add_CMD = []   # additional commands for the control.in
        return

    def __del__(self):
        '''Close the document flow of input file'''
        return

    def form_Control(self):
        import os
        from my_io import print_String, print_Error
        #
        # check several files required
        #
        if not os.path.isdir(self.Proj):
            print_Error(self.IOut, "Error :: No %s direction" % self.Proj)
        elif not os.path.isfile("%s/%s" % (self.Proj, "elec_state")):
            print_Error(self.IOut,
                        "Error :: No 'elec_state' in %s direction" % self.Proj)
        elif not os.path.isfile("ctrl.in"):
            print_Error(self.IOut,
                        "Error :: No 'ctrl.in' in the current direction")
        #
        # get charge and spin info. from "elec_state"
        #
        ff = open("%s/%s" % (self.Proj, "elec_state"), 'r')
        fl = ff.readlines()
        ff.close()
        self.Alpha_ex = 0.0
        self.Open_shell = 1
        for x in fl:
            if len(x.strip()) == 0:
                continue
            xl = x.strip().split()
            if xl[0] == 'charge':
                try:
                    self.Charge = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting charge info. " +
                                "from 'elec_state'")
            elif xl[0] == 'spin':
                try:
                    self.Spin = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting spin info. " +
                                "from 'elec_state'")
            elif xl[0] == 'atoms':
                try:
                    self.Atoms = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting atom info. " +
                                "from 'elec_state'")
            elif xl[0].lower() == 'alpha_ex':
                try:
                    self.Alpha_ex = float(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting the factor of " +
                                "the exact exchange from 'elec_state'")
            elif xl[0].lower() == 'open_shell':
                try:
                    self.Open_shell = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting the open-shell info. " +
                                "from 'elec_state'")
        #
        # get info. from standard "ctrl.in"
        #
        ff = open("ctrl.in", 'r')
        nff = open("%s/ctrl.in" % self.Proj, 'w')
        fl = ff.read()
        ff.close()

        nff.write(fl)

        nff.write("    charge = %-8.4f\n" %self.Charge)
        nff.write("    spin   = %-8i\n" %self.Spin)

        if self.Spin > 1:
            nff.write("    spin_polarization = true\n")
        elif self.Spin == 1:
            nff.write("    spin_polarization = false\n")


        nff.write("\n")

        if os.path.isfile("%s/%s" % (self.Proj, "geometry.in")):
            nff.write(get_geom_toml("%s/geometry.in" %self.Proj, self.Proj, self.IOut))
        elif os.path.isfile("%s/%s" % (self.Proj, "geometry.xyz")):
            nff.write('\n')
            nff.write('[geom]\n')
            nff.write('    name = \"%s\"\n' %self.Proj)
            nff.write('    unit = \"angstrom\"\n')
            nff.write('    position = \'\'\'\n')
            gf = open("%s/%s" % (self.Proj, "geometry.xyz"), 'r')
            gg = gf.read()
            gf.close()
            nff.write(gg)
        #if os.path.isfile("%s/%s" % (self.Proj, "ghost.info")):
        #    nff.write('\n')
        #    ghost_file = open("%s/%s" %(self.Proj, "ghost.info"), 'r');
        else:
            print(("%s/geometry.in" %self.Proj))
            print_Error(self.IOut,
                        "Error :: No 'geometry.in' or 'geometry.xyz' in %s direction"
                        % self.Proj)

        nff.close()
        return
    
    def run_Job_serial(self,cfg=None):
        '''run rest through a specified (c)sh named "REST_Environment"'''
        from os import system, chdir
        from os import getcwd
        from os.path import exists, isfile
        from my_io import print_Error, print_String

        ModuDir='/share/home/symei/pseudo_fitting/Modules'
        if not exists('%s' % self.Proj):
            print_Error(self.IOut,
                        "Error :: No %s direction" % (self.Proj))
        chdir(self.Proj)

        #print("Current directory is: ", getcwd())
        #print(self.Proj)

        #system(f"{ModuDir}/REST_Environment '{self.Proj}.log'")
        system(f"RUST_BACKTRACE=full {ModuDir}/REST_Environment '{self.Proj}.log'")
        system(f'mv {self.Proj}.log {self.WorkDir}/{self.Proj}.log')
        chdir(self.WorkDir)
        return True

    def run_Job(self, nproc=1, cfg=None, script=None, cmd=None, qname=None):
        '''run rest through a specified csh named "REST_Environment"'''
        from os import system, chdir
        from os.path import exists, isfile
        from my_io import print_Error, print_String

        if cfg is None:
            cfg = 'rest'
        if script is None:
            script = 'rest_runscr'
        if cmd is None:
            cmd = 'sbatch'
        elif cmd == 'bsub':
            cmd = 'bsub <'
        elif cmd == 'qsub_fdhpc':
            cmd = 'qsub -l nodes=<nodes>:ppn=<ntaskspernode>' +\
                ' -q <qname> -N <jobname>'
        #elif cmd == 'qsub_xxchem6':
        #    cmd = 'qsub.sh'
        if qname is None:
            qname = 'default'
        if not exists('%s' % self.Proj):
            print_Error(self.IOut,
                        "Error :: No %s direction" % (self.Proj))
        chdir(self.Proj)
        if isfile('RUNNING'):
            return False
        elif isfile('%s.log' % self.Proj):
            system('mv %s.log ../%s.log' % (self.Proj, self.Proj))
            chdir(self.WorkDir)
            return True
        else:
            if not isfile('%s/%s' % (self.ModuDir, script)):
                tmpString = 'To submit the jobs to the %s, ' % cmd
                tmpString += 'you need the script file named ' +\
                    '\"%s\" in the module folder of %s' \
                    % (script, self.ModuDir) + ', which does not exist\n' + \
                    'Please check if the file name (%s) is correct' \
                    % (script) + ' or it is simply missing'
                print_Error(self.IOut, tmpString)
            iof = open('%s/%s' % (self.ModuDir, script), 'r')
            iFile1 = iof.read()    # so iof equals to rest_runscr_* in the module folder
            iof.close()
            # evaluate how many nodes needed for scripts
            #print(self.Proj,nnode,nproc,ntaskpernode)
            iFile2 = iFile1.replace('<jobname>', 'job-%s' % self.Proj)
            iFile1 = iFile2.replace('<version>', cfg)
            iFile2 = iFile1.replace('<joblog>', '%s.log' % self.Proj)
            iFile1 = iFile2.replace('<nodes>', '%i' % 1)
            iFile2 = iFile1.replace('<ntasks>', '%i' % nproc)
            iFile1 = iFile2.replace('<ntaskspernode>', '%i' % nproc)
            iFile2 = iFile1.replace('<nproc>', '%i' % nproc)
            iFile1 = iFile2.replace('<qname>', '%s' % qname)
            #iFile1 = iFile1
            iof = open('runscr', 'w')
            iof.write(iFile1)
            iof.close()
            # evaluate how many nodes needed for cmd
            Cmd1 = cmd
            Cmd2 = Cmd1.replace('<jobname>', 'job-%s' % self.Proj)
            Cmd1 = Cmd2.replace('<version>', cfg)
            Cmd2 = Cmd1.replace('<joblog>', '%s.log' % self.Proj)
            Cmd1 = Cmd2.replace('<nodes>', '%i' % 1)
            Cmd2 = Cmd1.replace('<ntaskspernode>', '%i' % nproc)
            Cmd1 = Cmd2.replace('<ntasks>', '%i' % nproc)
            Cmd2 = Cmd1.replace('<nproc>', '%i' % nproc)
            Cmd1 = Cmd2.replace('<qname>', '%s' % qname)
            #Cmd1 = Cmd1
                
            jobId = system('%s runscr' % Cmd1)
            system('echo %s > %s' % (jobId, 'RUNNING'))
            if isfile('%s.log' % self.Proj):
                system(f'mv {self.Proj}.log {self.WorkDir}/{self.Proj}.log')
            chdir(self.WorkDir)
            return False

    def get_Result(self, iop=0):
        '''Collect results'''
        import re
        import os
        from my_io import print_String, print_Error

        if os.path.isfile('%s.log' % self.Proj):
            lf = open('%s.log' % self.Proj, 'r')
            lfs = lf.read()
        else:
            print_Error(self.IOut,
                        'Error :: No %s.log in current direction' % self.Proj)

        if iop == 0:    # for scf energy
            # At first, check whether the SCF is converged
            p0 = re.compile('SCF is converged after *(?P<iters>\d+) iterations.')
            p0p = p0.search(lfs)
            if not p0p:
                print_String(self.IOut, 'Error :: SCF doesn\'t sucess in %s'
                             % self.Proj, 1)
                print_String(self.IOut, 'The SCF energy              : %16s'
                             % 'NAN', 1)
                self.Energy['SCF'] = 'NAN'
                print(('Error :: SCF doesn\'t sucess in %s' % self.Proj))
            else:
                num_iters = int(p0p.group('iters'))
                # to find the SCF energy with fractional occupation
                tmpString = \
                    'The SCF energy *: *(?P<energy>-?\d+.\d+) Ha'
                p1 = re.compile(tmpString)
                # to find the SCF energy with interger occupation
                p1p = p1.search(lfs)
                if p1p:
                    self.Energy['SCF'] = float(p1p.group("energy"))
                    print_String(self.IOut,
                                 'The SCF energy              : %16.8f'
                                 % self.Energy['SCF'], 1)
                else:
                    print_String(self.IOut,
                                 'Error :: SCF result was not found in %s'
                                 % self.Proj, 1)
                    print_String(self.IOut,
                                 'The SCF energy              : %16s'
                                 % 'NAN', 1)
                    self.Energy['SCF'] = 'NAN'
        elif iop == 1:  # for xDH energy
            # to find the RPA correlation energy
            p0 = re.compile(
                'The \(R\)-xDH energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p0p = p0.search(lfs)
            if p0p:
                self.Energy['xDH'] = float(p0p.group('iters'))
                print_String(self.IOut,
                             'The (R)-xDH Energy          : %16.8f'
                             % self.Energy['xDH'], 1)
            else:
                print_String(self.IOut,
                             'Error :: The (R)-xDH result was not found in %s'
                             % self.Proj, 1)
                print_String(self.IOut,
                             'The (R)-xDH Energy  get_geom_toml("%s/geometry.in" , self.Proj, self.IOut)        : %16s'
                             % (self.Proj,'NAN'), 1)
                self.Energy['xDH'] = 'NAN'
            p0 = re.compile(
                'AI Correction\s*:\s*(?P<iters>-?\d+.\d+) Ha')
            p0p = p0.search(lfs)
            if p0p:
                self.Energy['AICorr'] = float(p0p.group('iters'))
                print_String(self.IOut,
                             'AI Correction               : %16.8f'
                             % self.Energy['AICorr'], 1)
            else:
                print_String(self.IOut,
                             'Error :: AI Correction result was not found in %s'
                             % self.Proj, 1)
                print_String(self.IOut,
                             'AI Correction               : %16s'
                             % 'NAN', 1)
                self.Energy['AICorr'] = 'NAN'
                
        elif iop == 2:   # for RPA related energy
            tmpString =\
                'The RPA energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p7 = re.compile(tmpString)
            p7p = p7.search(lfs)
            if p7p:
                self.Energy['RPA'] = float(p7p.group('iters'))
                print_String(self.IOut,
                             'The RPA energy              : %16.8f'
                             % self.Energy['RPA'], 1)
            else:
                print_String(self.IOut,
                             'The RPA energy              : %16s'
                             % self.Proj, 1)
                self.Energy['RPA'] = 'NAN'
        return

    def parse_Control(self):
        '''parse control.in'''
        import os
        # open elec_state
        if os.path.isfile("%s/elec_state" % self.Proj):
            sff = open("%s/elec_state" % self.Proj, 'a')
        else:
            sff = open("%s/elec_state" % self.Proj, 'w')
        # open control.in
        if os.path.isfile("%s/ctrl.in" % self.Proj):
            wff = open("%s/ctrl.in" % self.Proj, 'r')
        else:
            print("No ctrl.in")

        sff.close()
        wff.close()
        return

    def parse_Geometry(self):
        '''parse geometry.in'''
        import os
        # open elec_state
        #if os.path.isfile("%s/elec_state" % self.Proj):
        #    sff = open("%s/elec_state" % self.Proj, 'a')
        #else:
        #    sff = open("%s/elec_state" % self.Proj, 'w')
        #sff.close()
        # open geometry.in
        if os.path.isfile("%s/geometry.in" % self.Proj):
            sff = open("%s/geometry.in" % self.Proj, 'r')
        else:
            print("No geometry.in")
        tf = sff.readlines()
        sff.close()
        self.geomDict = {'lattice':[],
                    'position':[],
                    'element':[],
                    'IAn':[],
                    'constrain':[],
                    'force':[]}
        for x in tf:
            if len(x.strip())==0: continue
            if x.strip()[0]=='#': continue
            xList = x.split()
            if xList[0].lower()=='lattice_vector':
                self.geomDict['lattice'].append([float(y) for y in xList[1:]])
            elif xList[0].lower()=='atom':
                self.geomDict['position'].append([float(y) for y in xList[1:-1]])
                self.geomDict['element'].append(xList[-1].strip())
                self.geomDict['constrain'].append(False)
            elif xList[0].lower()=='constrain_relaxation':
                if xList[1].lower()=='.true.':
                    self.geomDict['constrain'][-1]=True
        AtKey = list(RESTIO.AtDict.keys())
        for x in self.geomDict['element']:
            if x.lower() in AtKey:
                self.geomDict['IAn'].append(RESTIO.AtDict[x.lower()])
            else:
                print(('Cannot determine the index of %s' %x))
        return

class DFTD_AIMS:
    '''\
    This class handles DFT+D calculation cooperating with Gaussian package and "dft_d" module.\n\
    NOTE :: "DFTD" should be loaded after modules of  "GauIO" and "OptHandle"\n\
    Scale parameter for six-order terms "s6" following are originated from\n\
        1) Grimme... Vol.27 , 1787, J. Comp. Chem.\n\
        2) Martin... Vol.113, 8434, J. Phys. Chem. A\n\
    \n\
    disp_g  is the pure dispersion of Grimme\n\
    disp_6  is the unscaled Grimme's dispersion\n\
    disp_12 is the unscaled tweleve-order term extended by Grimme's s6 and LG form\n\
    disp_xy\n\
    disp\
    '''
    GrimDict    = {\
  'b3lyp+d' : [1.05 ,  'b3lyp'] ,      'b971+d' : [0.65 ,   'b971'] , 
   'b972+d' : [1.05 ,   'b972'] ,       'bmk+d' : [0.65 ,    'bmk'] , 
   'blyp+d' : [1.20 ,   'blyp'] ,     
  'm062x+d' : [0.06 ,  'm062x'] ,     
    'pbe+d' : [0.75 , 'pbepbe'] ,    'pbepbe+d' : [0.75 , 'pbepbe'] , 
   'pbe0+d' : [0.70 ,   'pbe0'] ,   
   'tpss+d' : [1.00 ,   'tpss'] ,   
  'x3lyp+d' : [0.85 ,  'x3lyp']\
                }
    DispDict    = {
   'disp_g' : [1.00 , 'disp_g'] , 'dispersion_g': [1.00,  'disp_g'] ,
   'disp_6' : [1.00 , 'disp_6'] , 'dispersion_6': [1.00,  'disp_6'] ,
  'disp_12' : [1.00 ,'disp_12'] ,'dispersion_12': [1.00, 'disp_12'] ,
 'disp_12s' : [1.00 ,'disp_12s'] ,'dispersion_12s': [1.00, 'disp_12s'] ,
     'disp' : [1.00 ,   'disp'] ,   'dispersion': [1.00,    'disp']\
                  }

    def __init__(self, iout, AimsIO, bugctrl=0,\
        method='disp',c6para=None, c12para=None, r0para=None, dpara=None):
        '''\
        Initialize parameters\
        '''
        from my_io import print_Error
        from my_io import print_String
        from dft_d import DispGrim
        self.IOut       = iout                                       # Set the logout file string
        self.AimsIO     = AimsIO                                      # Loading AimsIO class
        self.DispClass  = None                                       # DispClass
 #
        self.IPrint     = bugctrl                                    # INTEGER, control debugging
        self.AtLabel    = self.AimsIO.geomDict['element']                        # List of AtLabel
        self.CList      = self.AimsIO.geomDict['position']                          # List of Geom. Info.
        self.IAn        = self.AimsIO.geomDict['IAn']                            # List of IAn
        self.Method     = method                                     # STRING, name of DFT+D
        self.SixPara    = 1.0                                        # REAL, Parameter of disp.
 #
        self.EngyReal   = 0.0                                        # REAL, dispersion energy
        self.TurnOn     = True                                       # LOGIC, turn on or off DFT+D
        self.PureDisp   = True                                       # LOGIC, pure disp. calc.
 #
        if self.TurnOn:
            if (self.Method == 'disp_g') or\
            (self.Method == 'dispersion_g'):
                self.PureDisp   = True
                self.DispClass  =\
                    DispGrim(self.IOut, self.CList, self.IAn, 0,\
                    self.IPrint,\
                    c6para, c12para, r0para, dpara)
                if self.IPrint>=1:
                    print_String(self.IOut, 'Disp_G is required',1)
            elif (self.Method == 'disp_6') or\
            (self.Method == 'dispersion_6'):
                self.PureDisp   = True
                self.DispClass  =\
                    DispGrim(self.IOut, self.CList, self.IAn, 1,\
                    self.IPrint,\
                    c6para, c12para, r0para, dpara)
                if self.IPrint>=1:
                    print_String(self.IOut, 'Disp_6 is required',1)
            elif (self.Method == 'disp_12') or\
            (self.Method == 'dispersion_12'):
                self.PureDisp   = True
                self.DispClass  =\
                    DispGrim(self.IOut, self.CList, self.IAn, 2,\
                    self.IPrint,\
                    c6para, c12para, r0para, dpara)
                if self.IPrint>=1:
                    print_String(self.IOut, 'Disp_12 is required',1)
                return
            elif (self.Method == 'disp') or\
            (self.Method == 'dispersion'):
                self.PureDisp   = True
                self.DispClass       =\
                    DispGrim(self.IOut, self.CList, self.IAn, 3,\
                    self.IPrint,\
                    c6para, c12para, r0para, dpara)
                if self.IPrint>=1:
                    print_String(self.IOut,'Disp. is required',1)
            if (self.Method == 'disp_12s') or\
            (self.Method == 'dispersion_12s'):
                self.PureDisp   = True
                self.DispClass       =\
                    DispGrim(self.IOut, self.CList, self.IAn, 4,\
                    self.IPrint,\
                    c6para, c12para, r0para, dpara)
                if self.IPrint>=1:
                    print_String(self.IOut,'Disp_12s is required',1)
                return
        else:
            self.DispClass       =\
                DispGrim(self.IOut, self.CList, self.IAn, 0,\
                self.IPrint)
            if self.IPrint>=2:
                print_String(self.IOut,
                    'None DFT+D scheme is required',1)
        return
    def __del__(self):

        return
    def get_EngyReal(self,ICtrl=0):
        '''\
        Get DFT+D or Dispersion energy\n\
        NOTE :: ICtrl   = 0 : default, the same as 1\n\
                        = 1 : to run_GauJob() before QM energy collecting\n\
                          2 : bypass run_GauJob(), to get QM energy from given Chkfile\n\
        '''
        from my_io      import my_plus
        if self.PureDisp:
            self.EngyReal   = self.DispClass.get_EngyReal()
        return self.EngyReal


def geom_aims2rest(from_file, to_file, job_name, iout):
    import os
    from my_io import print_String, print_Error
    #
    # check several files required
    #
    tf = open('%s' % to_file, 'w')

    tf.write('[geom]\n')
    tf.write('    name = \"%s\"\n' %job_name)
    tf.write('    unit = \"angstrom\"\n')
    tf.write('    position = \'\'\'\n')

    if not os.path.isfile("%s" % from_file):
        print_Error(iout, "Error :: No '%s'" %from_file)
    ff = open("%s" % from_file, 'r')
    fl = ff.readlines()
    ff.close()
    for xline in fl:
        xlist = xline.strip().split()
        print(xlist)
        if len(xlist)==5:
            try:
                tf.write('    %s %16.8f %16.8f %16.8f\n' %(xlist[4], float(xlist[1]), float(xlist[2]), float(xlist[3])))
            except:
                print_Error(iout, "Error :: Invalid AIMS geometry format in %s" %from_file)
        else:
            print_Error(iout, "Error :: Invalid AIMS geometry format in %s" %from_file)

    tf.write('    \'\'\'\n')
    tf.close()
    
    return

def get_geom_toml(from_file, job_name, iout):
    import os
    from my_io import print_String, print_Error
    #
    # check several files required
    #

    tf = ''

    tf += '[geom]\n'
    tf +='    name = \"%s\"\n' %job_name
    tf +='    unit = \"angstrom\"\n'
    tf +='    position = \'\'\'\n'

    if not os.path.isfile("%s" % from_file):
        print_Error(iout, "Error :: No '%s'" %from_file)
    ff = open("%s" % from_file, 'r')
    fl = ff.readlines()
    ff.close()
    for xline in fl:
        xlist = xline.strip().split()
        if len(xlist)==5:
            try:
                tf +='    %s %16.8f %16.8f %16.8f\n' %(xlist[4], float(xlist[1]), float(xlist[2]), float(xlist[3]))
            except:
                print_Error(iout, "Error :: Invalid AIMS geometry format in %s" %from_file)
        else:
            print_Error(iout, "Error :: Invalid AIMS geometry format in %s" %from_file)

    tf += '    \'\'\'\n'
    
    return tf