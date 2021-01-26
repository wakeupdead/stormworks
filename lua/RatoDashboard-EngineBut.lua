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
    
	if isPressed and inButtonBox() and statusL == 0 and statusR == 0 then
		oB(3, true)
        statusL = 2
        statusR = 2
	end
	if isPressed and inButtonBox() and statusL == 3 and statusR == 3 then
		oB(3, false)
        statusL = 1
        statusR = 1
	end
end

function onDraw()
	
	w = gw()				  
	h = gh()
	h2 = h/2
	w2 = w/2
	
	ssc(0, 180, 0)
	if statusL == 0 and statusR == 0 then
		ssc(5, 5, 5)
	end
	sdrf(3, h - 9 , w-6, 9)
	ssc(0, 0, 0)
	sdtb(3, h - 9 , w-6, 9, "ENGINE ON", 0, 0)

	if statusL == 1 and statusR == 1 then
		ssc(0,0,0)
		sdrf(0, h - 9 , w, 9)
		ssc(5,5,5)
		sdtb(0, h - 9 , w, 9, "STOPPING", 0, 0)
	end
	if statusL == 2 and statusR == 2 then
		ssc(0,0,0)
		sdrf(0, h - 9 , w, 9)
		ssc(5,5,5)
		sdtb(0, h - 9 , w, 9, "STARTING", 0, 0)
	end
	
	-- dStop()
	-- dStart()	
	--dWarn()
	-- dStatus()
end

function inButtonBox()
	if inputX > 0 and inputY > h-9 and inputX < (w) and inputY < h then
		return true 
	end
end

-- function dStatus()
-- 	-- if status == 0 then
-- 	-- ssc(255, 0, 0)
-- 	-- sdt(2,25, 'STOPPED')
-- 	-- end
-- 	if status == 1 then
-- 		ssc(,5,5)
-- 		sdrf(0, h - 9 , w, 9)
-- 		ssc(0, 0, 0)
-- 		sdtb(0, h - 9 , w, 9, "STOPPING", 0, 0)
-- 	end
-- 	if status == 2 then
-- 		ssc(5,5,5)
-- 		sdrf(0, h - 9 , w, 9)
-- 		ssc(0, 0, 0)
-- 		sdtb(0, h - 9 , w, 9, "STARTING", 0, 0)
-- 	end
-- 	-- if status == 3 then
-- 	-- ssc(0, 255, 0)
-- 	-- sdt(2,25, 'RUNNING')
-- 	-- end
-- end

-- -- function dWarn()
-- -- 	ssc (255,0,0)
-- -- 	if overTemp then
-- -- 	sdt(2, 37, 'OVERHEAT')
-- -- 	alarm = true
-- -- 	end
-- -- 	if overSpeed then
-- -- 	sdt(2, 43, 'OVERSPEED')
-- -- 	alarm = true
-- -- 	end
-- -- end

-- function dStop()
-- 	ssc(0, 180, 0)
-- 	if statusL == 3 and statusR == 3 then
-- 		ssc(5, 5, 5)
-- 	end
-- 	sdrf(w2+1, h - 9 , w2-1, 9)
-- 	ssc(0, 0, 0)
-- 	sdtb(w2, h - 9 , w2-1, 9, "STOP", 0, 0)
-- end
-- function dStart()
	
-- 	ssc(0, 180, 0)
-- 	if statusL == 0 and statusR == 0 then
-- 		ssc(5, 5, 5)
-- 	end
-- 	sdrf(0, h - 9 , w2-1, 9)
-- 	ssc(0, 0, 0)
-- 	sdtb(0, h - 9 , w2-1, 9, "START", 0, 0)
-- end

-- function inStartBox()
-- 	if inputX > 0 and inputY > h-9 and inputX < (w/2) and inputY < h then
-- 	return true 
-- 	end
-- end
-- function inStopBox()
-- 	if inputX > (w/2) and inputY > h-9 and inputX < w and inputY < h then
-- 	return true 
-- 	end
-- end