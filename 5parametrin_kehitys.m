clear all, %close all, clc;

fid=fopen(['parametrien_kehitys.txt'], 'r');

temp=fread(fid, [1 inf]);
inds_Em=findstr('Em = ', temp); % etsii dat filest� U2 tulosten indeksit

fid=fopen(['parametrien_kehitys.txt'], 'r');
headers = textscan(fid,'%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n',length(inds_Em),'delimiter','\t');

%

koko = length(inds_Em);

for i=1:koko;
    Em(i,:) = str2num(headers{1,2}{i,1}(6:end));
    E0(i,:) = str2num(headers{1,3}{i,1}(6:end));
    Efe(i,:) = str2num(headers{1,4}{i,1}(7:end));
    k0(i,:) = str2num(headers{1,5}{i,1}(6:end));
    Mk(i,:) = str2num(headers{1,6}{i,1}(6:end));
    f(i,:) = str2num(headers{1,7}{i,1}(5:end));
end

%
figure;

% subplot(6,1,1)
% plot(Em/Em(1), 'b');
% title('Em');
% subplot(6,1,2)
% plot(E0/E0(1), 'b');
% title('E0');
% subplot(6,1,3)
% plot(Efe/Efe(1), 'b');
% title('Efe');
% subplot(6,1,4)
% plot(k0/k0(1), 'b');
% title('k0');
% subplot(6,1,5)
% plot(Mk/Mk(1), 'b');
% title('Mk');
% subplot(6,1,6)
% plot(f, 'b');
% title('f');

%

plot(Em/Em(1), 'b');
hold on;

plot(E0/E0(1), 'r');
plot(Efe/Efe(1), 'g');
plot(k0/k0(1), 'k');
plot(Mk/Mk(1), 'c');

f(find(f>2000))=0;
plot(f/f(1), '--', 'Linewidth', 1);



legend('Em','E0','Efe','k0','M','f');

%Virhe Lopussa

%display([''])
title(['Virhe lopussa = ', num2str(f(end))]);
%display([''])



