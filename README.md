# 5600_overclock
ryzen 5 5600 overclock results
gigabyte motherboard (b450m ds3h)

the following progresses the journey of overclocking my 5600, you should assume at every step, everything changed before it applies, e.g. if i changed the curve, then next step changed something else, assume that the curve is still set to what it was previously.
------------------------------------------------------------------------------
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




