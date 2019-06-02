class Node
    attr_accessor :name
    attr_accessor :film_actor_hash

    def initialize(name)
        @name = name
        @film_actor_hash = Hash.new
    end
end


class Graph

    def initialize
        @films = []
    end

    def find_kevin_bacon(initial)
        initial.film_actor_hash.each do |movie, actors|
            actors.each do |actor|
                if actor.name == "Kevin Bacon"
                    @films.push(movie)
                    return @films
                else
                    find_kevin_bacon(actor)
                end
            end

            if @films.length > 6
                return "#{initial.name} is more than 6 degrees from Kevin Bacon."
                return @films
            else
                return @films
            end
        end
    end
end
