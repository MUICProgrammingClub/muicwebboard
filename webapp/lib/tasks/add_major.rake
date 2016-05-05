namespace :add_major do
	task :seed => :environment do
		if Major.count == 0
			header = true
			File.open(File.absolute_path("lib/tasks/muic_majors.csv"), "r").each_line("\n") do |line|
				clean_line = line.scrub
				if !header
					data = clean_line.split(",")
					Major.create(major_code: data[0], major_name: data[1])
				end
				header = false
			end
		end
	end
end
