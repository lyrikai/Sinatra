require 'csv'

class Gossip

    attr_accessor :content, :author, :edit_nb

    def initialize(author,content, *edit_nb)
        @author = author
        @content = content
        @edit_nb = edit_nb.join
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
          end
    end

    def self.all
        all_gossips = []

        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end

        return all_gossips
    end

    def find
        tab = self.all
        puts tab
    end

    def modif
        tab = Gossip.all

        tab[@edit_nb.to_i].author = @author

        tab[@edit_nb.to_i].content = @content

        CSV.open("./db/gossip.csv", "wb") do |csv|
    
        end

        tab.each do |i|

            CSV.open("./db/gossip.csv", "ab") do |csv|
                csv << [i.author, i.content]
            end
             
        end

    end

end
