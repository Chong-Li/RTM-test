clear all;

load func_test;
load func_test_1;
% display(sprintf('%0.2f',prctile(x,99)));
% display(sprintf('%0.2f',prctile(x,99.9)));
% display(sprintf('boxboxbox'));
% 

f1 = figure;
hold on;

% M1=[ee_200_160_4_1(3000:13000,:)/1000000 ee_210_160_4_1(3000:13000,:)/1000000 ee_220_160_4_1(3000:13000,:)/1000000];
% 
% M2=[ee_200_160_4_2(3000:13000,:)/1000000 ee_210_160_4_2(3000:13000,:)/1000000 ee_220_160_4_2(3000:13000,:)/1000000];

M1=func_test_1(7:87,:);
M2=func_test(7:87,:);


x=[0:80]


% h1 = errorbar(y_1, e_1, 'color', 'k', 'linewidth', 2, 'displayname', 'Prio', 'linestyle', '-');
% h2 = errorbar(y_2, e_2, 'color', 'r', 'linewidth', 2, 'displayname', 'VATC', 'linestyle', '-');

% h1 = plot(x, M1(:,1), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
% h2 = plot(x, M1(:,2), 'color', 'r', 'linewidth', 2,  'linestyle', '-');
% h3 = plot(x, M1(:,3), 'color', 'b', 'linewidth', 2,  'linestyle', '-');

%h1 = plot(x, M1(:,1)+M1(:,2)+M1(:,3), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
h1 = plot(x, M1(:,1), 'color', 'k', 'linewidth', 2,  'linestyle', '-');
h2 = plot(x, M1(:,2), 'color', 'r', 'linewidth', 2,  'linestyle', '-');
h3 = plot(x, M1(:,3), 'color', 'b', 'linewidth', 2,  'linestyle', '-');
%h4 = errorbar(x, y_4, L4,U4, 'color', 'r', 'marker', 'd','markersize',10,'linewidth', 1,  'linestyle', '--');

ylim([0 3500]);
% for i=1:10
% set(h1(i,:),'LineWidth',1.5);
% end

%  tx = [8.5 8.5];
%  ty = [0 2700];
%  h = line(tx, ty, 'color', 'k', 'linewidth', 2);
% tx = [6.5 6.5];
% h = line(tx, ty, 'color', 'k', 'linewidth', 3);

ylabel('Msg Rate (msgs/sec)', 'fontsize', 15);
% xlabel('# of high-prio topics ', 'fontsize', 15);
xlabel('Timeline(second)', 'fontsize', 15);
legend('Producer1', 'Producer2', 'Producer3');
%legend('Producer1+2+3');
%set(gca, 'XTick', 1:1:5);
set(gca, 'FontSize', 15);
%set(gca, 'XTickLabel', {'420','415','414'});
%set(gcf, 'Position', [0 0 940 1058]);
set(gcf, 'PaperPositionMode', 'auto');
print -depsc fig/old;
% close(gcf);