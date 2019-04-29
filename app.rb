require 'sinatra'
require 'sinatra/reloader'

def caesar_cipher(word, word_shift)
    # get sentence
    word = params["sentence"]

    # get shit
    word_shift = params["shit"].to_i

    # Split string
    user_string = word.split('')
    # new string
    encrypted_string = []
    # each single character shifted
    char_shift = ''

    user_string.each do |char|
        if (97..122).include? char.ord
            char_shift = (((char.ord - 97 + word_shift) % 26 ) + 97).chr
            encrypted_string.push(char_shift)
        elsif (65..90).include? char.ord
            char_shift = (((char.ord - 65 + word_shift) % 26 ) + 65).chr
            encrypted_string.push(char_shift)
        else
            encrypted_string.push(char)
        end
    end
    puts encrypted_string.join
end

get '/' do
    params.inspect
    erb :index
end