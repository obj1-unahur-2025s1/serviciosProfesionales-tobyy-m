class PersonaSolicitante {
    const provincia
    method provincia() = [provincia]
    method puedeSerAtendidoPorEmpleado(empleado) {
        return
            empleado.dondePuedeTrabajar().contains(provincia)
    }
}

class ClubSolicitante {
    const provincias
    method provincias() = provincias
    method puedeSerAtendidoPorEmpleado(empleado) {
        return
            empleado.dondePuedeTrabajar().intersection(self.provincias()).size() >= 1
    }
}

class InstitucionSolicitante {
    const universidades
    method universidades() = universidades
    method puedeSerAtendidoPorEmpleado(empleado) {
        return
            self.universidades().contains(empleado.universidad().asList().first())
    }
}