namespace :add_all_instructor do
	task :seed => :environment do
		header = true
		File.open(File.absolute_path("lib/tasks/MUIC_Instructor.csv"), "r").each_line("\n") do |line|
			clean_line = line.scrub
			if !header
				puts clean_line
				data = clean_line.split(" ")
				Instructor.create(first_name: data[0], last_name: data[1])
			end
			header = false
		end
	end
end