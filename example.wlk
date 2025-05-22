class ProfesionalUniversitario{
  var universidad 
  method universidad() = universidad
  method honorarios() = universidad.honorarios()
  method dondePuedeTrabajar() = universidad.provincia()
}

class ProfesionalDelLitoral{
  method honorarios() = 3000
  method dondePuedeTrabajar() = ['Entre Rios', 'Santa Fe', 'Corrientes']  
  method universidad()
}

class ProfesionalLibre{
  var universidad
  var provincia
  const provincias = [] 
  var honorarios
  method provincia(unaProvincia) {provincias.add(unaProvincia)}
  method universidad() = universidad
  method honorarios() = honorarios
  method dondePuedeTrabajar(){
    provincias.add(provincia)
    provincias.add(universidad.provincia())
    return provincias
  }
}

class Universidad{
  var provincia
  var honorarios
  method provincia() = provincia
  method honorarios() = honorarios
}
