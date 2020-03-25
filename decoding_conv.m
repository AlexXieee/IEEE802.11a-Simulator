function seq=decoding_conv(code,flag)
if flag ==1
t=poly2trellis(7,[133 171]); 
seq = vitdec(code,t,7,'trunc','hard');
else
t=poly2trellis([3 3 3],[7 7 0 4;3 2 7 4;0 2 3 7]);
seq = vitdec(code,t,3,'trunc','hard');
end
end