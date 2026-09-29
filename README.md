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

geekbench score:
------------------------------------------------------------------------------
pbo on (advanced) no other changes, fast investigation
fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
5 min run mprime, opt 16, test 2 (small FFTs):  passed | 78 c | 78 w         

------------------------------------------------------------------------------

curve lowered to -15, no clock increase
(curve optimizer, all cores, negative, 15)

fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
10 min run mprime, opt 16, test 2 (small FFTs): passed | 79 c | 78 w          

geekbench score: single core 2074 multi core 9924
------------------------------------------------------------------------------
pbo limits set to motherboard
fast stress per core (spc.sh): passed (ran 1, 3, 10 second check per core)
5 min run mprime, opt 16, test 2 (small FFTs):  passed | 78 c | 78 w         



