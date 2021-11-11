iN=input.getNumber
iB=input.getBool
pN=property.getNumber
pB=property.getBool
oN=output.setNumber
oB=output.setBool
ab=math.abs
fl=math.floor
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

pThr=0
desDepth=0
pHold=false
counter=0
delta=0.25

function onTick()
	thr=iN(4)
	alt=iN(32)
	hold=iB(32)
	oThr=0

	if (ab(thr)==1 and hold==true) then
		desDepth=desDepth + thr*delta
		counter=0
	end

	if (hold==false) then
		desDepth=0
		oThr=thr
	end

	if (pHold==false and hold==true) then
		desDepth=fl(alt)
	end

	oN(3,desDepth)
	oN(17,oThr)

	pHold=hold
	pThr=thr
	counter=counter+1
	if (counter==11) then
		counter=0
	end
end

