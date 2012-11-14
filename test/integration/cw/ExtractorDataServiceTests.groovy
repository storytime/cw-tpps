package cw

import static org.junit.Assert.*
import org.junit.*
import groovy.util.GroovyTestCase
import grails.test.*
class ExtractorDataServiceTests extends GroovyTestCase{
	def extractorDataService
	void testExtractorDataService() {
		Action action=new Action(decription: 'Action',discount: 15.0)
		assertNotNull action.save()
		VacationPackage vacationPackage =new VacationPackage(belongsTo: action, people: 25,priceFull: 28.5 )
		assertNotNull vacationPackage.save()
		VacationPackage vacationPackage2 =new VacationPackage(belongsTo: action, people: 31,priceFull: 28.6)
		assertNotNull vacationPackage2.save()
		def foundAction=Action.get(action.id)
		assertNotNull(foundAction)
		Collection lists = extractorDataService.getVacationPacckagefromAction(foundAction)
		assertTrue !lists.isEmpty()
		System.out.println("list:"+lists.toString());
		
	}
}
