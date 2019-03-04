class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, db:, hp:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.add_column(db)
    db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER")
    db.execute("UPDATE pokemon SET hp = 60")
    binding.pry
  end

  def self.hp_save(hp, db)
    db.execute("INSERT INTO pokemon (hp) VALUES (?,?)", hp)
  end

  def self.find(id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(id:pokemon_from_db[0][0], name:pokemon_from_db[0][1], type:pokemon_from_db[0][2], db:db, hp:pokemon_from_db[0][2])
  end
end
