function [] = draw_nyquist_and_step(G, ym)
    global h;
    
    figure; hold on;
    h = 0;
    %subplot(3, 1, 1);
    out = sim("reg2pol.slx");
    plot(out.G_data.time, out.G_data.signals.values);
    %title("Odpowiedź skokowa; h = 0");
    h = 0.05;
    %subplot(3, 1, 2);
    out = sim("reg2pol.slx");
    plot(out.G_data.time, out.G_data.signals.values);
    %title("Odpowiedź skokowa; h = 0.05");
    h = 0.1;
    %subplot(3, 1, 2);
    out = sim("reg2pol.slx");
    plot(out.G_data.time, out.G_data.signals.values);
    %title("Odpowiedź skokowa; h = 0.1");
    legend("Odpowiedź skokowa; h = 0", "Odpowiedź skokowa; h = 0.05", "Odpowiedź skokowa; h = 0.1")
    hold off;

    figure;
    plotoptions = nyquistoptions('cstprefs');
    plotoptions.ShowFullContour = 'off';
    n = nyquistplot(G, plotoptions);
    
    hold on;
    h = 0;
    Qk = -pi * h / (4 * ym); % wartość Q(w) dla wykresu krytycznego regulatora dwupołożeniowego
    Pk = h; % wartość P(w) dla wykresu krytycznego regulatora dwupołożeniowego
    plot([-2, -Pk], [Qk, Qk], 'g', "LineWidth", 1.35);
    h = 0.05;
    Qk = -pi * h / (4 * ym); % wartość Q(w) dla wykresu krytycznego regulatora dwupołożeniowego
    Pk = h; % wartość P(w) dla wykresu krytycznego regulatora dwupołożeniowego
    plot([-2, -Pk], [Qk, Qk], 'c', "LineWidth", 1.35);
    h = 0.1;
    Qk = -pi * h / (4 * ym); % wartość Q(w) dla wykresu krytycznego regulatora dwupołożeniowego
    Pk = h; % wartość P(w) dla wykresu krytycznego regulatora dwupołożeniowego
    plot([-2, -Pk], [Qk, Qk], 'b', "LineWidth", 1.35);
    axis([-0.5 1 -1 0.3])
    legend("Transmitancja", "wykres krytyczny dla h = 0", "wykres krytyczny dla h = 0.05", "wykres krytyczny dla h = 0.1", "Location", "southeast");
    hold off;
end