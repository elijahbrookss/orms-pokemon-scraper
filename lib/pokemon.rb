class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.create(id, name, type, db)
        new_pokemon = Pokemon.new({id: id, name: name, type: type, db: db})
        self.save(new_pokemon.name, new_pokemon.type, db)
        

        new_pokemon
    end


    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL

        row = db.execute(sql, id)[0]
        self.create(row[0], row[1], row[2], db)


    end




end
