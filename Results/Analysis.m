% SIMULATION ANALYSIS
X = 1:6;

% erdosRenyi
eR_S1 = [271.1280 254.2361 237.9797 228.1414 195.0865 ... % 0.3
         250.7779 238.1857 216.8420 274.5496 226.4675 ...
         240.2152 200.0291 255.3815 261.4597 242.7752];
eR_S2 = [226.2723 239.8382 194.9262 238.9719 258.6163 ... % 0.4
         221.4098 226.2101 198.4014 213.9073 227.8728 ...
         222.5770 222.5633 214.2344 236.6112 224.4784];
eR_S3 = [221.7914 224.0133 225.0691 223.6921 224.0998 ... % 0.5
         206.9520 214.9846 225.8635 232.8423 234.8491  ...
         224.2614 224.6765 219.9902 234.9655 246.4057];
eR_S4 = [220.3912 224.3853 222.0348 218.0363 218.3517 ... % 0.6
         216.6470 205.9242 215.6826 218.7969 205.4264 ...
         218.0220 206.8814 223.2066 221.1174 208.2582];
eR_S5 = [222.7538 215.6801 216.6771 217.0169 217.6846 ... % 0.7
         218.0150 217.0656 214.9518 218.9748 217.1138 ...
         218.6004 216.3976 215.6692 216.6473 229.0114];
eR_S6 = [214.9845 215.7997 217.3457 215.7800 216.3395 ... % 0.8
         214.9537 215.7349 214.9692 206.6324 214.9692 ...
         215.7513 215.6796 217.0409 215.6906 215.7049];
eR_mean = [mean(eR_S1) mean(eR_S2) mean(eR_S3) mean(eR_S4) mean(eR_S5) mean(eR_S6)];
eR_erro = [ErroPadrao(eR_S1) ErroPadrao(eR_S2) ErroPadrao(eR_S3) ErroPadrao(eR_S4) ErroPadrao(eR_S5) ErroPadrao(eR_S6)];

