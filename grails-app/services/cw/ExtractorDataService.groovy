package cw

class ExtractorDataService {
    def getVacationPacckagefromAction(Action action) {
		VacationPackage.findAllByFk_action(action)
	}
}
