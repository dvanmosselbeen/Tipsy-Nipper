##
# Tipsy Nipper electrical system.
##


# FIXME: Temp solution to get the turn & bank instrument functional in awaiting
# of a proper and full functional electrical system. See the pa22 as reference.
var bus_volts = 28;
setprop("/systems/electrical/outputs/turn-coordinator", bus_volts);
