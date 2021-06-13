# smartled-spin
---------------

This is a P8X32A/Propeller driver object for various model smart/addressable LED arrays (e.g., NeoPixels)

**IMPORTANT**: This software is meant to be used with the [spin-standard-library](https://github.com/avsa242/spin-standard-library) (P8X32A) or [p2-spin-standard-library](https://github.com/avsa242/p2-spin-standard-library) (P2X8C4M64P). Please install the applicable library first before attempting to use this code, otherwise you will be missing several files required to build the project.

## Salient Features

* Supports WS2811, WS2812, WS2812B, WS2813, SK6812 (RGB and RGBW), and TM1803-based LED arrays
* Integration with generic bitmap graphics library

## Requirements

P1/SPIN1:
* 80MHz Fsys
* spin-standard-library
* 1 extra core/cog for the PASM SmartLED engine
* Presence of bitmap graphics library

P2/SPIN2:
* 16MHz Fsys minimum
* p2-spin-standard-library
* Presence of bitmap graphics library

## Compiler Compatibility

* P1/SPIN1: OpenSpin (tested with 1.00.81)
* P2/SPIN2: FlexSpin (tested with 5.5.0)
* ~~BST~~ (incompatible - no preprocessor)
* ~~Propeller Tool~~ (incompatible - no preprocessor)
* ~~PNut~~ (incompatible - no preprocessor)

## Hardware compatibility

* Tested with WS2812 (GRB), SK6812 (GRBW)

## Limitations

* Very early in development - may malfunction, or outright fail to build

## TODO

- [x] Implement double-buffering
- [x] Implement P2/SPIN2 driver
