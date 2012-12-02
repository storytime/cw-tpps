package testdomains

import org.bouncycastle.x509.X509Util.Implementation;

import grails.test.mixin.support.*
import cw.Action
import cw.User	

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserTests implements IDomainTest{
	
	
	def testObjFail = new User(address: "test",email: "test@gmail.com",balance: 1000,
		name: "Iv",passwdHash: "test123",phone: "testNumber",secondName: "Ivanov")

	def testObjOk = new Action(decription: "test",discount: 50,
	endDate: new Date(), startDate: new Date())

	@Override
	public void testTrueInsAndSel() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testFalseInsAndSel() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testFalseValid() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testTrueValid() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testBlank() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testNull() {
		// TODO Auto-generated method stub
		
	}
}
