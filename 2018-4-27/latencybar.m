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
    
y = [prctile(latency29(10001:50000,12)/1000000, 99) prctile(latency30(10001:50000,12)/1000000, 99) prctile(latency36(10001:50000,12)/1000000, 99);
    prctile(latency38(10001:50000,12)/1000000, 99) prctile(latency39(10001:50000,12)/1000000, 99) prctile(latency40(10001:50000,12)/1000000, 99)];
%y = [prctile(latency38(10001:50000,12)/1000000, 99) prctile(latency39(10001:50000,12)/1000000, 99) prctile(latency40(10001:50000,12)/1000000, 99);];

% b = bar(y,'FaceColor','flat');
% for k = 1:size(y,2)
%     b(k).CData = k;
% end

b=bar(y)

x=[1 2 3]


  tx = [1.5 1.5];
  %ty = [0 25];
  %h = line(tx, ty, 'color', 'k', 'linewidth', 2);
 
grid on;
ylabel('99% Latency (ms)', 'fontsize', 15);
%xlabel('# Brokers ', 'fontsize', 15);
%title('Base       Max Size Packet             Min Size Packet    ', 'fontsize', 30);
%legend('High-prio topic, Best-latency','Low-prio topic, Best-latency','High-prio topic, Diff. BufferSize', 'Low-prio topic, Diff. BufferSize');
legend('RTM\_1conn','RTM-','baseline');
%legend('High-prio topic, NSQ', 'High-prio topic, RTM');
set(gca,'YScale','log')
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

set(gca, 'XTick', 1:1:2);
set(gca, 'FontSize', 12);
%set(gca,'XTickLabel',{'1','10','15','16','20','30','40','50','70','110'});%%
%set(gca,'XTickLabel',{'RTM-1conn','RTM-2conn','RTM-6brokers','baseline','best-case','worst-case'});
set(gca,'XTickLabel',{'k=2','k=4'});
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);