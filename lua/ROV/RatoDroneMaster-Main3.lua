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
	alt=input.getNumber(32)
	desAlt=input.getNumber(3)
	vSpeed=input.getNumber(19)
	dBottom=input.getNumber(18)
	holdD=iB(3)
end

function onDraw()
	w=screen.getWidth()
	h=screen.getHeight()					
	
	sp=alt-math.floor(alt/50)*50
	l=math.ceil((h/2-sp)/50)
	x=20 --h/2-sp-l*80
	v=math.floor(alt+h/8-x/4)
	
	PL = 35
	P1 = 0
	P2 = 1
	offset = 30
	
	screen.setColor(255, 255, 255, 200)
	while (x<h-20) do
		if (v/5==math.floor(v/5)) then
			screen.drawLine(w-offset, x, w-offset-4, x)
			if x<h/2-6 or x>h/2+6 then
				if v/10==math.floor(v/10) then 
					screen.drawTextBox(w-offset-PL, x-3, PL-10, 7, string.format("%.0f", v), 1, 0) 
				end
			end
		else
			screen.drawLine(w-offset-P1, x, w-offset-P2, x)
		end
		if (v==desAlt and holdD==true) then
			screen.setColor(0, 255, 200)
			screen.drawTextBox(w-offset+2, x-3, PL-10, 7, string.format("%.2f", v), 1, -1) 
			screen.drawTriangleF(w-offset+1, x, w-offset+7, x-5, w-offset+7, x+5)
			screen.setColor(255, 255, 255, 200)
		end
		if (v==math.floor(-dBottom+alt)) then
			screen.setColor(0, 40, 120,180)
			screen.drawLine(w-offset-2, x, w-offset+PL-10, x)
			screen.drawLine(w-offset-2, x+1, w-offset+PL-10, x+1)
			screen.setColor(255, 255, 255, 200)
		end
		x=x+1 v=(v-1/4)
	end
	screen.setColor(0, 255, 0)
	screen.drawLine(w-offset, h/2, w-offset-3, h/2)
	screen.drawTriangleF(w-offset-6, (h/2)-5, w-offset-6, (h/2)+5, w-offset, h/2)
	screen.drawTextBox(w-offset-PL, (h/2)-3, PL, 7, string.format("%.2f", alt), -1, -1)
	
	if (vSpeed < -0.1) then
		screen.setColor(150, 255, 0, 120)
		screen.drawLine(w-offset, h/2, w-offset, (h/2)+vSpeed*40)
		screen.drawTriangleF(w-offset-3, (h/2)+vSpeed*40, w-offset+3, (h/2)+vSpeed*40, w-offset, (h/2)+vSpeed*40-6)
	end
	if (vSpeed > 0.1) then
		screen.setColor(150, 255, 0, 120)
		screen.drawLine(w-offset, h/2, w-offset, (h/2)+vSpeed*40)
		screen.drawTriangleF(w-offset-3, (h/2)+vSpeed*40, w-offset+3, (h/2)+vSpeed*40, w-offset, (h/2)+vSpeed*40+6)
	end
end