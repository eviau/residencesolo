; based on https://csound.com/docs/manual/lorenz.html
; with this piece, my objective is to start working with the Lorenz attractor as an instrument.

<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
;-odac           -iadc    ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
 -o lorenz.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 44100
ksmps = 1
nchnls = 2

; Instrument #1 - a lorenz system in 3D space.
instr 1
  ; Create a basic tone.
  kamp init 15000
  kcps init 500
  ifn = 1
  asnd oscil kamp, kcps, ifn

  ; Figure out its X, Y, Z coordinates.
  ksv init 30
  krv init p4
  kbv init 8/3
  kh init 0.0003
  ix = p5
  iy = 0.2
  iz =0.25
  iskip = 1
  ax1, ay1, az1 lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip

  ; Place the basic tone within 3D space.
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1
  idist = 1
  ift = 10
  imode = 1
  imdel = 1.018853416
  iovr = 2
  aw2, ax2, ay2, az2 spat3d asnd, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  ; Convert the 3D sound to stereo.
  aleft = aw2 + ay2
  aright = aw2 - ay2

  outs aleft, aright
endin


</CsInstruments>
<CsScore>

; Table #1 a sine wave.
f 1 0 16384 20 1

; Play Instrument #1 for 5 seconds.
i1  2.0   2.0    46.30321135175497     14.01
i1  4.0   2.0    2.1413276231262435     13.98
i1  6.0   2.0    7.8683834048640655     14.09
i1  8.0   2.0    44.00283889283174     13.47
i1  10.0   2.0    33.407572383073344     13.92
i1  12.0   2.0    34.48275862068972     13.44
i1  14.0   2.0    37.202380952380935     13.94
i1  16.0   2.0    88.9526542324247     12.7
i1  18.0   2.0    1.5748031496062298     12.68
i1  20.0   2.0    35.488958990536275     13.13
i1  22.0   2.0    50.26656511805028     12.47
i1  24.0   2.0    72.1732157177224     13.37
i1  26.0   2.0    28.42183994016456     13.75
i1  28.0   2.0    45.81818181818198     14.38
i1  30.0   2.0    2.781641168289384     14.34
i1  32.0   2.0    34.86750348675039     13.84
i1  34.0   2.0    24.566473988439252     13.5
i1  36.0   2.0    25.92592592592591     13.15
i1  38.0   2.0    36.50190114068441     13.63
i1  40.0   2.0    60.895084372707295     12.8
i1  42.0   2.0    61.71875000000004     12.01
i1  44.0   2.0    1.6652789342215257     12.03
i1  46.0   2.0    4.987531172069737     11.97
i1  48.0   2.0    36.75856307435266     11.53
i1  50.0   2.0    11.274934952298477     11.66
i1  52.0   2.0    12.006861063464935     11.52
i1  54.0   2.0    39.93055555555558     11.98
i1  56.0   2.0    28.380634390651082     11.64
i1  58.0   2.0    30.927835051546502     11.28



e


</CsScore>
</CsoundSynthesizer>