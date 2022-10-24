require 'csv'

class Comment

    attr_accessor :content, :author, :edit_nb

    def initialize(author, content, *edit_nb)
        @author = author
        @content = content
        @edit_nb = edit_nb.join
    end

    def save_com
        CSV.open("./db/comment.csv", "ab") do |csv|
            csv << [@author , @content, @edit_nb]
        end
    end

    def self.all
        all_com = []

        CSV.read("./db/comment.csv").each do |csv_line|
          all_com << Comment.new(csv_line[0], csv_line[1], csv_line[2])
        end

        puts all_com
        return all_com
    end

   


end
