clear all;

load prio_udp_min_10_1;


x=vatc_udp_min_16_2_old(:,1);

display(sprintf('%0.2f',prctile(x,90)));
display(sprintf('%0.2f',prctile(x,95)));
display(sprintf('%0.2f',prctile(x,99)));

f1 = figure;
hold on;

 
%  
% M_old_5 = [vatc_tcp_max_10_1(:,1) vatc_tcp_max_16_1(:,1) vatc_tcp_max_32_1(:,1) vatc_tcp_max_64_1(:,1) vatc_tcp_max_128_1(:,1) ...
%      vatc_tcp_max_256_1(:,1) vatc_tcp_max_512_1(:,1)
%      vatc_tcp_max_1024_1(:,1) vatc_tcp_max_3_1(:,1) vatc_tcp_max_1_1(:,1)];
% 
% %  
x_1=1:8;
x_2=9:10;
%y1 = prctile( M_old_1, 50);
%u1=prctile(M_old_1,95);
%y2 = prctile( M_old_2, 50);
%u2=prctile(M_old_2,95);
y3 = prctile( M_old_3, 50);
u3=prctile(M_old_3,95);
y4 = prctile( M_old_4, 50);
u4=prctile(M_old_4,95);
y5 = prctile( M_old_5, 50);
u5=prctile(M_old_5,95);



% %h1 = plot(x_1,y1(:,1:8)/1000,'-o','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', '-');
% %h2 = plot(x_1,y2(:,1:8)/1000,'s','markersize',10, 'color', 'k', 'linewidth', 1,  'linestyle', '-');
% h3 = plot(x_1,y3(:,1:8)/1000,'p','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', '-');
% h4 = plot(x_1,y4(:,1:8)/1000,'d','markersize',10, 'color', 'k', 'linewidth', 1,  'linestyle', '-');
% h5 = plot(x_1,y5(:,1:8)/1000,'*','markersize',10, 'color', 'r', 'linewidth', 1,  'linestyle', '-');
% 
% %h6 = plot(x_2,y1(:,9:10)/1000,'-o','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', 'none');
% %h7 = plot(x_2,y2(:,9:10)/1000,'s', 'markersize',10,'color', 'k', 'linewidth', 1,  'linestyle', 'none');
% h8 = plot(x_2,y3(:,9:10)/1000,'p','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', 'none');
% h9 = plot(x_2,y4(:,9:10)/1000,'d', 'markersize',10,'color', 'k', 'linewidth', 1,  'linestyle', 'none');
% h10 = plot(x_2,y5(:,9:10)/1000,'*','markersize',10, 'color', 'r', 'linewidth', 1,  'linestyle', 'none');

%h1 = plot(x_1,u1(:,1:8)/1000,'-o','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', '-');
%h2 = plot(x_1,u2(:,1:8)/1000,'s','markersize',10, 'color', 'k', 'linewidth', 1,  'linestyle', '-');
h3 = plot(x_1,u3(:,1:8)/1000,'p','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', '-');
h4 = plot(x_1,u4(:,1:8)/1000,'d','markersize',10, 'color', 'k', 'linewidth', 1,  'linestyle', '-');
h5 = plot(x_1,u5(:,1:8)/1000,'*','markersize',10, 'color', 'r', 'linewidth', 1,  'linestyle', '-');

%h6 = plot(x_2,u1(:,9:10)/1000,'-o','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', 'none');
%h7 = plot(x_2,u2(:,9:10)/1000,'s', 'markersize',10,'color', 'k', 'linewidth', 1,  'linestyle', 'none');
h8 = plot(x_2,u3(:,9:10)/1000,'p','markersize',10, 'color', 'b', 'linewidth', 1,  'linestyle', 'none');
h9 = plot(x_2,u4(:,9:10)/1000,'d', 'markersize',10,'color', 'k', 'linewidth', 1,  'linestyle', 'none');
h10 = plot(x_2,u5(:,9:10)/1000,'*','markersize',10, 'color', 'r', 'linewidth', 1,  'linestyle', 'none');


tx = [8.5 8.5];
ty = [0 20];
h0 = line(tx, ty, 'color', 'k', 'linewidth', 2);
% tx = [6.5 6.5];
% h = line(tx, ty, 'color', 'k', 'linewidth', 3);

%ylabel('Latency (Micro seconds)', 'fontsize', 15);
ylabel('Round-trip Latency ( ms)  ', 'fontsize', 18);
xlabel('Interrupt Interval (\mus)  ', 'fontsize', 18);
%title('Base       Max Size Packet             Min Size Packet    ', 'fontsize', 30);
legend('Prio, Dom0-3.18','FQ\_CoDel, Dom0-3.18','VATC');
%legend('Prio, 50%','FQ\_CoDel, 50%','VATC, 50%','Prio, 95%','FQ\_CoDel, 95%','VATC, 95%');
set(gca, 'XTick', 1:1:10);
set(gca, 'FontSize', 18);
set(gca, 'XTickLabel', {'10','16','32','64','128','256','512','1024','Dyn Cons','Dyn'});
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);



