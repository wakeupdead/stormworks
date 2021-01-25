--
-- Num: 1- Fuel R, 2 - Fuel R, 3 - cap fuel L, 4 - cap fuel R, 5- battery, 6- gen L1, 7-gen L2, 8 - gen R1, 9 - gen R2, 10 - speed, 11 - gps x, 12 - gps y, 13 - compass
-- Bool: 

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

speed = 0
heightOffset=2
shHeading=true
	
function onTick()
	hdg=(((1-iN(13))%1)*360)
	speed = iN(10)*1.94384
end

function onDraw()
	w=gw()
	h=gh()
	
	ssc(60,60,60)
	dc()					
	
	sp=hdg-math.floor(hdg/5)*5
	l=math.ceil((w/2-sp)/5)
	x=w/2-sp-l*5
	v=math.floor(hdg-w/2+x)%360
	
	PL = 3
    P1 = 0
    P2 = 1
	
	ssc(0,0,0,230)
	while (x<w) do
		if (v/15==math.floor(v/15)) then
			sdl(x, heightOffset, x, 2+heightOffset)
			if x<w/2-12 or x>w/2+12 or shHeading == false then
				if v==0 then 
					sdt(x-1,PL+heightOffset,"N")
				elseif v==45 then
					sdt(x-4,PL+heightOffset,"NE")
				elseif v==90 then
					sdt(x-1,PL+heightOffset,"E")
				elseif v==135 then
					sdt(x-4,PL+heightOffset,"SE")
				elseif v==180 then
					sdt(x-1,PL+heightOffset,"S")
				elseif v==225 then
					sdt(x-4,PL+heightOffset,"SW")
				elseif v==270 then
					sdt(x-1,PL+heightOffset,"W") 
				elseif v==315 then
					sdt(x-4,PL+heightOffset,"NW") 
				end
			end
		else
			sdl(x, P1+heightOffset, x, P2+heightOffset)
		end
		x=x+5 v=(v+5)%360
	end
	if shHeading == true then
		ssc(0,0,0,220)
		sdl(w/2, heightOffset, w/2, 2+heightOffset)
		sdt((w-#(string.format("%.0f", hdg))*5)/2+1, PL+heightOffset, string.format("%.0f", hdg))
	end
	
	ssc(0,0,0,220)
	sdtb(2, 14, 60, 7, "SPEED", -1, 0)
	sdtb(2, 14, 60, 7, string.format("%02.1f", speed), 1, 0)
	if speed > 0 then
		sdtf(36, 21, 42, 21, 39, 14)
	end
	if speed < 0 then
		sdtf(36, 14, 42, 14, 39, 21)
	end
    
    -- Fuel consumption
	
end
	


