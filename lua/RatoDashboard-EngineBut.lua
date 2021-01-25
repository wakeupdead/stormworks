-- Out Bool: 3 - master starter
-- Out Num: 1 - throttle zero level, 2 - throttle
-- In Bool: touch
-- In Num: touch, 28 - temp L, 29 - rps L, 30 - temp R, 31 - rps R, 32 - throttle

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

statusL = 0
statusR = 0
delay = 50
count = 0
alarm = false

function onTick()
    inputX = iN(3)
	inputY = iN(4)
	isPressed = iB(1)

    thrZl=pN("Throttle zero level")
    thr = iN(32)
    rpsL=iN(29)
    rpsR=iN(31)

    oN(1, thrZl)
    oN(2, thr)


    -- overSpeed = false
	-- overTemp = false

	-- if temp >= tempRed then
	-- 	overTemp = true
	-- 	alarm = true
	-- end
	-- if rps >= rpsRed then
	-- 	overSpeed = true
	-- 	alarm = true
	-- end
	count = count + 1
	if count >= delay then
		count = 0
		if rpsL <= 2 then
			statusL = 0
		end
		if rpsL > 2 and statusL ~= 1 then
			statusL = 3
        end
        if rpsR <= 2 then
			statusR = 0
		end
		if rpsR > 2 and statusR ~= 1 then
			statusR = 3
		end
    end
    
	if isPressed and inStartBox() then
		oB(3, true)
        statusL = 2
        statusR = 2
	end
	if isPressed and inStopBox() then
		oB(3, false)
        statusL = 1
        statusR = 1
	end
end

function onDraw()
	w = screen.getWidth()				  
	h = screen.getHeight()
	screen.setColor(10, 10, 10)
	screen.drawClear()
						
	screen.setColor(0, 255, 0)
	--dStatus()
	dStop()
	dStart()	
	--dWarn()
end

-- function dStatus()
-- 	screen.setColor(255, 255, 255)
-- 	screen.drawText(2,19, 'STATUS:')
-- 	if status == 0 then
-- 	screen.setColor(255, 0, 0)
-- 	screen.drawText(2,25, 'STOPPED')
-- 	end
-- 	if status == 1 then
-- 	screen.setColor(255, 255, 0)
-- 	screen.drawText(2,25, 'STOPPING')
-- 	end
-- 	if status == 2 then
-- 	screen.setColor(0, 255, 255)
-- 	screen.drawText(2,25, 'STARTING')
-- 	end
-- 	if status == 3 then
-- 	screen.setColor(0, 255, 0)
-- 	screen.drawText(2,25, 'RUNNING')
-- 	end
-- end

-- function dWarn()
-- 	screen.setColor (255,0,0)
-- 	if overTemp then
-- 	screen.drawText(2, 37, 'OVERHEAT')
-- 	alarm = true
-- 	end
-- 	if overSpeed then
-- 	screen.drawText(2, 43, 'OVERSPEED')
-- 	alarm = true
-- 	end
-- end

function dStop()
	screen.setColor(20, 20, 20)
	if statusL == 3 and statusR == 3 then
		screen.setColor(255, 0, 0)
	end
	screen.drawRectF(w/2, h - 9 , w, 7)
	screen.setColor(255, 255, 255)
	screen.drawText((w/2) + 5, h - 8 , 'STOP')
end
function dStart()
	screen.setColor(20, 20, 20)
	if statusL == 0 and statusR == 0 then
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