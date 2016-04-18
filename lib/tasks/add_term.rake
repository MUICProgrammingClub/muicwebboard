namespace :add_term do
	task :seed => :environment do
		Term.create(term_formatted:'T1/2013')
		Term.create(term_formatted:'T2/2013')
		Term.create(term_formatted:'T3/2013')
		Term.create(term_formatted:'T1/2014')
		Term.create(term_formatted:'T2/2014')
		Term.create(term_formatted:'T3/2014')
		Term.create(term_formatted:'T1/2015')
		Term.create(term_formatted:'T2/2015')
		Term.create(term_formatted:'T3/2015')
		Term.create(term_formatted:'T1/2016')
		Term.create(term_formatted:'T2/2016')
		Term.create(term_formatted:'T3/2016')
	end
end