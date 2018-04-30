clear all;

% display(sprintf('%0.2f',prctile(x,99)));
% display(sprintf('%0.2f',prctile(x,99.9)));
% display(sprintf('boxboxbox'));
% 

f1 = figure;
hold on;

% M1=[ee_200_160_4_1(3000:13000,:)/1000000 ee_210_160_4_1(3000:13000,:)/1000000 ee_220_160_4_1(3000:13000,:)/1000000];
% 
% M2=[ee_200_160_4_2(3000:13000,:)/1000000 ee_210_160_4_2(3000:13000,:)/1000000 ee_220_160_4_2(3000:13000,:)/1000000];

%M1=dump_1_0(1:30,:);
%M2=dump_1_10(1:30,:);

M1=[11.4 79 124 164 187 199 200];
M2=[9.6 70 120 151 165 186 199]


x=[1:7]


% h1 = errorbar(y_1, e_1, 'color', 'k', 'linewidth', 2, 'displayname', 'Prio', 'linestyle', '-');
% h2 = errorbar(y_2, e_2, 'color', 'r', 'linewidth', 2, 'displayname', 'VATC', 'linestyle', '-');

% h1 = plot(x, M1(:,1), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
% h2 = plot(x, M1(:,2), 'color', 'r', 'linewidth', 2,  'linestyle', '-');
% h3 = plot(x, M1(:,3), 'color', 'b', 'linewidth', 2,  'linestyle', '-');
h1 = plot(x, M1,'d','markersize',10, 'color', 'b', 'linewidth', 2,  'linestyle', '-');
h2 = plot(x, M2,'*','markersize',10, 'color', 'r', 'linewidth', 2,  'linestyle', '-');


%h3 = plot(x, M2(:,3), 'color', 'b', 'linewidth', 2,  'linestyle', '-');
%h4 = errorbar(x, y_4, L4,U4, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1,  'linestyle', '--');

ylim([0 250]);
% for i=1:10
% set(h1(i,:),'LineWidth',1.5);
% end

%  tx = [8.5 8.5];
%  ty = [0 2700];
%  h = line(tx, ty, 'color', 'k', 'linewidth', 2);
% tx = [6.5 6.5];
% h = line(tx, ty, 'color', 'k', 'linewidth', 3);

ylabel('CPU Utilization (%)', 'fontsize', 15);
% xlabel('# of high-prio topics ', 'fontsize', 15);
xlabel('# of Topics', 'fontsize', 15);
legend('local daemon', 'remote daemon');
%legend('RTM-, 0 high-prio topic','RTM-, 10 high-prio topics');
set(gca, 'XTick', 1:1:7);
set(gca, 'FontSize', 15);
set(gca, 'XTickLabel', {'1','10','20','30','40','50','60','70'});
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);