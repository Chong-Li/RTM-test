clear all;

load func_1;
load func_2;
load func_3;
load func_4;
load func_5;

load func_6;
load func_7;

load func_9;

% display(sprintf('%0.2f',prctile(x,99)));
% display(sprintf('%0.2f',prctile(x,99.9)));
% display(sprintf('boxboxbox'));
% 

f1 = figure;
hold on;

% M1=[ee_200_160_4_1(3000:13000,:)/1000000 ee_210_160_4_1(3000:13000,:)/1000000 ee_220_160_4_1(3000:13000,:)/1000000];
% 
% M2=[ee_200_160_4_2(3000:13000,:)/1000000 ee_210_160_4_2(3000:13000,:)/1000000 ee_220_160_4_2(3000:13000,:)/1000000];

M1=func_9(350:500,:);
M2=func_2(1:81,:);

% Y1=[39 40 42 44 46]
% Z1=[2400 2401 1401 1341 2018]
% 
% Y2=[39 41 43 46 48]
% Z2=[2400 2402 3273 2018 2712]

Y1=[371 387 407 428 451]
%Z1=[241 240 129 153 149]
Z1=[402 401 396 345 415]

Y2=[384 403 422 449 458]
%Z2=[241 132 147 139 384]
Z2=[401 399 406 312 620]

x=[350:500]


% h1 = errorbar(y_1, e_1, 'color', 'k', 'linewidth', 2, 'displayname', 'Prio', 'linestyle', '-');
% h2 = errorbar(y_2, e_2, 'color', 'r', 'linewidth', 2, 'displayname', 'VATC', 'linestyle', '-');

% h1 = plot(x, M1(:,1), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
% h2 = plot(x, M1(:,2), 'color', 'r', 'linewidth', 2,  'linestyle', '-');
% h3 = plot(x, M1(:,3), 'color', 'b', 'linewidth', 2,  'linestyle', '-');

h1 = plot(x, M1(:,1)+M1(:,2)+M1(:,3), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
%  h1 = plot(x, M1(:,1), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
%  h2 = plot(x, M1(:,2), 'color', 'g', 'linewidth', 2,  'linestyle', '-');
%  h3 = plot(x, M1(:,3), 'color', 'b', 'linewidth', 2,  'linestyle', '-');
% % 
  w1= plot(Y1, Z1,'d','markersize',10, 'color', 'r', 'linewidth', 2);
  w1= plot(Y2, Z2,'*','markersize',10, 'color', 'm', 'linewidth', 2);
%h4 = errorbar(x, y_4, L4,U4, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1,  'linestyle', '--');

ylim([0 800]);
% for i=1:10
% set(h1(i,:),'LineWidth',1.5);
% end

%  tx = [8.5 8.5];
%  ty = [0 2700];
%  h = line(tx, ty, 'color', 'k', 'linewidth', 2);
% tx = [6.5 6.5];
% h = line(tx, ty, 'color', 'k', 'linewidth', 3);

ylabel('Msg Rate (msgs/100ms)', 'fontsize', 15);
% xlabel('# of high-prio topics ', 'fontsize', 15);
xlabel('Timeline(ms)', 'fontsize', 15);
%legend('Producer1', 'Producer2', 'Producer3','Congestion','De-congestion');
legend('Producer1+2+3');
%set(gca, 'XTick', 1:1:5);
set(gca, 'FontSize', 15);
%set(gca, 'XTickLabel', {'420','415','414'});
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);