clear all;

load latency_local_40;
load latency_local_60;
load latency_local_80;
load latency_local_100;

load latency_remote_40;
load latency_remote_60;
load latency_remote_80;
load latency_remote_100;

load latency_rtm_40;
load latency_rtm_60;
load latency_rtm_80;
load latency_rtm_100_2;
load latency_rtm_80_2;
load latency_rtm_100_3;


f1 = figure;
hold on;


% M1=[latency_shm_10(1:1000,:)/1000 latency_shm2_10k(1:1000,:)/1000 ...
%     latency_shm_1(1:1000,:)/1000 latency_shm2_1k(1:1000,:)/1000 ...
%     latency_shm_100u(1:1000,:)/1000 latency_shm2_100(1:1000,:)/1000 ...
%     latency_shm_10u(1:1000,:)/1000 latency_shm2_10(1:1000,:)/1000];

% M1=[latency_local_40(3000:13000,:)/1000000  latency_remote_40(3000:13000,:)/1000000 ...
%     latency_local_50(3000:13000,:)/1000000  latency_remote_50(3000:13000,:)/1000000 ...
%     latency_local_60(3000:13000,:)/1000000  latency_remote_60(3000:13000,:)/1000000 ...
%     latency_local_70(3000:13000,:)/1000000  latency_remote_70(3000:13000,:)/1000000];

M1=[latency_local_40(3000:13000,:)/1000000  latency_remote_40(3000:13000,:)/1000000 latency_rtm_40(3000:13000,:)/1000000 ...
    latency_local_60(3000:13000,:)/1000000  latency_remote_60(3000:13000,:)/1000000 latency_rtm_60(3000:13000,:)/1000000 ...
    latency_local_80(3000:13000,:)/1000000  latency_remote_80(3000:13000,:)/1000000 latency_rtm_80(3000:13000,:)/1000000 ...
    latency_local_100(3000:13000,:)/1000000  latency_remote_100(3000:13000,:)/1000000 latency_rtm_100_2(3000:13000,:)/1000000];

%M1=[latency_local_100(3000:13000,:)/1000000  latency_remote_100(3000:13000,:)/1000000 latency_100(3000:13000,:)/1000000];
%M1=[latency_base_60(3000:13000,:)/1000000  latency_base_r60(3000:13000,:)/1000000];
% M1=[ee_1_350_1d_1r(3000:13000,:)/1000000 ee_1_350_1d_2r(3000:13000,:)/1000000 ...
%     ee_1_350_1d_1_16(3000:13000,:)/1000000 ee_1_350_1d_2_16(3000:13000,:)/1000000];

%h1 = boxplot(M,  'notch', 'on');
h1 = boxplot(M1, 'colors', 'bkrbkrbkrbkr', 'notch', 'on');
set(h1(7,:),'Visible','off')

% for i=1:5
% set(h1(i,:),'LineWidth',2);
% end
% 
tx = [3.5 3.5];
ty = [-10 200000];
h = line(tx, ty, 'color', 'k', 'linewidth', 2);

tx = [6.5 6.5];
h = line(tx, ty, 'color', 'k', 'linewidth', 2);

tx = [9.5 9.5];
h = line(tx, ty, 'color', 'k', 'linewidth', 2);


ylabel('Latency (ms)', 'fontsize', 13);
%xlabel('Number of Subscribers', 'fontsize', 15);
%title('Time spent in loop from step3 to step7, 2k-payload packets sent fro m Domain2 and Domain3 ', 'fontsize', 20);

grid on;
ylim([0 7]);
  set(gca, 'XTick', [1 2 3 4 5 6 7 8 9 10 11 12]);
 set(gca, 'FontSize', 12);
%set(gca,'XTickLabel',{'local','remote','cluster'});
set(gca,'XTickLabel',{'local','remote','RTM','local','remote','RTM','local','remote','RTM','local','remote','RTM',});%%


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

