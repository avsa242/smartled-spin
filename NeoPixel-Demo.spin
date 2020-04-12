{
    --------------------------------------------
    Filename: NEOPIXEL-Demo.spin
    Author: Jesse Burt
    Description: Demo of the neopixel driver
    Copyright (c) 2020
    Started Feb 8, 2020
    Updated Feb 9, 2020
    See end of file for terms of use.
    --------------------------------------------
}

CON

    _clkmode    = cfg#_clkmode
    _xinfreq    = cfg#_xinfreq

    SER_RX      = 31
    SER_TX      = 30
    SER_BAUD    = 115_200

    LED         = cfg#LED1

    NEOPIX_MODEL= $6812_32          ' LED array type: $2811, $2812, $2812B, $2813, $6812_24, $6812_32, $1803
    NEOPIX_PIN  = 16                ' I/O pin array is connected to
    WIDTH       = 87                ' Width (or length) of array
    HEIGHT      = 1                 ' Height of array (use 1 if array is just arranged in a strip)
                                    ' NOTE: Total combined must be between 1 and 1024, inclusive
    XMAX        = WIDTH-1
    YMAX        = HEIGHT-1
    BUFFSZ      = WIDTH * HEIGHT

OBJ

    cfg     : "core.con.boardcfg.flip"
    ser     : "com.serial.terminal.ansi"
    time    : "time"
    io      : "io"
    int     : "string.integer"
    neopix  : "display.led.addressable.neopixel"

VAR

    long _framebuff[BUFFSZ]
    long _bgcolor
    byte _ser_cog

PUB Main

    Setup
    _bgcolor := neopix.BGColor($00_00_00_00)
    neopix.Clear
    LarsonScanner($FF_00_00_00, 5)

    repeat

    Stop
    FlashLED(LED, 100)

PUB LarsonScanner(color, delay_ms) | i

    repeat
        repeat i from 0 to XMAX
            neopix.Plot(i, 0, color)
            neopix.Plot(i-1, 0, _bgcolor)
            neopix.Update
            time.MSleep(delay_ms)
        repeat i from XMAX to 1
            neopix.Plot(i, 0, color)
            neopix.Plot(i+1, 0, _bgcolor)
            neopix.Update
            time.MSleep(delay_ms)

PUB Setup

    repeat until _ser_cog := ser.Start (115_200)
    time.MSleep(30)
    ser.Clear
    ser.Str(string("Serial terminal started", ser#CR, ser#LF))
    if neopix.Startx(NEOPIX_MODEL, WIDTH, HEIGHT, @_framebuff, NEOPIX_PIN)
        ser.Str(string("Neopixel driver started", ser#CR, ser#LF))
    else
        ser.Str(string("Neopixel driver failed to start - halting", ser#CR, ser#LF))
        neopix.Stop
        time.MSleep(5)
        ser.Stop
        FlashLED(LED, 500)

PUB Stop

    neopix.BGColor(0)
    neopix.Clear
    neopix.Stop
    time.MSleep(5)
    ser.Stop

#include "lib.utility.spin"

DAT
{
    --------------------------------------------------------------------------------------------------------
    TERMS OF USE: MIT License

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
    associated documentation files (the "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
    following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial
    portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
    LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    --------------------------------------------------------------------------------------------------------
}
