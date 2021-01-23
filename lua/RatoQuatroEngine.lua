iN=input.getNumber
iB=input.getBool
pN=property.getNumber
pB=property.getBool
oN=output.setNumber
oB=output.setBool
sdl=screen.drawLine
sdtf=screen.drawTriangleF
sdrf=screen.drawRectF
ssc=screen.setColor
ab=math.abs

idle = 0.1
outThr = 0
cltch = 0
isRev = false
rpsT = 5

-- Out bool: 1-4 - engine starters, 5 - reverse, 6 - pumps
-- Out num: 30 - outThrottle, 31 - clutch
-- In bool: 7 - master starter, 11-14 - panel start buttons
-- In num: 1-6 touchscreen, 13 - idle throttle, 10 - throttle, 14 - max temp, 15 - red temp, 16 - max rps, 17 - red rps, 20-23 - temp, 24-27 - rps, 28 - rps on shaft, 29 - torque on shaft

function onTick()

	mSt = true --fix
	if (mSt) then
		oB(6, true)
		oB(1, true)
		oB(2, true)
		oB(3, true)
		oB(4, true)
	else
		oB(6, false)
		oB(1, false)
		oB(2, false)
		oB(3, false)
		oB(4, false)
	end	 
	
	thrZl=pN("Throttle zero level")
	thr = (iN(10) - thrZl) / (1 - thrZl)
	idle = iN(13)
	rps = (iN(24) + iN(25) + iN(26) +iN(27))/4
	rpsT = pN("RPS clutch threshold")

	if (ab(thr) > idle) then
		cltch = 0.2
		if (ab(rps)>rpsT) then
			cltch = 1
		end
		outThr = thr
	else
		cltch = 0
		outThr = 0
	end
	if thr < 0 then
		isRev = true
	else
		isRev = false
	end
	
	
	oN(30, ab(outThr))
	oN(31, cltch)
	oB(5, isRev)
end