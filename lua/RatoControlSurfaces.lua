-- In: 1 - throttle axis, 2 - rudder axis, 3 - side thr axis

iN=input.getNumber
iB=input.getBool
pN=property.getNumber
pB=property.getBool
oN=output.setNumber
oB=output.setBool
ab=math.abs
gw=screen.getWidth				  
gh=screen.getHeight
dc=screen.drawClear
sdl=screen.drawLine
sdtf=screen.drawTriangleF
sdrf=screen.drawRectF
sdt=screen.drawText
sdtb=screen.drawTextBox
ssc=screen.setColor
sf=string.format

function onTick()
	thr = iN(7)
	rudder = iN(8)
	sideThr = iN(9)
	
	sideEn = pB("Enable side axis")
	zeroL = pN("Throttle zero level")
end


function onDraw()

	ssc(0,0,0)
	dc()
		
	ssc(0, 120, 0)	
	if sideEn then		
		sdl(1, 5, 31, 5)
		sdl(16, 5, 16, 3)
		sdtf(16+14*sideThr, 5, 13+14*sideThr, 1, 19+14*sideThr, 1)
	end
	
	cent=8+(1-zeroL)*8
	
	sdl(12, 8, 12, 24)
	sdl(10, cent, 12, cent)
	sdl(20, 8, 20, 24)
	sdl(20, cent, 22, cent)
	sdtf(10, 17-8*thr, 4, 14-8*thr, 4, 20-8*thr)
	sdtf(22, 17-8*thr, 28, 14-8*thr, 28, 20-8*thr)
	
	sdl(1, 31, 31, 31)
	sdl(16, 31, 16, 29)
	sdtf(16+14*rudder, 31, 13+14*rudder, 26, 19+14*rudder, 26)
end