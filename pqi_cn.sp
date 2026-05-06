***************************************************
***************************************************
*For optimal accuracy, convergence, and runtime
***************************************************
.options POST
.options AUTOSTOP
.options INGOLD=2     DCON=1
.options GSHUNT=1e-12 RMIN=1e-15
.options ABSTOL=1e-5  ABSVDC=1e-4
.options RELTOL=1e-2  RELVDC=1e-2
.options NUMDGT=4     PIVOT=13

.param   TEMP=27
***************************************************


***************************************************
*Include relevant model files
***************************************************
.lib 'CNFET.lib' CNFET
***************************************************
*Some CNFET parameters:


.param Ccsd=0      CoupleRatio=0
.param m_cnt=1     Efo=0.6
.param Wg=0        Cb=40e-12
.param Lg=32e-9    Lgef=100e-9
.param Vfn=0       Vfp=0
.param m=19       n=0
.param ma=10     na=0
.param Hox=4e-9    Kox=16

***********************************************************************
* Define out supply
***********************************************************************
.option post=2
X1 OUT IN Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=29  n2=0  tubes=3

X2 OUT IN Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3


**************************************************************************
**************************************************************************
VVoltageSource_1 Vdd Gnd  DC 1.2
VVoltageSource_2 IN Gnd  PWL(0p 0 500p 0 500.1p 0.4 1000p 0.4 1000.1p 0.8 1500p 0.8 1500.1p 1.20 2000p 1.20 2000.1p 0.8 2500p 0.8 2500.1p 0.4 3000p 0.4 3000.1p 0 3500p 0)
***********************************************************************
.tran 1p 3500p

.options post=2
.end

***********************************************************************
***********************************************************************
