# neopixel-spin
---------------

This is a P8X32A/Propeller driver object for various model addressable LED arrays commonly known as Neopixels

## Salient Features

* Supports WS2811, WS2812, WS2812B, WS2813, SK6812 (RGB and RGBW), and TM1803-based LED arrays
* Integration with generic bitmap graphics library

## Requirements

* 1 extra core/cog for the PASM Neopixel engine

## Compiler Compatibility

* OpenSpin (tested with 1.00.81)

## Limitations

* Very early in development - may malfunction, or outright fail to build
* Engine currently lacks a signal for updating the LED array with the display buffer, so changes to the display are always immediate

## TODO

- [ ] Implement buffer update signal
