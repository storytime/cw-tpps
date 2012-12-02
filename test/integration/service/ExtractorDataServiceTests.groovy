package service

import static org.junit.Assert.*
import org.junit.*

import cw.Action;
import cw.Charter;
import cw.TouristAgency
import cw.VacationPackage;
import groovy.util.GroovyTestCase
import grails.test.*
class ExtractorDataServiceTests extends GroovyTestCase{
	def extractorDataService
	void testExtractorDataService() {
		Charter charter = new Charter(classCharter: '1',price: 2.5,typeCharter: 'Air', startDate: new Date())
		assertNotNull charter.save()
		TouristAgency touristAgency = new TouristAgency(decription: 'All tour', owner:'Ivan A.T.', regDate:new Date(),phone:'655385',name:'OPAZA',login:'Agenc',passwdHash:'passwd')
		assertNotNull touristAgency.save()
		Action action=new Action(decription: "testtest", discount: 55,endDate: new Date(),startDate: new Date())
		System.out.println(action.validate());
		assertNotNull action.save()		
		VacationPackage vacationPackage =new VacationPackage(people: 5,priceFull: 285, endDate: new Date(),startDate: new Date())		
		vacationPackage.fk_action=Action.get(action.id)
		vacationPackage.fk_charter=Charter.get(charter.id)
		vacationPackage.fk_touristAgency=TouristAgency.get(touristAgency.id)
		System.out.println(vacationPackage.validate());
		
    	VacationPackage vacationPackage2 =new VacationPackage(people:2,priceFull: 230, endDate: new Date(),startDate: new Date())
		vacationPackage2.fk_action=Action.get(action.id)
		vacationPackage2.fk_charter=Charter.get(charter.id)
		vacationPackage2.fk_touristAgency=TouristAgency.get(touristAgency.id)
	
		action.addToVacationPackages(vacationPackage)
		action.addToVacationPackages(vacationPackage2)
		def foundAction=Action.get(action.id)
		assertNotNull(foundAction)
		def foundTouristAgency=TouristAgency.findByName('OPAZA', [fetch:[vacationPackages:'eager']])
		assertNotNull foundTouristAgency
		System.out.println(foundTouristAgency.toString());
		System.out.println(foundTouristAgency.getVacationPackages());
		Collection lists = extractorDataService.getVacationPacckagefromAction(foundAction)
		assertTrue !lists.isEmpty()
		System.out.println("list:"+lists.toString());

	}
}