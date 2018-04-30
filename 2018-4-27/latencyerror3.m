clear all;
load latency1;
load latency2;
load latency3;
load latency4;
load latency5;

load latency10;
load latency11;

load latency23;
load latency21;
load latency22;
load latency02;
load latency24;

load latency29;
load latency30;
load latency36;
load latency31;

load latency37;
load latency38;
load latency39;
load latency40;
% 

f1 = figure;
hold on;

% M1=[latency97(5000:25000,11)/1000000 latency95(5000:25000,11)/1000000 latency99(5000:25000,11)/1000000 ...
%     latency101(5000:25000,11)/1000000 latency103(5000:25000,11)/1000000 latency78(5000:25000,11)/1000000 ];

%    M1=[latency31(10001:50000,12)/1000000 latency32(10001:50000,12)/1000000 ...
%        latency28(10001:50000,12)/1000000 latency55(10001:50000,12)/1000000 ...
%        latency56(10001:50000,12)/1000000 latency23(10001:50000,12)/1000000];

   M1=[latency37(10001:50000,12)/1000000 latency38(10001:50000,12)/1000000 ...
        latency39(10001:50000,12)/1000000, latency40(10001:50000,12)/1000000];
% 
% M4=[latency0_36(1001:5000,1)/1000000 latency0_37(1001:5000,1)/1000000 latency0_36(1001:5000,1)/1000000  ...
%     latency0_37(1001:5000,1)/1000000 latency0_21(1001:5000,1)/1000000 latency0_21(1001:5000,1)/1000000 ];

% M4=[ee_1_320_2d_2(3000:13000,:)/1000000 ee_1_330_2d_2(3000:13000,:)/1000000 ee_1_340_2d_2(3000:13000,:)/1000000 ...
%     ee_1_350_2d_2(3000:13000,:)/1000000 ee_1_360_2d_2(3000:13000,:)/1000000];

x=[1 2 3 4]
% x1=[1]
% y_11= mean(B1)
% %e_1 = std( M1, 0, 1);
% L11=prctile(B1, 5)
% U11=prctile(B1, 95)

% y_12= mean(B2)
% %e_1 = std( M1, 0, 1);
% L12=prctile(B2, 5)
% U12=prctile(B2, 95)

%y_1 = median( M1);
%y_1= mean(M1)
%e_1 = std( M1, 0, 1);
L1=prctile(M1, 50)
U1=prctile(M1, 99)
A1= mean(M1)
% L2=prctile(M2, 50)
% U2=prctile(M2, 99)
% A2= mean(M2)
% 
% L3=prctile(M3, 50)
% U3=prctile(M3, 99)
% A3= mean(M3)
% L4=prctile(M4, 50)
% U4=prctile(M4, 99)
% A4= mean(M4)

%y_2 = median( M2);
%y_2 = mean( M2);
%e_2 = std( M2, 0, 1);
% 
% %y_3 = median( M3);
% y_3 = mean( M3);
% %e_3 = std( M3, 0, 1);
% L3=prctile(M3, 5)
% U3=prctile(M3, 95)
% 
% %y_4 = median( M4);
% y_4 = mean( M4);
% %e_4 = std( M4, 0, 1);
% L4=prctile(M4, 5)
% U4=prctile(M4, 95)

