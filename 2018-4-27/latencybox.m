clear all;

load latency600;
load latency800;
load latency1100;
load latency300;
load latency101;
load latency25;
load latency26;
load latency40;
load latency39;
load latency37;
load latency38;
% 

%display(sprintf('%0.2f',mean(latency1_712ms(10001:50000,10))));
display(sprintf('%0.2f',prctile(latency101(1001:5000,5), 50)));
% display(sprintf('%0.2f',prctile(latency28(10001:50000,12), 70)));
% display(sprintf('%0.2f',prctile(latency28(10001:50000,12), 90)));
% display(sprintf('%0.2f',prctile(latency28(10001:50000,12), 95)));
display(sprintf('%0.2f',prctile(latency101(1001:5000,5), 99)));
% display(sprintf('%0.2f',prctile(latency28(10001:50000,12), 99.9)));

f1 = figure;
hold on;


% 
%  M1=[latency_19(10001:50000,3)  latency_19(10001:50000,9)];

% 
  M1=[latency38(10001:50000,12)/1000000  latency38(10001:50000,4)/1000000 ...
      latency38(10001:50000,5)/1000000   latency38(10001:50000,6)/1000000 ...
      latency38(10001:50000,7)/1000000  ];
  
  
%    M1=[latency31(10001:50000,12)/1000000 latency32(10001:50000,12)/1000000 ...
%        latency28(10001:50000,12)/1000000, latency54(10001:50000,12)/1000000 ...
%        latency22(10001:50000,12)/1000000 latency23(10001:50000,12)/1000000];

%    M1=[latency61(1001:5000,12)/1000000 latency59(1001:5000,12)/1000000 ...
%         latency62(1001:5000,12)/1000000, latency60(1001:5000,12)/1000000];

%    M1=[latency41(1001:50000,12)/1000000 latency42(1001:50000,12)/1000000 ...
%         latency40(1001:50000,12)/1000000 ];

%   M1=[batch10k(10001:50000,12)/1000000  batch10k(10001:50000,4)/1000000 ...
%       batch10k(10001:50000,5)/1000000   batch10k(10001:50000,6)/1000000 ...
%       batch10k(10001:50000,7)/1000000  ];

%  M1=[b1k_1core_1ch(10001:50000,1)/1000000
%  b1k_1core_2ch(10001:50000,1)/1000000 ... 
%      b1k_2core_1ch(10001:50000,1)/1000000 b1k_2core_2ch(10001:50000,1)/1000000 ...
%      b1k_4core_1ch(10001:50000,1)/1000000 b1k_4core_2ch(10001:50000,1)/1000000 ];
% 
% M1=[batch10k_6(10001:50000,12)/1000000  latency59(10001:50000,12)/1000000 latency57(10001:50000,12)/1000000 ...
%     latency111(10001:50000,12)/1000000 latency82(10001:50000,11)/1000000 latency68(10001:50000,12)/1000000];

%  M1=[latency(10001:50000,12)/1000000  latency59(10001:50000,12)/1000000 latency57(10001:50000,12)/1000000 ...
%     latency77(10001:50000,12)/1000000 latency79(10001:50000,12)/1000000 latency82(10001:50000,11)/1000000 latency68(10001:50000,12)/1000000];


h1 = boxplot(M1, 'colors', 'bkbkbkbkbkb', 'notch', 'on');
%set(h1(5,:),'Visible','off')
% for i=1:5
% set(h1(i,:),'LineWidth',2);
% end
% 
%tx = [12.5 12.5];
%ty = [-10 200000];
%h = line(tx, ty, 'color', 'k', 'linewidth', 2);


ylabel('Latency (ms)', 'fontsize', 13);
%ylabel('Send-Q (bytes)', 'fontsize', 13);
%xlabel('# Brokers', 'fontsize', 13);


grid on;
%ylim([0 9]);
set(gca, 'XTick', [1 2 3 4 5 6 7 8 9 10 11]);
set(gca, 'FontSize', 12);
% set(gca,'XTickLabel',{'RTM-1conn','RTM-2conn','RTM-6brokers','baseline','best-case','worst-case'});
%set(gca,'XTickLabel',{'RTM-1conn','RTM-2conn','baseline'});
%set(gca,'XTickLabel',{'1','2','3','4','5','6','7','8','9','10','15'});%%
%set(gca,'XTickLabel',{'10k_1conn','10k_2conn_rr','10k_2conn_st','20_10k_1conn','20_5k_1conn','10k_4conn_rr','10k_4conn_st'});%%
set(gca,'XTickLabel',{'broker-delay','1','2','3','4'});
%set(gca,'XTickLabel',{'Baseline','Distributed'});
% for i = 1:5
% text(i,data(i),num2str(data(i)),'fontsize',20,'HorizontalAlignment','center','VerticalAlignment','bottom');
% end
% set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
%legend('Default Domain0', 'Traffic Control');
print -depsc fig/old;
close(gcf);


