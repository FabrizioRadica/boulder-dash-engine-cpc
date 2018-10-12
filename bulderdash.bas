1 'Boulder Dash Engine - SLOW VERSION but most accurate.
2 '2018 - Fabrizio Radica 
10 mode 1:pen 5:mx%=20:my%=11:DIM map%(mx%,my%):movx%=2:movy%=3:XOROn$=CHR$(23)+CHR$(1):XOROff$=CHR$(23)+CHR$(0)
100 'Read Map
110 FOR y%=1 TO my%
115 FOR x%=1 TO mx%
120 READ a%:map%(x%,y%)=a%
125 LOCATE x%,y%
130 if map%(x%,y%)=1 then print CHR$(143);:
135 if map%(x%,y%)=2 then print CHR$(207);:
140 if map%(x%,y%)=3 then print CHR$(231);:
145 NEXT x%
150 NEXT y%
160 locate 1,16:Print "Boulder Dash Engine"
165 Locate 1,17:print "Fabrizio Radica - www.retroacademy.it"

180 map%(movx%,movy%+1)=0:locate movx%,movy%:?chr$(249);: 'Start player position

400 while 1 'Main Loop
450 gosub 2000 'Call player movements
660 FOR y%=1 TO my%-1
670 FOR x%=1 TO mx%
675 'Check Rock collision and redraw the array map.
720 if map%(x%,y%)=3 AND map%(x%,y%+1)=0 then locate x%,y%:?chr$(32);:map%(x%,y%)=0:ry%=ry%+1:mry%=y%+ry%:locate x%,mry%:PEN 5:?chr$(231);:map%(x%,mry%)=3:ry%=0
730 next
750 next
800 wend

1000 'Map Data
1010 DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
1020 DATA 1,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
1030 DATA 1,2,3,3,3,2,2,2,2,3,3,2,2,2,2,2,2,2,2,1
1040 DATA 1,2,2,2,2,2,2,2,2,2,3,3,3,3,2,2,2,2,2,1
1050 DATA 1,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,1
1060 DATA 1,2,3,3,3,3,2,2,2,2,2,2,3,3,3,3,2,2,2,1
1070 DATA 1,2,2,2,2,2,2,2,2,2,3,3,3,2,2,2,2,2,2,1
1080 DATA 1,2,2,2,2,2,2,3,2,2,2,2,2,2,2,3,3,2,2,1
1090 DATA 1,2,2,2,2,3,3,3,2,2,2,2,2,2,2,2,2,2,2,1
1100 DATA 1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
1110 DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

1999 'Player Movements and collisions check.
2000 IF NOT(INKEY(1)) AND (NOT(map%(movx%+1,movy%)=1) AND NOT(map%(movx%+1,movy%)=3)) then locate movx%,movy%:print chr$(32);:map%(movx%,movy%)=0:movx%=movx%+1:gosub 3000
2100 IF NOT(INKEY(8)) AND (NOT(map%(movx%-1,movy%)=1) AND NOT(map%(movx%-1,movy%)=3)) then locate movx%,movy%:print chr$(32);:map%(movx%,movy%)=0:movx%=movx%-1:gosub 3000
2200 IF NOT(INKEY(0)) AND (NOT(map%(movx%,movy%-1)=1) AND NOT(map%(movx%,movy%-1)=3)) THEN locate movx%,movy%:print chr$(32);:map%(movx%,movy%)=0:movy%=movy%-1:gosub 3000
2300 IF NOT(INKEY(2)) AND (NOT(map%(movx%,movy%+1)=1) AND NOT(map%(movx%,movy%+1)=3)) THEN locate movx%,movy%:print chr$(32);:map%(movx%,movy%)=0:movy%=movy%+1:gosub 3000
2400 return

3000 sound 1,900,1,15,1:locate movx%,movy%:pen 6:print CHR$(249):return 'Player