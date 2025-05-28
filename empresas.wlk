import profesionales.*
import universidad.*
import solicitantes.*

class Empresa {
  const profesionales = #{}
  var property honorarios
  const clientes = #{}
  
  method contratarEmpleado(profesional) {
    profesionales.add(profesional)
  }
  
  method cuantosEstudiaronEn(universidad) = profesionales.count(
    { p => p.universidad() == #{universidad} }
  )
  
  method profesionalesCaros() = profesionales.filter(
    { p => p.honorarios() > honorarios }
  ).asSet()
  
  method universidadesFormadoras() = profesionales.map(
    { p => p.universidad() }
  ).flatten().asSet()
  
  method profesionalMasBarato() = profesionales.min({ p => p.honorarios() })
  
  method esAcotada() = profesionales.all(
    { p => p.dondePuedeTrabajar().size() <= 3 }
  )
  
  method puedeSatisfacerAlSolicitante(solicitante) = profesionales.any(
    { p => solicitante.puedeSerAtendidoPorEmpleado(p) }
  )
  
  method empleadoAptoParaSolicitante(solicitante) = profesionales.find(
    { p => solicitante.puedeSerAtendidoPorEmpleado(p) }
  )
  
  method darServicio(solicitante) {
    if (self.puedeSatisfacerAlSolicitante(solicitante)) {
      self.empleadoAptoParaSolicitante(solicitante).cobrarImporte(
        self.empleadoAptoParaSolicitante(solicitante).honorarios()
      )
      clientes.add(solicitante)
    }
  }
  
  method cuantosClientesTiene() = clientes.size()
  
  method seEncuentraElCliente(cliente) = clientes.contains(cliente)
}

object asociacionProfesionalesDelLitoral {
  var donacion = 0
  
  method donacion() = donacion
  
  method recibirDonacion(importe) {
    donacion += importe
  }
}