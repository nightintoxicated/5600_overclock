# 5600_overclock

ryzen 5 5600
gigabyte motherboard (b450m ds3h WIFI)
bios version F4b / 07/31/2024 8A16BG0X
rtx 4060

optimal bios settings for cpu and ram:

(ram) mit > xmp profile 1, multiplier to 3600 mhz

pbo advanced

pbo limits motherboard

curve optimiser all cores negative 25

cpu boost clock positive 200



\------
results:

all core frequency: 4299 (4.3ghz)

individual core frequency: 4649 (4.65ghz)

max stress test temp, 86C at 84W

geekbench score:

\--------------------------------------------------

.

.

.

.

.

.

.

the following progresses the journey of overclocking my 5600, you should assume at every step, everything changed before it applies, e.g. if i changed the curve, then next step changed something else, assume that the curve is still set to what it was previously.

\------------------------------------------------------------------------------
baseline results
cpu max mhz: 4470

full stress per core (spc.sh): passed (full script)
mprime baselines ran for 10 minutes each.
(mprime, torture test, 6 cores, hyperthreading)

(result | max temp, max watt (btop))
mprime, opt 16, test 1 (smallest FFTs):    passed | 79 c | 78 w
mprime, opt 16, test 2 (small FFTs):       passed | 78 c | 78 w
mprime, opt 16, test 3 (large FFTs):       passed | 67 c | 64 w
geekbench score: xxxxxxx
------------------------------------------------------------------------------
pbo on (advanced) no other changes, fast investigation

fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
5 min run mprime, opt 16, test 2 (small FFTs):  passed | 78 c | 78 w           
geekbench score: single core 2074 multi core 9924
------------------------------------------------------------------------------
pbo limits set to motherboard

fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
5 min run mprime, opt 16, test 2 (small FFTs):    backed off, hit 95c fast
------------------------------------------------------------------------------
pbo limits set to motherboard, curve to - 15f

5 min run mprime, opt 16, test 2 (small FFTs):    backed off, hit 92c after few mins
------------------------------------------------------------------------------
pbo limits set to manual, ppt 88, tdc 60, edc 90

fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
5 min run mprime, opt 16, test 2 (small FFTs):    passed | 82 c | 83 w - seeing 4.1 ghz
5 min s-tui (stress): 
    frequency average 4250
    temp is between 87 and 88
    btop shows wattage at 86

geekbench score: single core 2073 multi core 9885
------------------------------------------------------------------------------
boost clock override +200

cpu max mhz: 4686
5 min s-tui (stress): 
    frequency average 4274
    temp is between 87 and 88
    btop shows wattage at 86

no noticable increase
------------------------------------------------------------------------------
attempting curve to -20

fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
5 min s-tui (stress): 
    frequency average 4274
    temp is between 87 and 88
    btop shows wattage at 86
geekbench score: single core 2138 multi core 9963
stress per core (spc.sh): passed (ran 1, 3, 10 second, 2 min check per core)
------------------------------------------------------------------------------
upping ppt to 93

5 min s-tui (stress): 
    frequency average about 4280 (value after 5 min)
    temp is between 87 and 88
    btop shows wattage at 85.5
------------------------------------------------------------------------------
upping to: ppt 95, tdc 65, edc 105

5 min s-tui (stress): 
    frequency average about 4280 (value after 5 min)
    temp is between 87 and 88
    btop shows wattage at 85.5
no noticable increase
------------------------------------------------------------------------------
upping to: ppt 120, tdc 75, edc 130 (extreme case to try see higher voltage / hit temp limit)

5 min s-tui (stress): 
    frequency average about 4280 (value after 5 min)
    temp is between 87 and 88
    btop shows wattage at 85.5
    no noticable increase
------------------------------------------------------------------------------
tying another method, pbo limit motherboard, platform thermal throttle limit set to 90
nothing changed, reset bios to default, turned on pbo and limit as motherboard
seeing the following:

brief min s-tui (stress): 
    frequency average 4199
    temp is between 93 and 95
    btop shows wattage at 91
    so this is worse, at default.

