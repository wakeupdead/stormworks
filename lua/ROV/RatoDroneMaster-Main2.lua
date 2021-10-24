BL = 0
PD = 0
P = 0
line = screen.drawLine
circle = screen.drawCircle
cos = math.cos
sin = math.sin
rad = math.rad
COL = screen.setColor
WM = true
LiD = math.ceil(15)
function onTick()
	P = -input.getNumber(24)*360
	R = input.getNumber(25)*360
	V = -input.getNumber(19)

	R2 = R-90
	R3 = R+90
	if V < 0
	then 
		 P = P*-1
		 R = R
		 R2 = R2*-1
	else
		 P = P*-1
		 R = R*-1
		 R2 = R2
	end
	RD = rad(R)
	RD2 = rad(R2)
	LD = 25
	SLD = 17
	RC = cos(RD)
	RS = sin(RD)
	RC2 = cos(RD2)
	RC3 = cos(rad(R3))
	RS2 = sin(RD2)
	PRS = P*RS2
	PRC = P*RC2
	MCP = math.ceil(P)
end

function onDraw()
	w = screen.getWidth()
	h = screen.getHeight()
	w2 = w/2
	h2 = h/2
	COL(0,255,255,100)
	if WM
	then
	line(w2,h2,w2-4,h2+3)
	line(w2-4,h2+3,w2-8,h2)
	line(w2-8,h2,w2-26,h2)
	line(w2,h2,w2+4,h2+3)
	line(w2+4,h2+3,w2+8,h2)
	line(w2+8,h2,w2+26,h2)
	end
	circle(w2,h2,10)
	COL(255,0,0,50)
	line(w2-PRC+5*RC,h2-PRS-5*RS,w2-PRC+LD*RC,h2-PRS-LD*RS)
	line(w2-PRC-LD*RC,h2-PRS+LD*RS,w2-PRC-5*RC,h2-PRS+5*RS)

	for PD = -LiD,-90,-LiD do
		if PD+MCP < 25 and PD+P > -25
		then
		COL(0,255,0,50)
		line((w2-PD*RC2)-PRC-7*RC,(h2-PD*RS2)-PRS+7*RS,(w2-PD*RC2)-PRC-SLD*RC,(h2-PD*RS2)-PRS+SLD*RS)
		line((w2-PD*RC2)-PRC+SLD*RC,(h2-PD*RS2)-PRS-SLD*RS,(w2-PD*RC2)-PRC+7*RC,(h2-PD*RS2)-PRS-7*RS)
		line((w2-PD*RC2)-PRC-SLD*RC,(h2-PD*RS2)-PRS+SLD*RS,(w2-PD*RC2)-PRC-SLD*RC-3*RC2,(h2-PD*RS2)-PRS+SLD*RS-3*RS2)
		line((w2-PD*RC2)-PRC+SLD*RC,(h2-PD*RS2)-PRS-SLD*RS,(w2-PD*RC2)-PRC+SLD*RC-3*RC2,(h2-PD*RS2)-PRS-SLD*RS-3*RS2)
		screen.drawText((w2-PD*RC2)-PRC-4*RC,(h2-3-PD*RS2)-PRS,math.abs(PD))
		end
	end
	for PD = LiD,90,LiD do
		if PD+MCP < 25 and PD+P > -25
		then
			for BL = 7, SLD-1, 4 do
				SBL = BL+2
		COL(0,255,0,50)
		line((w2-PD*RC2)-PRC-BL*RC,(h2-PD*RS2)-PRS+BL*RS,(w2-PD*RC2)-PRC-SBL*RC,(h2-PD*RS2)-PRS+SBL*RS)
		line((w2-PD*RC2)-PRC+SBL*RC,(h2-PD*RS2)-PRS-SBL*RS,(w2-PD*RC2)-PRC+BL*RC,(h2-PD*RS2)-PRS-BL*RS)
		line((w2-PD*RC2)-PRC-SLD*RC,(h2-PD*RS2)-PRS+SLD*RS,(w2-PD*RC2)-PRC-SLD*RC+3*RC2,(h2-PD*RS2)-PRS+SLD*RS+3*RS2)
		line((w2-PD*RC2)-PRC+SLD*RC,(h2-PD*RS2)-PRS-SLD*RS,(w2-PD*RC2)-PRC+SLD*RC+3*RC2,(h2-PD*RS2)-PRS-SLD*RS+3*RS2)
		screen.drawText((w2-PD*RC2)-PRC-4*RC,(h2-3-PD*RS2)-PRS,PD)
			end
		end
	end

end