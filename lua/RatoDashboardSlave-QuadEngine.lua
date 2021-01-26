-- Master in Bool: 3 - master starter
-- Master in Num: 1 - throttle zero level, 2 - throttle
-- Panel / Master out Bool: 1 - reverse, 2 - pumps, 3 - master starter, 10-13 - engine starters, 14-17 - engine panel start buttons 
-- Panel / Master out Num: 3 - throttle out, 4 - clutch, 5 - temp sum, 6 - rps sum, 7 - num of engines, 10-13 - temp, 14-17 - rps eng, 18 - rps on shaft eng, 19 - torque on shaft 

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
			oB(2, true)
			oB(10, true)
			oB(11, true)
			oB(12, true)
			oB(13, true)
		else
			oB(2, false)
			oB(10, false)
			oB(11, false)
			oB(12, false)
			oB(13, false)
		end	 
	end
	mStPrev=mSt
	
	thrZl=iN(1)
	thr = (iN(2) - thrZl) / (1 - thrZl)
	idle = pN("Idle throttle")
	num = pN("Num of eng blocks")
	temp = (iN(10) + iN(11) + iN(12) +iN(13))/num
	rps = (iN(14) + iN(15) + iN(16) +iN(17))/num
	rpsT = pN("RPS clutch threshold")

	if (ab(thr) > idle) then
		cltch = 0.5
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
	
	
	oN(3, ab(outThr))
	oN(4, cltch)
	oB(1, isRev)
	oN(5, temp)
	oN(6, rps)
	oN(7, num)
end