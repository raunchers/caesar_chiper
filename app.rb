require 'sinatra'
require 'sinatra/reloader'

def caesar_cipher()
    # get sentence
    word = params["sentence"]

    # get shift
    word_shift = params["shift"].to_i

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
    return encrypted_string.join
end

get '/' do
    original_string = params["sentence"]
    garbled_string = caesar_cipher()
    erb :index, :locals => {:original_string => original_string, :garbled_string => garbled_string}
end