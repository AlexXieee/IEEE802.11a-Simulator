function code=coding_conv(seq,flag)
if flag==1
t=poly2trellis(7,[133 171]); 
code = convenc(seq,t); 
else
t=poly2trellis([3 3 3],[7 7 0 4;3 2 7 4;0 2 3 7]);
code = convenc(seq,t); 
end
end
