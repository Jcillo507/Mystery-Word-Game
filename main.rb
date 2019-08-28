class Word
    # Stores the provided word in an instance variable and
    # setups up any other instance variables.
    attr_accessor :show_word
    def initialize(word)
      @word = word
      @bank = @word.split("")
      @show_word = "_"*@word.length
    end
  
    # Guess a letter in the word.
    # Should return a boolean. true if the letter is in the word, false if not.
    def guess?(letter)
      if(@word.include?(letter))
        array = []
        array = @bank.each_index.select do |i| 
          @bank[i] == letter
        end
        array.each do |index|
          @show_word[index] = letter
        end
        return true
      else
        return false
      end
    end
  
    # Whether all letters in the word have been guessed correctly.
    def guessed_all_correct?
      if @show_word == @word
        puts "You won"
        return true
      else
        return false
      end
    end
  
    # Display the current state of the guessed word for the player.
    def output_word
      puts @show_word
    end
  
    # Check whether a provided character is a letter
    def self.is_letter?(character)
    end
  end
  
  class MysteryWordGame
    # Initialize any state in the game, and start the game loop.
    attr_accessor :word
  
    def initialize
      @lives = 10
      @word
    end
  
    def ask_for_word
      puts "Please enter a word!"
      user_word = gets.chomp
      @word = Word.new(user_word)
    end
  
    # Run the game loop, which continues until the player wins or loses.
    def game_loop
      game_over = false
      while @lives > 0 && game_over == false do
        puts "Please enter letter."
        user_letter = gets.chomp
        if @word.guess?(user_letter)
          @word.output_word
        else
          @lives -=1
          puts "You chose wrong, you lose a life."
          if @lives == 0
            puts "You Lose"
          end
        end
        game_over=@word.guessed_all_correct?
      end
    end
  end 
  
  game = MysteryWordGame.new
  game.ask_for_word
  game.game_loop
