--
-- Num: 1- Fuel L, 2 - Fuel R, 3 - cap fuel L, 4 - cap fuel R, 5- battery, 6- gen L1, 7-gen L2, 8 - gen R1, 9 - gen R2, 10 - speed, 11 - gps x, 12 - gps y, 13 - compass
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

prevBat = 1
isDraining = true

function onTick()
    bat = iN(5)
    if (prevBat > bat) then
        isDraining = true
    else
        isDraining = false
    end
	gen = iN(6) + iN(7) + iN(8) + iN(9)
	fuelL = iN(1)
    fuelR = iN(2)
    cFuelL = iN(3)
	cFuelR = iN(4)
end

function onDraw()
	w = gw()				  
	h = gh()
	ssc(0,0,0)
	dc()
                
    ssc(0,120,0)
    sdtb(3,3,60,7,"Bat", -1,0)
    sdtb(3,3,60,7,sf("%.0f%%",bat*100), 1,0)
	if isDraining then
        sdtf(36, 3, 42, 3, 39, 10)
    else
        sdtf(36, 10, 42, 10, 39, 3)
	end
	
	sdtb(3,10,60,7,"Gen", -1,0)
    sdtb(3,10,60,7,sf("%02.1f",gen), 1,0)

    sdtb(3,20,60,7,"Fuel L", -1,0)
    sdtb(3,20,60,7,sf("%.0f%%",fuelL*100/cFuelL), 1,0)
    sdtb(3,30,60,7,sf("%.0f L",fuelL), 1,0)
	
    sdtb(3,40,60,7,"Fuel R", -1,0)
    sdtb(3,40,60,7,sf("%.0f%%",fuelR*100/cFuelR), 1,0)
    sdtb(3,50,60,7,sf("%.0f L",fuelR), 1,0)
    
end