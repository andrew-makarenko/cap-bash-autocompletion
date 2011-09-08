#!/usr/bin/env ruby

class CapComplete
  def initialize(cmd)
    @command = cmd[ /\s(.+)$/, 1 ] || ""
  end

  def search
		@words = @command.split(/\s+/)
		puts searchTasks(@words.last())
		exit 0
	end
	
	def searchTasks(target)
		res = `cap -T`.split("\n")
		tasks = []
		res.map{
			|a|
			task = a.split(/\s+/)
			if task.size > 1 && task[0] == 'cap'
				if(target && target.size > 0)
					if(task[1][0, target.length] == target)
						#puts task[1]
						tasks << cmd_before_column(task[1])
					end
				else
					tasks << cmd_before_column(task[1])
				end
			end
		}
		if tasks.length == 1 && tasks.first() == @command.gsub(" ", "")
			return searchTasks(nil)
		end
		return tasks
	end
	
	def cmd_before_column(var)
    return var.gsub(":","\:")
  end
end

puts CapComplete.new(ENV["COMP_LINE"]).search
exit 0