seeing if - curve is what changes the wattage, added -20 curve in the bios

brief min s-tui (stress): 
    frequency average 4300
    temp is between 86 and 87
    btop shows wattage at 85.5

adding 100 mhz to cpu clock resulted in slightly lower frequency

brief min s-tui (stress): 
    frequency average 4300
    temp is between 86 and 87
    btop shows wattage at 85.5

removing that 100 mhz so its set to no cpu clock increase, set curve to -25
frequency average 4300 to 4322
    temp is between 86 and 87
    btop shows wattage at 85.5

we have a good setting, now lets try and dial in single core.
we can increase the mhz and monitor the core with s-tui, while we run are single core stress test script, if we crash, we lower the mhz or back off curve optimizer

frequency per single core with s-tui monitoring (using the script per core) is 4449 on every core.

adding 200, lets see what happens:

running individual core script and monitoring s-tui

individual core showing as 4649
------------
.
.
.


ram investigation (back to stock cpu for testing)

xmp - 2800, no boot, requires cmos reset
setting to 37.33 boots, running occt tests:

10 min benchmark, memory, legacy, auto + auto = crash

setting to 3666

10 min benchmark, memory, legacy, auto + auto = passed

10 min benchmark, memory, legacy, sse + auto = passed

10 min benchmark, memory, legacy, avx2 + auto = passed

10 min benchmark, memory, presets, heat = passed
.
.
.

(re clocking cpu to best findings so far and further tests)

10 min benchmark, cpu + ram, large, normal, variable, 1, auto, auto = passed

geekbench score test crashed the pc = crash

lowering ram to 36 (3600)

5 min benchmark, cpu + ram, large, normal, variable, 1, auto, auto = passed

30 min benchmark, memory, 90% avx2 fixed 6 threads = passed

geekbench score test crashed the pc = crash

re trying geekbench to try recreate the crash = re crash

lowering ram to 35.33

geekbench retry with lower ram = crash

lowering ram to 34 

geekbench retry with lower ram = crash

set back to auto for ram

geekbench retry = crash

xmp off

geekbench retry = crash, seeing if the issue is the cpu curve, changing from -25 to -20

plan, run geekbench, then s-tui if geekbench is okay to see temps, and btop for cpu power usage

geekbench = pass
s-tui and btop look fine

setting xmp to 3666 and retesting

geekbench = crash

setting xmp to 3400 and retesting

<<<<< geekbench = 2200 and 10642 (highest yet) >>>>>


setting xmp to 36  and retesting

geekbench = crash

setting xmp to 35.33 and retesting

geekbench = 2207 and 10736

going to try update bios a second, done

before: bios version F4b / 07/31/2024 8A16BG0X
after: bios version F6c / 08/18/2026 8A16BG0X

boot with no bios tweaks set to check alls okay, done

re set the bios tweaks for cpu, memory

memory xmp = 35.33, motherboard, -20 curve, 200 boost clock

geekbench = crash

changed xmp to 34

geekbench = 2201 and 10720
re run geekbench, seems stable, running script for stress.sh = passed

changed xmp to 34.66

geekbench = 2205 and 10660 (second number lower than before, retrying)
geekbench try 2 = 2201 and 10672

changing back to 34, trying cas latency of 15

geekbench = 2185 and 10706

cas set to 14

geekbench = 2163 and 10211 (lower)

trying to up voltage of memory to 1.37

geekbench = 2160 and 10179

cas back to auto with xmp, voltage back to auto, trying with 10 pbo scalar

geekbench = lower, removed pbo scalar.


final values:
mit > advanced memory settings > profile 1, 3400mhz
peripherals > amd overclocking > pbo advanced, motherboard, curve optimizer -20, cpu boost 200

geekbench = 2205 and 10625

trying to move curve from -20 to -24

geekbench = crash

curve -23 crash

geekbench = crash

curve -22

geekbench = 2208 and 10689
geekbench run 2 = 2202 and 10674
shell script = 
gui stuff = 
s-tui = 






