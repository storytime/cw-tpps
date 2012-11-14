package cw

class ExtractorDataService {
    def getVacationPacckagefromAction(Action action) {
		VacationPackage.findAllByFk_action(action)
		//for (vacationPackage in action.vacationpackage) { println vacationPackage.priceFull }
    }
}
