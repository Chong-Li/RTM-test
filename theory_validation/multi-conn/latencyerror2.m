clear all;


% 

f1 = figure;
hold on;

%bpi_1conn
M1=[latency107(10001:50000,11)/1000000 latency108(10001:50000,11)/1000000 latency112(10001:50000,11)/1000000 ...
    latency110(10001:50000,11)/1000000 latency109(10001:50000,11)/1000000 latency111(10001:50000,11)/1000000 ...
    latency18(10001:50000,12)/1000000 ];
%bpi_2conn
M2=[latency15(10001:50000,12)/1000000 latency14(10001:50000,12)/1000000 latency13(10001:50000,12)/1000000 ...
    latency12(10001:50000,12)/1000000 latency11(10001:50000,12)/1000000 latency26(10001:50000,12)/1000000 ...
    latency25(10001:50000,12)/1000000 ];

%sync_1conn
M3=[latency113(10001:50000,11)/1000000 latency114(10001:50000,11)/1000000 latency115(10001:50000,11)/1000000 ...
    latency116(10001:50000,11)/1000000 latency87(10001:50000,11)/1000000 latency117(10001:50000,11)/1000000 ...
    latency90(10001:50000,11)/1000000 ];

%sync_2conn
M4=[latency28(10001:50000,12)/1000000 latency29(10001:50000,12)/1000000 latency30(10001:50000,12)/1000000 ...
    latency35(10001:50000,12)/1000000 latency34(10001:50000,12)/1000000 latency33(10001:50000,12)/1000000 ...
    latency36(10001:50000,12)/1000000 ];
% 
% M4=[latency0_36(1001:5000,1)/1000000 latency0_37(1001:5000,1)/1000000 latency0_36(1001:5000,1)/1000000  ...
%     latency0_37(1001:5000,1)/1000000 latency0_21(1001:5000,1)/1000000 latency0_21(1001:5000,1)/1000000 ];

% M4=[ee_1_320_2d_2(3000:13000,:)/1000000 ee_1_330_2d_2(3000:13000,:)/1000000 ee_1_340_2d_2(3000:13000,:)/1000000 ...
%     ee_1_350_2d_2(3000:13000,:)/1000000 ee_1_360_2d_2(3000:13000,:)/1000000];

x=[1 2 3 4 5 6 7]

L1=prctile(M1, 50)
U1=prctile(M1, 99)
A1= mean(M1)
L2=prctile(M2, 50)
U2=prctile(M2, 99)
A2= mean(M2)

L3=prctile(M3, 50)
U3=prctile(M3, 99)
A3= mean(M3)
L4=prctile(M4, 50)
U4=prctile(M4, 99)
A4= mean(M4)

% 
% h1_1 = plot(x, L1, 'color', 'k','marker', 'o', 'markersize',10, 'linewidth', 1,  'linestyle', '-.');
% h1_2 = plot(x, U1, 'color', 'b', 'marker', '*','markersize',10,'linewidth', 1, 'linestyle', '-.');
% h1_3 = plot(x, A1, 'color', 'r', 'marker', 'p','markersize',10,'linewidth', 1, 'linestyle', '-.');
% h2_1 = plot(x, L2, 'color', 'k','marker', 'x', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
% h2_2 = plot(x, U2, 'color', 'b', 'marker', 's','markersize',10,'linewidth', 1, 'linestyle', '-');
% h2_3 = plot(x, A2, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1, 'linestyle', '-');
h3_1 = plot(x, L3, 'color', 'k','marker', 'o', 'markersize',10, 'linewidth', 1,  'linestyle', '-.');
h3_2 = plot(x, U3, 'color', 'b', 'marker', '*','markersize',10,'linewidth', 1, 'linestyle', '-.');
h3_3 = plot(x, A3, 'color', 'r', 'marker', 'p','markersize',10,'linewidth', 1, 'linestyle', '-.');
h4_1 = plot(x, L4, 'color', 'k','marker', 'x', 'markersize',10, 'linewidth', 1,  'linestyle', '-');
h4_2 = plot(x, U4, 'color', 'b', 'marker', 's','markersize',10,'linewidth', 1, 'linestyle', '-');
h4_3 = plot(x, A4, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1, 'linestyle', '-');

grid on;
ylabel('Latency (ms)', 'fontsize', 15);
%xlabel('# Brokers ', 'fontsize', 15);
%title('Base       Max Size Packet             Min Size Packet    ', 'fontsize', 30);
%legend('High-prio topic, Best-latency','Low-prio topic, Best-latency','High-prio topic, Diff. BufferSize', 'Low-prio topic, Diff. BufferSize');
legend('1-conn-Median','1-conn-99%','1-conn-Avg','2-conn-Median','2-conn-99%','2-conn-Avg');
%legend('High-prio topic, NSQ', 'High-prio topic, RTM');
set(gca,'YScale','log')

set(gca, 'XTick', 1:1:11);
set(gca, 'FontSize', 12);
set(gca,'XTickLabel',{'10','100','200','500','1k','5k','10k'});%%
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);