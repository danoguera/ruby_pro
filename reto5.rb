class Guess
	attr_accessor :question, :answer

	def initialize question, answer
		@question = question
		@answer = answer
	end
end

class Play
	def game 
		puts "Bienvenido a reto 5. Para jugar solo ingresa el termino correcto para cada una de las definiciones. Listo? Vamos!"
		puts "Definición"			
		questions_answers=[]
		File.foreach("data.txt") do |line|
			question, answer = line.chomp.split(',')
			questions_answers.push(Guess.new(question,answer)) unless line.chomp.empty?
		end	
		questions_answers.each do |item|			
			puts item.question
			answer = gets.strip
			while answer != item.answer.downcase.strip || answer.empty?
				puts "Incorrecto! Intenta de nuevo"
				puts item.question
				answer = gets.strip
			end
			if answer == item.answer.downcase
				puts "Correcto!"
			end
		end 
		if questions_answers.length-1
			puts "Fin del juego! Gracias por tu tiempo :)"
		end
	end
end

go=Play.new
go.game