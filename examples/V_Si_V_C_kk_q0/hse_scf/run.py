# Python script to calculate ZFS from WAVECAR
from pyzfs.common.wfc.vasploader import VaspWavefunctionLoader
from pyzfs.zfs.main import ZFSCalculation
wfcloader = VaspWavefunctionLoader()
zfscalc = ZFSCalculation(wfcloader=wfcloader)
# Perform ZFS calculation
zfscalc.solve()