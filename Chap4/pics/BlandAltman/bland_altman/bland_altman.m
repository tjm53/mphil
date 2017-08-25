function bland_altman(A,B)
%reference: Y H Chan, Biostatistics 104:
%Correlational Analysis,
%Singapore Med J 2003 Vol 44(12) : 614-619

meanAB=(A+B)./2;
difff=A-B;
meanDiff=mean(difff);
stdDiff=std(difff);

meanp2D=meanDiff+1.96*stdDiff;
meanm2D=meanDiff-1.96*stdDiff;
n=length(difff);
minD=min(meanAB)-0.1;
maxD=max(meanAB)+0.1;

%figure;
plot(meanAB,difff,'ok')
hold on;
plot([minD; maxD],ones(1,2)*meanp2D,'--r');
%text(minD+0.01,meanp2D+0.02,'Mean_{diff} + 1.96xSD_{diff}','Color','r');
hold on;
plot([minD; maxD],ones(1,2)*meanm2D,'--r');
%text(minD+0.01,meanm2D-0.04,'Mean_{diff} - 1.96xSD_{diff}','Color','r');
hold on;
plot([minD; maxD],ones(1,2)*meanDiff,'-.b');
%text(minD+0.01,0.01,'Mean_{diff}','Color','b');

xlim([minD maxD]);
xlabel('(Simu+Spir)/2');
ylabel('Simu-Spir');