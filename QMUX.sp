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
***********************************************************************
*IQI setup
***********************************************************************
X1 IQI Sel Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=13  n2=0  tubes=3

X2 IQI Sel Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=13  n2=0  tubes=3

X3 CIQI IQI Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=13  n2=0  tubes=3

X4 CIQI IQI Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=13  n2=0  tubes=3

***********************************************************************
*PQI setup
***********************************************************************
X5 PQI Sel Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=29  n2=0  tubes=3

X6 PQI Sel Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3

X7 CPQI PQI Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=29  n2=0  tubes=3

X8 CPQI PQI Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3

***********************************************************************
*NQI setup
***********************************************************************
X9 NQI Sel Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=8  n2=0  tubes=3

X10 NQI Sel Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

X11 CNQI NQI Vdd Vdd PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=8  n2=0  tubes=3

X12 CNQI NQI Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

*****************************************************************************
* MUX 4:1
*****************************************************************************
X13 Vout NQI I0 I0 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

X14 n1 IQI I1 I1 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

X15 Vout CNQI n1 n1 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

X16 n2 PQI I2 I2 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

X17 Vout CIQI n2 n2 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

X18 Vout CPQI I3 I3 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbp='Vfp' Dout=1  Sout=0  Pitch=20e-9  n1=29  n2=0  tubes=3

**************************************************************************
**************************************************************************
VVoltageSource_1 Vdd Gnd  DC 1.2
VVoltageSource_2 I0 Gnd  PWL(0p 0 500p 0 500.1p 0.8 1000p 0.8 1000.1p 0.4 1500p 0.4 1500.1p 1.20 2000p 1.20 2000.1p 0.8 2500p 0.8 2500.1p 0.4 3000p 0.4 3000.1p 0 3500p 0)
VVoltageSource_3 I1 Gnd  PWL(0p 0 500p 0 500.1p 0.8 1000p 0.8 1000.1p 0.4 1500p 0.4 1500.1p 1.20 2000p 1.20 2000.1p 0.8 2500p 0.8 2500.1p 0.0 3000p 0.0 3000.1p 0.8 3500p 0.8)
VVoltageSource_4 I2 Gnd  PWL(0p 0.8 500p 0.8 500.1p 1.2 1000p 1.2 1000.1p 0.4 1500p 0.4 1500.1p 1.20 2000p 1.20 2000.1p 0.0 2500p 0.0 2500.1p 0.4 3000p 0.4 3000.1p 0.8 3500p 0.8)
VVoltageSource_5 I3 Gnd  PWL(0p 0.4 500p 0.4 500.1p 0.0 1000p 0.0 1000.1p 0.4 1500p 0.4 1500.1p 1.20 2000p 1.20 2000.1p 0.8 2500p 0.8 2500.1p 0.0 3000p 0.0 3000.1p 1.2 3500p 1.2)
VVoltageSource_6 Sel Gnd  PWL(0p 0 500p 0 500.1p 0 1000p 0 1000.1p 0.4 1500p 0.4 1500.1p 0.8 2000p 0.8 2000.1p 0.8 2500p 0.8 2500.1p 1.2 3000p 1.2 3000.1p 1.2 3500p 1.2)

***********************************************************************
.tran 1p 3500p

.options post=2
.end

***********************************************************************
***********************************************************************