% % level 0
% f1 = figure;
% hold on;
% 
% %h2 = cdfplot( base_min(:, 1)+base_min(:, 2)+base_min(:, 3));
% %h2 = cdfplot( base_min(:, 5)+base_min(:, 6)+base_min(:, 7)+base_min(:, 8));
% h2 = cdfplot( base_min(:, 5));
% %h2 = cdfplot( base_max(:, 5)+base_max(:, 6)+base_max(:, 7)+base_max(:, 8));
% %h2 = cdfplot( base_max(:, 5));
% %h2 = cdfplot( base_max(:, 1)+base_max(:, 2)+base_max(:, 3));
% %h2 = cdfplot( base_max(:, 3));
% 
% 
% %h6 = cdfplot( rt_min(:,1)+rt_min(:,2)+rt_min(:,3));
% %h6 = cdfplot( rt_min(:,3));
% %h6 = cdfplot( rt_min(:,5)+rt_min(:,6)+rt_min(:,7)+rt_min(:,8));
% %h6 = cdfplot( rt_min(:,5));
% %h6 = cdfplot( rt_min(:,8));
% %h6 = cdfplot( rt_max(:,5)+rt_max(:,6)+rt_max(:,7)+rt_max(:,8));
% %h6 = cdfplot( rt_max(:,8));
% %h6 = cdfplot( rt_max(:,1)+rt_max(:,2)+rt_max(:,3));
% 
% 
% %h10 = cdfplot( tc_min(:, 1)+tc_min(:, 2)+tc_min(:, 3));
% %h10 = cdfplot( tc_min(:, 3));
% %h10 = cdfplot( tc_min(:, 5)+tc_min(:, 6)+tc_min(:, 7)+tc_min(:, 8));
% %h10 = cdfplot( tc_min(:, 5));
% %h10 = cdfplot( tc_min(:, 8));
% %h10 = cdfplot( tc_max(:,5)+tc_max(:,6)+tc_max(:,7)+tc_max(:,8));
% %h10 = cdfplot( tc_max(:,8));
% %h10 = cdfplot( tc_max(:,1)+tc_max(:,2)+tc_max(:,3));
% 
% 
% %h14 = cdfplot( rtca_base_min(:, 1)+rtca_base_min(:, 2)+rtca_base_min(:, 3)+rtca_base_min(:, 4));
% %h14= cdfplot(rtca_2_4(:,5)+rtca_2_4(:,6)+rtca_2_4(:,7)+rtca_2_4(:,8));
% %h14= cdfplot(rtca_2_4(:,5));
% %h14= cdfplot(rtca_3_4(:,5)+rtca_3_4(:,6)+rtca_3_4(:,7)+rtca_3_4(:,8));
% %h14= cdfplot(rtca_3_4(:,5));
% 
% % h6 = cdfplot( rtca_1_1(:, 5));
% % h10 = cdfplot( rtca_3(:, 5));
% % h14 = cdfplot( rtca_5(:, 5));
% % h16= cdfplot(rtca_5_8(:,5));
% 
% %h16 = cdfplot( rtca_min(:, 1)+rtca_min(:, 2)+rtca_min(:, 3));
% %h16 = cdfplot( rtca_min(:, 5)+rtca_min(:, 6)+rtca_min(:, 7)+rtca_min(:, 8));
% %h16 = cdfplot( rtca_min(:, 5));
% %h16 = cdfplot( rtca_max(:,5)+rtca_max(:,6)+rtca_max(:,7)+rtca_max(:,8));
% %h16 = cdfplot( rtca_max(:,1)+rtca_max(:,2)+rtca_max(:,3));
% %h16 = cdfplot( rtca_max(:,5));
% %h16 = cdfplot( rtca_max(:,3));
% 
% 
% set(h2, 'color', 'r', 'linewidth', 2, 'displayname', 'No interference', 'linestyle', '-');
% 
% set(h6, 'color', 'k', 'linewidth', 2, 'displayname', 'Original Domain0', 'linestyle', '-');
% 
% set(h10, 'color', 'b', 'linewidth', 2, 'displayname', 'Traffic Control', 'linestyle', '-');
% 
% set(h14, 'color', 'c', 'linewidth', 2, 'displayname', 'RTCA, revised net-recv-kthread', 'linestyle', '-');
% 
% set(h16, 'color', 'm', 'linewidth', 2, 'displayname', 'RTCA', 'linestyle', '-');
% 
% 
% xlabel('Micro Seconds', 'fontsize', 20);
% ylabel('CDF Plot', 'fontsize', 20);
% %title('Packet recv latency, min-size UDP Packet, interference=(1,50)', 'fontsize', 20);
% set(gca, 'fontsize', 20);
% 
% %xlim([0 600])
% 
% grid off;
% legend('show', 'location', 'SE');
% 
% %set(f1, 'position', [0 0 1920 1200]);
% set(gcf, 'Paperpositionmode', 'auto');
% print -depsc fig/latency_0;
% 
% close(gcf);



% 
% 
% 
% 

