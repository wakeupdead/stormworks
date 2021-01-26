
-- Out Num: 30 - temp, 31 - rps
-- In Bool: 1 - reverse, 2 - pumps, 3 - master starter, 10-13 - engine starters, 14-17 - engine panel start buttons 
-- In Num: 3 - throttle out, 4 - clutch, 5 - temp sum, 6 - rps sum, 7 - num of engines, 10-13 - temp, 14-17 - rps eng, 18 - rps on shaft eng, 19 - torque on shaft 

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


warn = false

function onTick()
	
	tempW=pN("Temp warning")
	rpsW=pN("RPS warning")
    
    temp = iN(5)
	rps = iN(6)
	trq=iN(19)

	if (temp > tempW or rps > rpsW) then
		warn = true
	else
		warn = false
	end
	
	oN(30, temp)
	oN(31, rps)
end


function onDraw()
	w = gw()				  
	h = gh()
	h2 = h/2
	w2 = w/2

	ssc(5,5,5)
	if warn then 
		ssc(0,40,0)
	end
	sdrf(w2+1,2,w2-3,h-12)
	ssc(0,120,0)
	sdtb(w2+1,3,w2-3,7,"Eng R", 0,0)
	sdtb(w2+4,12,w2-6,7,sf("T %.0f",temp), -1,0)
	sdtb(w2+4,20,w2-6,7,sf("R %.0f",rps), -1,0)
	sdtb(w2+4,28,w2-6,7,sf("T %.0f",trq), -1,0)
end

