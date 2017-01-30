# Path to the NXC compiler relative to the Makefile
NXC="./bin/nbc"

# Options to pass to the compiler.
# Use -EF to specify we are using enhanced firmware.
# Use -d to specify we want to download to the brick.
OPTIONS=-Z2 -I=../$(SOURCE)/ -EF -d

# Program settings
SOURCE=source
BUILD=build
PROGRAM=nxc2rxe-template
############

all: $(PROGRAM).rxe

$(PROGRAM).rxe: $(SOURCE)/$(PROGRAM).nxc Makefile
	cd $(SOURCE); \
	../$(NXC) -O=../$(BUILD)/$(TARGET_NAME).rxe \
		$(OPTIONS) \
		$(PROGRAM).nxc 

clean:
	/bin/rm -vf $(BUILD)/$(PROGRAM).rxe
