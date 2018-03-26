require_relative './distances'

class Cell
    #Implements getters for row and column attributes
    #Implements getter/setter for NSEW
    attr_reader :row, :column
    attr_accessor :north, :south, :east, :west

    
    # Cell takes in a row, column, and array of links
    def initialize(row, column)
        @row, @column = row, column
        @links = {}
    end

    =begin
    Takes in a cell, and adds the cell as a link.
    Also has bidi parameter, which sets link on both sides.
    =end
    def link(cell, bidi=true)
        @links[cell] = true
        cell.link(self, false) if bidi
        self
    end

    =begin
    Takes in a cell, and removes the cell as a link.
    Also has bidi parameter, which removes link on both sides.
    =end
    def unlink(cell, bidi=true)
        @links.delete(cell)
        cell.unlink(self, false) if bidi
        self
    end

    #returns an array of cells connected to this cell
    def links
        @links.keys
    end

    #Checks whether cell parameter is a key
    def linked?(cell)
        @links.key?(cell)
    end

    #returns an array of neighbors if they exist.
    def neighbors
        list = []
        list << north if north
        list << south if south
        list << east if east
        list << west if west
        list
    end

    def distances
        #creates a new distances object with this cell as the root and sets the frontier as this cell.
        distances = Distances.new(self)
        frontier = [ self ]

        #Keep looping until there is no frontier left
        while frontier.any?
            new_frontier = []

            #starts looping through frontier cells
            frontier.each do |cell|
                #starts looping through cell link
                cell.links.each do |linked|
                    #if neighbor is found in distances, skip to next neighbor.
                    #if not, set the neighbor as a cell in the distances hash with a value of previous cells value + 1
                    next if distances[linked]
                    distances[linked] = distances[cell] + 1
                    #add cell to new frontier array
                    new_frontier << linked
                end
            end

            #set frontier as all neighbors not already in the hash
            frontier = new_frontier
        end
            
        distances
    end
end