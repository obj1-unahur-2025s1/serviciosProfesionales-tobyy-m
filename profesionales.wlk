import universidad.*
import empresas.*
import solicitantes.*

class ProfesionalVinculado {
  const universidad
  
  method universidad() = #{universidad}
  
  method honorarios() = universidad.honorarios()
  
  method dondePuedeTrabajar() = #{universidad.provincia()}
  
  method cobrarImporte(importe) {
    universidad.recibirDonacion(importe / 2)
  }
}

class ProfesionalDelLitoral {
  const universidad
  
  method honorarios() = 3000
  
  method dondePuedeTrabajar() = #{entreRios, corrientes, santaFe}
  
  method universidad() = #{universidad}
  
  method cobrarImporte(importe) {
    asociacionProfesionalesDelLitoral.recibirDonacion(importe)
  }
}

class ProfesionalLibre {
  const universidad
  const provincias = #{}

  var property honorarios

  var totalRecaudado = 0
  
  method totalRecaudado() = totalRecaudado

  method agregarProvincia(provincia) = provincias.add(provincia)
  
  method universidad() = #{universidad}
  
  method honorarios() = honorarios
  
  method dondePuedeTrabajar() = provincias

    method cobrarImporte(importe) {
    totalRecaudado = totalRecaudado + importe
  }

  method pasarDinero(cantidad , persona) {
    if (cantidad <= totalRecaudado) {
      persona.cobrarImporte(cantidad)
      totalRecaudado = totalRecaudado - cantidad
    }
  }
}