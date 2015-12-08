
FIX_INCLUDES = sed "s/\#include \"Wire.h\"//" | sed "s/Modulo.h/Modulo\/Modulo.h/"
EXAMPLES = \
	firmware/examples/USBControl.ino \
	firmware/examples/DisplayTutorial.ino \
	firmware/examples/DisplayEventsTutorial.ino \
	firmware/examples/KnobTutorial.ino \
	firmware/examples/KnobEventsTutorial.ino \
	firmware/examples/MotorTutorial.ino \
	firmware/examples/MotorEventsTutorial.ino


update :
	cp ../arduino/src/*.h firmware/
	cp ../arduino/src/*.cpp firmware/
	make $(EXAMPLES)

firmware/examples/%.ino :  ../arduino/examples/*/%.ino
	cat $< | $(FIX_INCLUDES) > $@
