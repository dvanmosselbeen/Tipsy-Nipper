#####
# Code borrowed from Aicraft/pa22/Nasale/pa22.nas
#####
################################################################################

# Record engine's running time

var hours = props.globals.getNode("/engines/engine[0]/hours-running", 1);
var rpm = props.globals.getNode("/engines/engine[0]/rpm", 1);
var magnetos = props.globals.getNode("/controls/engines/engine[0]/magnetos", 1);
var cruise_rpm = 2600;

if (hours.getValue() == nil) {hours.setValue(0);}
if (hours.getValue() >= 10000) {hours.setValue(hours.getValue() - 10000);}

var add_hours = func {
    var rpm = rpm.getValue();
    if (rpm != nil and magnetos.getValue()) {
        var add_time = rpm / cruise_rpm / 3600;
        hours.setValue(hours.getValue() + add_time);
    }
    settimer(add_hours, 1);
}

# Save configuration

var save_list = ["/engines/engine[0]/hours-running"];

aircraft.data.add(save_list);

################################################################################
# Initialize systems

var initialize = setlistener("/sim/signals/fdm-initialized", func {
    add_hours();
    removelistener(initialize);
});
