function hide_tick_labels(axh)
set(axh, 'YTickLabelMode', 'manual');
set(axh, 'YTickLabel', []);
set(axh, 'XTickLabelMode', 'manual');
set(axh, 'XTickLabel', []);
end