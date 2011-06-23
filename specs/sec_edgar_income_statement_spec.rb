# sec_edgar_income_statement_spec.rb

$LOAD_PATH << './lib'
$LOAD_PATH << './specs'
require 'sec_edgar'
require 'sec_edgar_financial_statement_shared' # shared examples foor SecEdgar::FinancialStatement

describe SecEdgar::IncomeStatement do

  let(:create_fin_stmt) do

    @bogus_filename = "/tmp/ao0gqq34q34g"

    # load a primary one
    @good_filename = "specs/testvectors/2010_03_31.html"

    @tenq = SecEdgar::QuarterlyReport.new
    @tenq.log = Logger.new('sec_edgar.log')
    @tenq.log.level = Logger::DEBUG
    @tenq.parse(@good_filename)

    @fin_stmt = @tenq.inc_stmt

    # load a second one (to test merging, etc)
    @good_filename2 = "specs/testvectors/2011_03_31.html"

    @tenq2 = SecEdgar::QuarterlyReport.new
    @tenq2.log = Logger.new('sec_edgar.log')
    @tenq2.log.level = Logger::DEBUG
    @tenq2.parse(@good_filename2)

    @fin_stmt2 = @tenq2.inc_stmt

  end

  it_should_behave_like 'SecEdgar::FinancialStatement'

  # operating revenues
    # looks like it should:
      # find the first line with 'revenue'.  If that line has numbers, those are the total rvenue.  If not, wait for the first line w/ 'total' in it.
  # operating expenses
  # operating income from sales (before tax)
  # operating income from sales (after tax)
  # other operating income (after tax)
  # operating income (after tax)
  # financing income
  # net income

  # operating revenues
  # gross margin
  # OI from sales (after tax)
  # OI (after tax)
  # financing income
  # comprehensive income

end
 
