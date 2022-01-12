import nidaqmx.system

system = nidaqmx.system.System.local()

print(system.driver_version)