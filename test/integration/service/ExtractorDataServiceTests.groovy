package service

import static org.junit.Assert.*
import org.junit.*

import cw.Action;
import cw.VacationPackage;
import groovy.util.GroovyTestCase
import grails.test.*
class ExtractorDataServiceTests extends GroovyTestCase{
	def extractorDataService
	void testExtractorDataService() {
		Action action=new Action(decription: "testtest", discount: 55,endDate: new Date(),startDate: new Date())
		System.out.println(action.validate());
		assertNotNull action.save()
		
		VacationPackage vacationPackage =new VacationPackage(people: 5,priceFull: 285, endDate: new Date(),startDate: new Date())		
		vacationPackage.fk_action=Action.get(action.id)
		System.out.println(vacationPackage.validate());
		
    	VacationPackage vacationPackage2 =new VacationPackage(people:2,priceFull: 230, endDate: new Date(),startDate: new Date())
		vacationPackage2.fk_action=Action.get(action.id)
		System.out.println(vacationPackage2.validate());
		
		action.addToVa(vacationPackage)
		action.addToVa(vacationPackage2)
		
		def foundAction=Action.get(action.id)
		assertNotNull(foundAction)
    	
		Collection lists = extractorDataService.getVacationPacckagefromAction(foundAction)
		assertTrue !lists.isEmpty()
		System.out.println("list:"+lists.toString());

	}
}