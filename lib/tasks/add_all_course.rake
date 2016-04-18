namespace :add_all_course do
	task :seed => :environment do
		header = true
		File.open(File.absolute_path("lib/tasks/MUIC_Courses.csv"), "r").each_line("\n") do |line|
			clean_line = line.scrub
			if !header
				puts clean_line
				data = clean_line.split("\t")
				Course.create(course_code: data[1], course_name: data[2])
			end
			header = false
		end
	end
end