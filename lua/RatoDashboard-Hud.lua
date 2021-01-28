--
-- Num: 1- Fuel R, 2 - Fuel R, 3 - cap fuel L, 4 - cap fuel R, 5- battery, 6- gen L1, 7-gen L2, 8 - gen R1, 9 - gen R2, 10 - speed, 11 - gps x, 12 - gps y, 13 - compass, 14 -time, 15 - timer
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
fuelPrev=0
timePrev=0
i=0
interval=300
remDist=0
remTime=0
consumption=0
consumptionDist=0
	
function onTick()
	hdg=(((1-iN(13))%1)*360)
	speed = iN(10)*1.94384
	speedMs = iN(10)

	i=i+1
	if (i > interval) then
		i=0

		fuel=iN(1)+iN(2)
		time=iN(15)

		consumption=(fuelPrev-fuel)/(time-timePrev) -- L per sec
		consumptionDist=(consumption*1000)/speedMs -- L per km
		remTime=fuel/(consumption*60) -- minutes
		remDist=speedMs*remTime*60/1000 -- km

		if (speed < 2) then
			remTime = 0
			remDist = 0
			consumptionDist = 0
		end

		fuelPrev = fuel
		xPrev = x
		yPrev = y
		timePrev = time
	end
end

function onDraw()
	w=gw()
	h=gh()
	
	ssc(0,0,0)
	dc()					
	
	sp=hdg-math.floor(hdg/5)*5
	l=math.ceil((w/2-sp)/5)
	x=w/2-sp-l*5
	v=math.floor(hdg-w/2+x)%360
	
	PL = 3
    P1 = 0
    P2 = 1
	
	ssc(0,120,0)
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
		ssc(0,120,0)
		sdl(w/2, heightOffset, w/2, 2+heightOffset)
		sdt((w-#(sf("%.0f", hdg))*5)/2+1, PL+heightOffset, sf("%.0f", hdg))
	end
	
	-- ssc(5,5,5)
	-- sdrf(3, 13, 58, 9)
	ssc(0,120,0)
	sdtb(4, 14, 56, 7, "SPEED", -1, 0)
	sdtb(4, 14, 56, 7, sf("%02.1f", ab(speed)), 1, 0)
	ssc(0,80,0)
	if speed > 0 then
		sdtf(31, 21, 37, 21, 34, 14)
	end
	if speed < 0 then
		sdtf(31, 14, 37, 14, 34, 21)
	end
    
    -- Fuel consumption
	ssc(0,120,0)
	sdtb(4, 30, 56, 7, "RMD", -1, 0)
	sdtb(4, 30, 56, 7, sf("%.0f km", remDist), 1, 0)
	sdtb(4, 38, 56, 7, "RMT", -1, 0)
	sdtb(4, 38, 56, 7, sf("%.0f min", remTime), 1, 0)
	sdtb(4, 46, 56, 7, "C", -1, 0)
	sdtb(4, 46, 56, 7, sf("%.0f L/km", consumptionDist), 1, 0)
end
	
function distance( x1, y1, x2, y2 )
	return math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
end

