x = 0:0.1:100;
y1 = normpdf(x,35,10);
y2 = normpdf(x,55,10);

figure(1)
plot(x,y1);
hold on
plot(x,y2);
hold on;
xline(50);
xline(35,'-.');
xline(55,'-.');
legend('H0','H1')
annotation('textarrow',[0.8 0.6],[0.5 0.4],'String','p_{D}')
annotation('textarrow',[0.7 0.55],[0.3 0.15],'String','p_{FA}')
annotation('textarrow',[0.2 0.45],[0.25 0.2],'String','p_{M}')
annotation('textarrow',[0.2 0.35],[0.5 0.4],'String','p_{R}')

xlabel('ECM')

xticks([0 35 50 55 100])
xticklabels({'0','\mu','\lambda','\mu + b','Máx ECM'})