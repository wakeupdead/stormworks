-- Out Bool: 3 - master starter
-- Out Num: 1 - throttle zero level, 2 - throttle
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


status = 0
delay = 50
count = 0
alarm = false

function onTick()
    
    thrZl=pN("Throttle zero level")
    
    
    temp = input.getNumber(8)			 
	rps = input.getNumber(7)
	throttle = input.getNumber(10)
	torqueS = input.getNumber(11)
	rpsS = input.getNumber(12)
	clutch = input.getNumber(13)
	tempMax = input.getNumber(14)
	tempRed = input.getNumber(15)
	rpsMax = input.getNumber(16)
	rpsRed = input.getNumber(17)
	inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)
	isReverse = input.getBool(3)
	overSpeed = false
	overTemp = false

	if temp >= tempRed then
		overTemp = true
		alarm = true
	end
	if rps >= rpsRed then
		overSpeed = true
		alarm = true
	end
	count = count + 1
	if count >= delay then
		count = 0
		if rps <= 2 then
			status = 0
		end
		if rps > 2 and status ~= 1 then
			status = 3
		end
	end
	if isPressed and inStartBox() then
		output.setBool(1, true)
		status = 2
	end
	if isPressed and inStopBox() then
		output.setBool(1, false)
		status = 1
	end
	if status == 2 or 3 then
		output.setBool(4, true) 
	elseif status == 0 or 1 then
		output.setBool(4, false)
	end
	output.setBool(5, alarm)
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
function dStatus()
	screen.setColor(255, 255, 255)
	screen.drawText(2,19, 'STATUS:')
	if status == 0 then
	screen.setColor(255, 0, 0)
	screen.drawText(2,25, 'STOPPED')
	end
	if status == 1 then
	screen.setColor(255, 255, 0)
	screen.drawText(2,25, 'STOPPING')
	end
	if status == 2 then
	screen.setColor(0, 255, 255)
	screen.drawText(2,25, 'STARTING')
	end
	if status == 3 then
	screen.setColor(0, 255, 0)
	screen.drawText(2,25, 'RUNNING')
	end
end
function dStop()
	screen.setColor(20, 20, 20)
	if status == 3 then
		screen.setColor(255, 0, 0)
	end
	screen.drawRectF(w/2, h - 9 , w, 7)
	screen.setColor(255, 255, 255)
	screen.drawText((w/2) + 5, h - 8 , 'STOP')
end
function dStart()
	screen.setColor(20, 20, 20)
	if status == 0 then
		screen.setColor(0, 255, 0)
	end
	screen.drawRectF(0, h - 9 , w / 2, 7)
	screen.setColor(255, 255, 255)
	screen.drawText( 5 , h - 8 , 'START')
end
function inStartBox()
	if inputX > 0 and inputY > h-9 and inputX < (w/2) and inputY < h then
	return true 
	end
end
function inStopBox()
	if inputX > (w/2) and inputY > h-9 and inputX < w and inputY < h then
	return true 
	end
end
function dWarn()
	screen.setColor (255,0,0)
	if overTemp then
	screen.drawText(2, 37, 'OVERHEAT')
	alarm = true
	end
	if overSpeed then
	screen.drawText(2, 43, 'OVERSPEED')
	alarm = true
	end
end









function onTick()
	temp = input.getNumber(8)			 
	rps = input.getNumber(7)
	throttle = input.getNumber(10)
	torqueS = input.getNumber(11)
	rpsS = input.getNumber(12)
	clutch = input.getNumber(13)
	tempMax = input.getNumber(14)
	tempRed = input.getNumber(15)
	rpsMax = input.getNumber(16)
	rpsRed = input.getNumber(17)
	inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)
	isReverse = input.getBool(3)
	
end


function onDraw()
	w = screen.getWidth()				  
	h = screen.getHeight()					
	screen.setColor(0, 255, 0)			 
	dTemp()
	dRps()
	dThr()
end	
function roundTemp()
  local mult = 10^(0)
  return math.floor(temp * mult + 0.5) / mult
end
function roundRps()
  local mult = 10^(0)
  return math.floor(rps * mult + 0.5) / mult
end
function round(value)
  return math.floor(value)
end
function dTemp()
	if temp < tempRed then
	screen.setColor(0, 255, 0)
	end
	if temp >= tempRed then
	screen.setColor(255, 0, 0)
	end
	screen.drawRectF(2,2,((28/tempMax) * temp), 15)
	screen.setColor(255, 255, 255)
	screen.drawText(10,4, 'TEMP')
	screen.drawText(10,10, roundTemp())
	screen.setColor(100,255,100)
	screen.drawRect(2,2,28,15)
end
function dRps()
	if rps < rpsRed then
	screen.setColor(0, 255, 0)
	end
	if rps >= rpsRed then
	screen.setColor(255, 0, 0)
	end
	screen.drawRectF(32,2,((28/rpsMax) * rps), 15)
	screen.setColor(255, 255, 255)
	screen.drawText(40,4, 'RPS')
	screen.drawText(40,10, roundRps())
	screen.setColor(100,255,100)
	screen.drawRect(32,2,28,15)
end
function dThr()
	screen.setColor (255,255,255)
	screen.drawText(2, 31, 'TOR:' .. round(torqueS))
	
	screen.setColor(0,255,0)
	screen.drawLine(w - 5, h - 13 , w - 5 , 20)
	screen.drawTriangleF((w - 6),((h - 13) - (28 * throttle)), (w - 9), ((h - 13) - (28 * throttle)) + 3, (w - 9), ((h - 13) - (28 * throttle)) - 3)
	if isReverse then
		screen.drawText(w - 14, ((h - 13) - (28 * throttle)) - 3, 'R')
	end
end