figure('Renderer', 'painters', 'Position', [10 10 500 350])
errorbar(X, eR_mean, eR_erro,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','red');
xlabel("Simulação");
ylabel("\rho");
title("Experimento 1");
grid on

% % WattsStrogatz
WS_S1 = [195.9289]; % [4 0.0]
WS_S2 = [231.1039 219.5589 237.1776 224.5218 234.3505 ... % [4 0.1]
         191.9715 230.6571 246.3667 194.4292 203.4255 ...
         207.4971 239.5677 228.8913 187.5306 223.1808];
WS_S3 = [228.1193 229.8409 228.1679 208.9128 196.2825 ... % [4 0.3]
         200.8159 211.7009 225.6779 238.8485 234.2053 ...
         251.7216 220.2404 235.3372 234.3930 225.5084];
WS_S4 = [218.3387]; % [7 0.0]
WS_S5 = [217.8996 222.6924 218.9095 219.2789 217.7983 ... % [7 0.1]
         219.0384 221.8550 219.1698 218.8875 220.1441 ...
         193.9690 219.2435 219.4906 221.5772 219.2146];
WS_S6 = [216.8238 215.7748 217.8817 217.8039 219.0708 ... % [7 0.3]
         216.8750 203.5839 215.8899 221.7852 215.6995 ...
         207.2432 204.4763 219.6892 217.2453 218.9101];
WS_mean = [mean(WS_S1) mean(WS_S2) mean(WS_S3) mean(WS_S4) mean(WS_S5) mean(WS_S6)];
WS_erro = [ErroPadrao(WS_S1) ErroPadrao(WS_S2) ErroPadrao(WS_S3) ErroPadrao(WS_S4) ErroPadrao(WS_S5) ErroPadrao(WS_S6)];

figure('Renderer', 'painters', 'Position', [10 10 500 350])
errorbar(X, WS_mean, WS_erro,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','red');
xlabel("Simulação");
ylabel("\rho");
title("Experimento 2");
grid on

% % BarabasiAlbert
BA_S1 = [245.0658 227.5000 230.3006 222.1194 223.5776 ... % [5 2]
         214.0492 212.2847 220.4443 211.2766 238.2750 ...
         210.7986 217.1212 222.8795 200.8081 224.1575];
BA_S2 = [223.3985 220.6706 221.3636 221.2671 208.9245 ... % [5 3]
         220.6359 208.6872 224.4173 223.8222 227.6216 ...
         228.1827 207.6294 220.4736 220.7271 224.4587];
BA_S3 = [209.8192 212.0767 197.6015 227.8475 206.0048 ... % [5 4]
         217.8208 217.7007 219.9006 218.3340 213.3713 ...
         220.5140 207.3981 201.4344 212.6915 233.3116];
BA_S4 = [194.9074 215.9125 218.9335 223.8723 222.6106 ... % [8 3]
         201.4901 210.6325 216.4763 206.3901 207.9556 ...
         195.7939 214.1697 231.4638 210.4332 214.0869];
BA_S5 = [218.7065 210.1267 208.2158 219.4760 219.0419 ... % [8 5]
         210.5972 209.4080 209.0616 211.1014 205.7943 ...
         207.2930 218.8342 220.2818 218.6017 219.7531];
BA_S6 = [216.5210 207.3007 217.8685 216.4575 218.4481 ...
         219.0561 207.1693 216.9628 222.0560 217.0023 ... 
         216.5812 215.6874 215.7288 215.8149 218.7561]; % [8 7]
BA_mean = [mean(BA_S1) mean(BA_S2) mean(BA_S3) mean(BA_S4) mean(BA_S5) mean(BA_S6) ];
BA_erro = [ErroPadrao(BA_S1) ErroPadrao(BA_S2) ErroPadrao(BA_S3) ErroPadrao(BA_S4) ErroPadrao(BA_S5) ErroPadrao(BA_S6)];

figure('Renderer', 'painters', 'Position', [10 10 500 350])
errorbar(X, BA_mean, BA_erro,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','red');
xlabel("Simulação");
ylabel("\rho");
title("Experimento 3");
grid on

% % DoddsWattsSabel
DWS_S1 = [204.9272 211.3539 211.8651 208.4923 205.6747 ... % [5 3 1 1]
          211.8651 208.6510 212.2283 214.9599 208.4923 ...
          211.7843 211.8394 214.9846 208.6056 214.9846];
DWS_S2 = [205.6788 214.3041 236.6263 208.6510 218.4118 ...
          214.9846 175.4379 211.3539 227.0673 216.5887 ...
          211.8651 218.3901 173.5959 212.0562 218.4329]; % [5 4 1 1]
DWS_S3 = [196.5782 212.6711 208.6056 214.9837 211.3539 ...
          215.1576 208.6311 218.4118 188.7534 226.5131 ...
          197.7898 208.6510 202.2063 208.6732 211.3539];
DWS_S4 = [206.4855 209.9454 200.4521 206.4855 236.7101 ...
          206.4855 202.5912 206.4855 206.4855 206.4855 ...
          206.4855 194.9431 206.4855 206.4855 201.4698];
DWS_S5 = [206.4855 203.6871 202.6887 200.4521 202.5912 ...
          202.6887 206.4855 206.4855 188.6504 194.9431 ...
          176.6952 188.0349 202.6832 194.6742 209.3798];
DWS_S6 = [206.4855 202.5912 223.5297 206.4855 206.4855 ...
          202.4395 188.1664 206.4855 197.1670 202.6832 ...
          197.1670 202.6995 209.3798 206.4855 209.4664];
DWS_erro = [ErroPadrao(DWS_S1) ErroPadrao(DWS_S2) ErroPadrao(DWS_S3) ErroPadrao(DWS_S4) ErroPadrao(DWS_S5) ErroPadrao(DWS_S6)];
DWS_mean = [mean(DWS_S1) mean(DWS_S2) mean(DWS_S3) mean(DWS_S4) mean(DWS_S5) mean(DWS_S6)];

figure('Renderer', 'painters', 'Position', [10 10 500 350])
errorbar(X, DWS_mean, DWS_erro,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','red');
xlabel("Simulação");
ylabel("\rho");
title("Experimento 4");
grid on

%% Results
fprintf("erdosRenyi_Simulacao1: %f $\\pm$ %f\n", mean(eR_S1), ErroPadrao(eR_S1));
fprintf("erdosRenyi_Simulacao2: %f $\\pm$ %f\n", mean(eR_S2), ErroPadrao(eR_S2));
fprintf("erdosRenyi_Simulacao3: %f $\\pm$ %f\n", mean(eR_S3), ErroPadrao(eR_S3));

fprintf("WattsStrogatz_Simulacao1: %f $\\pm$ %f\n", mean(WattsStrogatz_Simulacao1), ErroPadrao(WattsStrogatz_Simulacao1));
fprintf("WattsStrogatz_Simulacao1: %f $\\pm$ %f\n", mean(WattsStrogatz_Simulacao2), ErroPadrao(WattsStrogatz_Simulacao2));
fprintf("WattsStrogatz_Simulacao1: %f $\\pm$ %f\n", mean(WattsStrogatz_Simulacao3), ErroPadrao(WattsStrogatz_Simulacao3));

fprintf("BarabasiAlbert_Simulacao1: %f $\\pm$ %f\n", mean(BarabasiAlbert_Simulacao1), ErroPadrao(BarabasiAlbert_Simulacao1));
fprintf("BarabasiAlbert_Simulacao2: %f $\\pm$ %f\n", mean(BarabasiAlbert_Simulacao2), ErroPadrao(BarabasiAlbert_Simulacao2));
fprintf("BarabasiAlbert_Simulacao3: %f $\\pm$ %f\n", mean(BarabasiAlbert_Simulacao3), ErroPadrao(BarabasiAlbert_Simulacao3));

fprintf("DoddsWattsSabel_Simulacao1: %f $\\pm$ %f\n", mean(DoddsWattsSabel_Simulacao1), ErroPadrao(DoddsWattsSabel_Simulacao1));
fprintf("DoddsWattsSabel_Simulacao2: %f $\\pm$ %f\n", mean(DoddsWattsSabel_Simulacao2), ErroPadrao(DoddsWattsSabel_Simulacao2));
fprintf("DoddsWattsSabel_Simulacao3: %f $\\pm$ %f\n", mean(DoddsWattsSabel_Simulacao3), ErroPadrao(DoddsWattsSabel_Simulacao3));