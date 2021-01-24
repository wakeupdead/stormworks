-- Master in Bool: 3 - master starter
-- Master in Num: 1 - throttle zero level, 2 - throttle
-- Panel / Master out Bool: 1 - reverse, 2 - pumps, 3 - master starter, 10-13 - engine starters, 14-17 - engine panel start buttons 
-- Panel / Master out Num: 1 - throttle zero level, 2 - throttle, 3 - throttle out, 4 - clutch, 10-13 - temp, 14-17 - rps eng, 18 - rps on shaft eng, 19 - torque on shaft 

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

outThr = 0
cltch = 0
isRev = false
mStPrev=false

function onTick()

	mSt = iB(3)
	if (mStPrev ~= mSt) then
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
	end
	mStPrev=mSt
	
	thrZl=iN(1)
	thr = (iN(2) - thrZl) / (1 - thrZl)
	idle = pN("Idle throttle")
	rps = (iN(14) + iN(15) + iN(16) +iN(17))/4
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
		outThr = thr / 3
	else
		isRev = false
	end
	
	
	oN(3, ab(outThr))
	oN(4, cltch)
	oB(1, isRev)
end