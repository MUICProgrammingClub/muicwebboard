namespace :add_sample_data do
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

		Instructor.create(first_name: 'Kanat', last_name: 'Tangwongsan')
		Instructor.create(first_name: 'Boonyanit', last_name: 'Mathayomchan')
		Instructor.create(first_name: 'Nat', last_name: 'Kulvanich')
	end
end