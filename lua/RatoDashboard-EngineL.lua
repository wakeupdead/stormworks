
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

	ssc(0,0,0)
	dc()

	ssc(5,5,5)
	if warn then 
		ssc(0,40,0)
	end
	sdrf(2,2,w2-3,h-12)
	ssc(0,20,0)
	sdtb(2,3,w2-3,7,"Eng L", 0,0)
	
	ssc(0,20,0)
	sdtb(5,12,4,7,"T", -1,0)
	ssc(0,120,0)
	sdtb(9,12,w2-12,7,sf("%.0f",temp), 1,0)
	ssc(0,20,0)
	sdtb(5,20,4,7,"R", -1,0)
	ssc(0,120,0)
	sdtb(9,20,w2-12,7,sf("%.0f",rps), 1,0)
	ssc(0,20,0)
	sdtb(5,28,4,7,"Q", -1,0)
	ssc(0,120,0)
	sdtb(9,28,w2-12,7,sf("%.0f",trq), 1,0)


end










-- function onTick()
-- 	temp = input.getNumber(8)			 
-- 	rps = input.getNumber(7)
-- 	throttle = input.getNumber(10)
-- 	torqueS = input.getNumber(11)
-- 	rpsS = input.getNumber(12)
-- 	clutch = input.getNumber(13)
-- 	tempMax = input.getNumber(14)
-- 	tempRed = input.getNumber(15)
-- 	rpsMax = input.getNumber(16)
-- 	rpsRed = input.getNumber(17)
-- 	inputX = input.getNumber(3)
-- 	inputY = input.getNumber(4)
-- 	isPressed = input.getBool(1)
-- 	isReverse = input.getBool(3)
	
-- end


-- function onDraw()
-- 	w = screen.getWidth()				  
-- 	h = screen.getHeight()					
-- 	screen.setColor(0, 255, 0)			 
-- 	dTemp()
-- 	dRps()
-- 	dThr()
-- end	
-- function roundTemp()
--   local mult = 10^(0)
--   return math.floor(temp * mult + 0.5) / mult
-- end
-- function roundRps()
--   local mult = 10^(0)
--   return math.floor(rps * mult + 0.5) / mult
-- end
-- function round(value)
--   return math.floor(value)
-- end
-- function dTemp()
-- 	if temp < tempRed then
-- 	screen.setColor(0, 255, 0)
-- 	end
-- 	if temp >= tempRed then
-- 	screen.setColor(255, 0, 0)
-- 	end
-- 	screen.drawRectF(2,2,((28/tempMax) * temp), 15)
-- 	screen.setColor(255, 255, 255)
-- 	screen.drawText(10,4, 'TEMP')
-- 	screen.drawText(10,10, roundTemp())
-- 	screen.setColor(100,255,100)
-- 	screen.drawRect(2,2,28,15)
-- end
-- function dRps()
-- 	if rps < rpsRed then
-- 	screen.setColor(0, 255, 0)
-- 	end
-- 	if rps >= rpsRed then
-- 	screen.setColor(255, 0, 0)
-- 	end
-- 	screen.drawRectF(32,2,((28/rpsMax) * rps), 15)
-- 	screen.setColor(255, 255, 255)
-- 	screen.drawText(40,4, 'RPS')
-- 	screen.drawText(40,10, roundRps())
-- 	screen.setColor(100,255,100)
-- 	screen.drawRect(32,2,28,15)
-- end
-- function dThr()
-- 	screen.setColor (255,255,255)
-- 	screen.drawText(2, 31, 'TOR:' .. round(torqueS))
	
-- 	screen.setColor(0,255,0)
-- 	screen.drawLine(w - 5, h - 13 , w - 5 , 20)
-- 	screen.drawTriangleF((w - 6),((h - 13) - (28 * throttle)), (w - 9), ((h - 13) - (28 * throttle)) + 3, (w - 9), ((h - 13) - (28 * throttle)) - 3)
-- 	if isReverse then
-- 		screen.drawText(w - 14, ((h - 13) - (28 * throttle)) - 3, 'R')
-- 	end
-- end
