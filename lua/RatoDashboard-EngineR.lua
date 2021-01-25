
-- Out Num: 30 - temp, 31 - rps
-- In Bool: 1 - reverse, 2 - pumps, 3 - master starter, 10-13 - engine starters, 14-17 - engine panel start buttons 
-- In Num: 1 - throttle zero level, 2 - throttle, 3 - throttle out, 4 - clutch, 10-13 - temp, 14-17 - rps eng, 18 - rps on shaft eng, 19 - torque on shaft 

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
    
    
    temp = (iN(10)+iN(12)+iN(13)+iN(14))/4
	rps = (iN(14)+iN(15)+iN(16)+iN(17))/4
	
	oN(30, temp)
	oN(31, rps)
end


function onDraw()
	w = screen.getWidth()				  
	h = screen.getHeight()
	screen.setColor(10, 10, 10)
	screen.drawClear()
						
	screen.setColor(0, 255, 0)
	dStatus()
	dStop()
	dStart()	
	dWarn()
end