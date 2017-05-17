function [timeseries_out] = reduce(timeseries_in)
%REDUCE reduces the elements in a time series object to use matlab2tikz for
%plots because memory errors otherwise

red_fact = 10; % reduction factor

time = timeseries_in.time;
data = squeeze(timeseries_in.data);

timeseries_out = timeseries(data(1:red_fact:end,:), time(1:red_fact:end), 'Name', timeseries_in.Name);
end

