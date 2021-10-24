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
	thr=getN(1)*100
	head=getN(4)

end

function onDraw()
	w = screen.getWidth()				 
	h = screen.getHeight()
	
	C(0,100,0)
	dst(1,1,"STATS",3)
	dst(1,20,"Throttle:",1)

	--dst(x,y,text,size=1,rotation=1,is_monospace=false)
	--rotation can be between 1 and 4
end

drf=screen.drawRectF
pgt=property.getText

FONT=pgt("FONT1")..pgt("FONT2")
FONT_D={}
FONT_S=0
for n in FONT:gmatch("....")do FONT_D[FONT_S+1]=tonumber(n,16)FONT_S=FONT_S+1 end
function dst(x,y,t,s,r,m)s=s or 1
r=r or 1
if r>2then t=t:reverse()end
t=t:upper()for c in t:gmatch(".")do
ci=c:byte()-31if 0<ci and ci<=FONT_S then
for i=1,15 do
if r>2 then p=2^i else p=2^(16-i)end
if FONT_D[ci]&p==p then
xx,yy=((i-1)%3)*s,((i-1)//3)*s
if r%2==1then drf(x+xx,y+yy,s,s)else drf(x+5-yy,y+xx,s,s)end
end
end
if FONT_D[ci]&1==1 and not m then
i=2*s
else
i=4*s
end
if r%2==1then x=x+i else y=y+i end
end
end
end