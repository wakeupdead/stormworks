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
sdr=screen.drawRect
sdrf=screen.drawRectF
sdt=screen.drawText
sdtb=screen.drawTextBox
ssc=screen.setColor
sf=string.format

heightOffset=0
flip=false
shHeading=true
	
function onTick()
	hdg=(((1-iN(27))%1)*360)
	
	fwdSpeed=iN(20)
	sideSpeed=iN(21)
	speed=math.sqrt(fwdSpeed^2 + sideSpeed^2)

	zoom=iN(7)
	rotate=iN(6)
	laser=iB(13)
	lDist=iN(9)
end

function onDraw()
	w=screen.getWidth()
	h=screen.getHeight()					
	
	sp=hdg-math.floor(hdg/5)*5
	l=math.ceil((w/2-sp)/5)
	x=w/2-sp-l*5
	v=math.floor(hdg-w/2+x)%360
	
	if flip == true then
		PL = -6
		P1 = 1
		P2 = 0
	else
		PL = 3
		P1 = 0
		P2 = 1
	end
	
	screen.setColor(255, 255, 255, 200)
	while (x<w) do
		if (v/15==math.floor(v/15)) then
			screen.drawLine(x, heightOffset, x, 2+heightOffset)
			if x<w/2-12 or x>w/2+12 or shHeading == false then
				if v==0 then 
					screen.drawText(x-1,PL+heightOffset,"N")
				elseif v==45 then
					screen.drawText(x-4,PL+heightOffset,"NE")
				elseif v==90 then
					screen.drawText(x-1,PL+heightOffset,"E")
				elseif v==135 then
					screen.drawText(x-4,PL+heightOffset,"SE")
				elseif v==180 then
					screen.drawText(x-1,PL+heightOffset,"S")
				elseif v==225 then
					screen.drawText(x-4,PL+heightOffset,"SW")
				elseif v==270 then
					screen.drawText(x-1,PL+heightOffset,"W") 
				elseif v==315 then
					screen.drawText(x-4,PL+heightOffset,"NW") 
				end
			end
		else
			screen.drawLine(x, P1+heightOffset, x, P2+heightOffset)
		end
		x=x+5 v=(v+5)%360
	end
	if shHeading == true then
		screen.setColor(0, 255, 0)
		screen.drawLine(w/2, heightOffset, w/2, 2+heightOffset)
		screen.drawText((w-#(string.format("%.0f", hdg))*5)/2+1, PL+heightOffset, string.format("%.0f", hdg))
	end
	
	ssc(255, 255, 255, 200)
	-- screen.drawCircleF((w/2), h-20, 2)
	-- if math.abs(sideSpeed) > 0.1 then
	-- screen.drawLine(w/2, h-20, (w/2)+sideSpeed*10, h-20)
	-- screen.drawTriangleF((w/2)+sideSpeed*10+6*sign(sideSpeed), h-20, (w/2)+sideSpeed*10, h-23, (w/2)+sideSpeed*10, h-17)
	-- end
	-- if math.abs(fwdSpeed) > 0.1 then
	-- screen.drawLine(w/2, h-20, w/2, (h-20)-fwdSpeed*10)
	-- screen.drawTriangleF(w/2, (h-20)-fwdSpeed*10-6*sign(fwdSpeed), w/2+3, (h-20)-fwdSpeed*10, w/2-3, (h-20)-fwdSpeed*10)
	-- end
	sdr(10, h/2-5, 40, 10)
	ssc(0, 255, 0)
	sdtb(10, h/2-5, 40, 10, sf("%.3f", speed), 0, 0)
	if ab(fwdSpeed) > 0.1 then
		sdl(10, h/2, 10, (h/2)-fwdSpeed*10)
		sdtf(10, (h/2)-fwdSpeed*10-6*sign(fwdSpeed), 13, (h/2)-fwdSpeed*10, 7, (h/2)-fwdSpeed*10)
	end
	
	sdtb(10, h-22,100,8,"Cam zoom: "..sf("%.2f", zoom),-1,0)
	sdtb(10, h-12,100,8,"Cam rotate: "..sf("%.2f", rotate),-1,0)
	sdtb(w-110, h-12,100,8,"Laser dist: "..sf("%.1f", lDist),1,0)
end

function sign(number)
	if number > 0 then
      return 1
   elseif number < 0 then
      return -1
   end
end