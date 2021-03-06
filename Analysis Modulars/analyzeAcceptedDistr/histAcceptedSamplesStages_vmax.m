clear all
clc

series = 15;
studyStages = [1;3;5;7];
xlimLow = 40;
xlimHigh = 80;
studyLinks = [1];
cali_configID = 41;
cali_paraID = 41;
simu_configID = 115;
numSamplesStudied = 100;

for j = 1 : length(studyLinks)
    link = studyLinks(j);
    for i = 1 : length(studyStages)
        stage = studyStages(i);
        load(['.\ResultCollection\series' num2str(series) '\-acceptedPop-stage-' num2str(stage) '.mat']);
        figure(j)
        subplot(ceil(length(studyStages))/2,2,i)
        hist(ACCEPTED_POP(link).samples(1,:));
        xlim([xlimLow xlimHigh]);
        xlabel('v_{max}');
        title(['stage ' num2str(stage) ' of link ' num2str(link)]);
        hold on
    end   
    hold off
end

saveas(gcf, ['../Plots\series' num2str(series) '\acceptedSamplesHist_vmax.pdf']);
saveas(gcf, ['../Plots\series' num2str(series) '\acceptedSamplesHist_vmax.fig']);
saveas(gcf, ['../Plots\series' num2str(series) '\acceptedSamplesHist_vmax.eps'], 'epsc');
