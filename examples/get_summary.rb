$LOAD_PATH << './lib'
require 'sec_edgar'

ticker = 'GOOG'
rept_type = '10-K'
download_path = "/tmp/"
edgar = SecEdgar::Edgar.new

reports = edgar.lookup_reports(ticker)
reports.keep_if{ |r| r[:type] == rept_type }
reports.sort! {|a,b| a[:date] <=> b[:date] }

reports.keep_if{ |r| r[:date] =~ /2010/ }

files = edgar.get_reports(reports, download_path)

ten_k = SecEdgar::AnnualReport.new 
ten_k.parse(files.first)

summary = ten_k.get_summary

