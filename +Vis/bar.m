function h = bar(ax, T, valvar, varargin)
p = inputParser;
p.addRequired('ax');
p.addRequired('T');
p.addRequired('valvar');
p.addOptional('textvar', 0);
p.addOptional('xvar', 0);
p.parse(ax, T, valvar, varargin{:});
textvar = p.Results.textvar;
xvar = p.Results.xvar;

T = sortrows(T, valvar, 'descend');
ax.reset();
if ~xvar
    h = bar(ax, T{:, valvar});
else
    h = bar(ax, T{:, xvar}, T{:, valvar});
end
if textvar
    xticklabels(ax, string(T{:, textvar}));
    xtickangle(ax, 45);
    xticks(ax, 1 : length(T{:, textvar}));
    text(ax, (1:height(T)), T{:, valvar}, string(round(T{:, valvar})),...
        'vert', 'bottom', 'horiz', 'center');
end
h.FaceColor = 'flat';