% h11 = errorbar(x1, log2(y_11), log2(L11),log2(U11), 'color', 'b','marker', 's', 'markersize',10,'linewidth', 1,  'linestyle', '-');
% h12 = errorbar(x1, log2(y_12), log2(L12),log2(U12), 'color', 'b', 'marker', 'x','markersize',10,'linewidth', 1,  'linestyle', '--');
% 
% h1 = errorbar(x, log2(y_1), log2(L1),log2(U1), 'color', 'k','marker', 'o', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
% h2 = errorbar(x, log2(y_2), log2(L2),log2(U2), 'color', 'k', 'marker', '*','markersize',10,'linewidth', 1, 'linestyle', '--');
% h3 = errorbar(x, log2(y_3), log2(L3),log2(U3), 'color', 'r', 'marker', 'p','markersize',10,'linewidth', 1,  'linestyle', '-');
% h4 = errorbar(x, log2(y_4), log2(L4),log2(U4), 'color', 'r', 'marker','d','markersize',10,'linewidth', 1,  'linestyle', '--');

% h11 = errorbar(x1, y_11, L11,U11, 'color', 'b','marker', 's', 'markersize',10,'linewidth', 1,  'linestyle', '-');
% h12 = errorbar(x1, y_12, L12,U12, 'color', 'b', 'marker', 'x','markersize',10,'linewidth', 1,  'linestyle', '--');
% 
% h1 = errorbar(x, y_1, L1,U1, 'color', 'k','marker', 'o', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
% h2 = errorbar(x, y_2, L2,U2, 'color', 'k', 'marker', '*','markersize',10,'linewidth', 1, 'linestyle', '--');
% h3 = errorbar(x, y_3, L3,U3, 'color', 'r', 'marker', 'p','markersize',10,'linewidth', 1,  'linestyle', '-');
% h4 = errorbar(x, y_4, L4,U4, 'color', 'r', 'marker','d','markersize',10,'linewidth', 1,  'linestyle', '--');

% h11 = plot(x, y_1, 'color', 'b','marker', 's', 'markersize',10,'linewidth', 1,  'linestyle', '-');
% h12 = plot(x1, y_12,  'color', 'b', 'marker', 'x','markersize',10,'linewidth', 1,  'linestyle', '--');
% 
h1_1 = plot(x, L1, 'color', 'k','marker', 'o', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
h1_2 = plot(x, U1, 'color', 'b', 'marker', '*','markersize',10,'linewidth', 1, 'linestyle', '-');
h1_3 = plot(x, A1, 'color', 'r', 'marker', 'p','markersize',10,'linewidth', 1, 'linestyle', '-');
% h2_1 = plot(x, L2, 'color', 'k','marker', 'x', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
% h2_2 = plot(x, U2, 'color', 'b', 'marker', 's','markersize',10,'linewidth', 1, 'linestyle', '-');
% h2_3 = plot(x, A2, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1, 'linestyle', '-');
% h3_1 = plot(x, L3, 'color', 'k','marker', 'o', 'markersize',10, 'linewidth', 1,  'linestyle', '-.');
% h3_2 = plot(x, U3, 'color', 'b', 'marker', '*','markersize',10,'linewidth', 1, 'linestyle', '-.');
% h3_3 = plot(x, A3, 'color', 'r', 'marker', 'p','markersize',10,'linewidth', 1, 'linestyle', '-.');
% h4_1 = plot(x, L4, 'color', 'k','marker', 'x', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
% h4_2 = plot(x, U4, 'color', 'b', 'marker', 's','markersize',10,'linewidth', 1, 'linestyle', '-');
% h4_3 = plot(x, A4, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1, 'linestyle', '-');

  tx = [1.5 1.5];
  %ty = [0 25];
  %h = line(tx, ty, 'color', 'k', 'linewidth', 2);
 
grid on;
ylabel('Latency (ms)', 'fontsize', 15);
%xlabel('# Brokers ', 'fontsize', 15);
%title('Base       Max Size Packet             Min Size Packet    ', 'fontsize', 30);
%legend('High-prio topic, Best-latency','Low-prio topic, Best-latency','High-prio topic, Diff. BufferSize', 'Low-prio topic, Diff. BufferSize');
legend('Median','99%','Avg');
%legend('High-prio topic, NSQ', 'High-prio topic, RTM');
%set(gca,'YScale','log')
% yt = get(gca, 'YTick');
% set (gca, 'YTickLabel', 2.^yt);

% yticks = -2:100;
% set(gca, 'YTick', yticks);
% for j = 1:length(yticks)
%   ytl{j} = ['2^' num2str(yticks(j))];
% end
% set(gca, 'YTickLabel', ytl)

% yticks = [0:7];
% %yticks = [1:10];
% set(gca, 'YTick', yticks);
% for j = 1:length(yticks)
%    ytl{j} = [num2str(2^yticks(j))];
% end
% set(gca, 'YTickLabel', ytl)
%ylim([0 20]);

set(gca, 'XTick', 1:1:6);
set(gca, 'FontSize', 12);
%set(gca,'XTickLabel',{'1','10','15','16','20','30','40','50','70','110'});%%
%set(gca,'XTickLabel',{'RTM-1conn','RTM-2conn','RTM-6brokers','baseline','best-case','worst-case'});
set(gca,'XTickLabel',{'RTM\_1conn','RTM-','baseline1','baseline2'});
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);