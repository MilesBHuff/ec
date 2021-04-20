# SPDX-License-Identifier: GPL-3.0-only

EC=it5570e

# Add keymap to src
KEYMAP?=default
SRC+=$(BOARD_DIR)/keymap/$(KEYMAP).c

# Set keyboard LED mechanism
KBLED=rgb_pwm

# Set discrete GPU I2C bus
CFLAGS+=-DI2C_DGPU=I2C_1

# Set battery I2C bus
CFLAGS+=-DI2C_SMBUS=I2C_4

# Set touchpad PS2 bus
CFLAGS+=-DPS2_TOUCHPAD=PS2_3

# Set smart charger parameters
CFLAGS+=\
	-DCHARGER_CHARGE_CURRENT=1536 \
	-DCHARGER_CHARGE_VOLTAGE=13050 \
	-DCHARGER_INPUT_CURRENT=9230

# Set battery charging thresholds
CFLAGS+=\
	-DBATTERY_START_THRESHOLD=0 \
	-DBATTERY_END_THRESHOLD=100

# Set CPU power limits in watts
CFLAGS+=\
	-DPOWER_LIMIT_AC=180 \
	-DPOWER_LIMIT_DC=28

# Custom fan curve
CFLAGS+=-DBOARD_HEATUP=2
CFLAGS+=-DBOARD_COOLDOWN=5
CFLAGS+=-DBOARD_FAN_POINTS="\
        FAN_POINT(40, 27), \
        FAN_POINT(45, 40), \
        FAN_POINT(50, 50), \
        FAN_POINT(55, 65), \
        FAN_POINT(60, 75), \
        FAN_POINT(65, 90), \
        FAN_POINT(70, 100) \
"

# Enable DGPU support
CFLAGS+=-DHAVE_DGPU=1
CFLAGS+=-DBOARD_DGPU_HEATUP=2
CFLAGS+=-DBOARD_DGPU_COOLDOWN=5
CFLAGS+=-DBOARD_DGPU_FAN_POINTS="\
        FAN_POINT(40, 27), \
        FAN_POINT(45, 40), \
        FAN_POINT(50, 50), \
        FAN_POINT(55, 65), \
        FAN_POINT(60, 75), \
        FAN_POINT(65, 90), \
        FAN_POINT(70, 100) \
"

# Add system76 common code
include src/board/system76/common/common.mk
