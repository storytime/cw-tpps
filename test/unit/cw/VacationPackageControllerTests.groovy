package cw



import org.junit.*
import grails.test.mixin.*

@TestFor(VacationPackageController)
@Mock(VacationPackage)
class VacationPackageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vacationPackage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vacationPackageInstanceList.size() == 0
        assert model.vacationPackageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vacationPackageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vacationPackageInstance != null
        assert view == '/vacationPackage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vacationPackage/show/1'
        assert controller.flash.message != null
        assert VacationPackage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vacationPackage/list'

        populateValidParams(params)
        def vacationPackage = new VacationPackage(params)

        assert vacationPackage.save() != null

        params.id = vacationPackage.id

        def model = controller.show()

        assert model.vacationPackageInstance == vacationPackage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vacationPackage/list'

        populateValidParams(params)
        def vacationPackage = new VacationPackage(params)

        assert vacationPackage.save() != null

        params.id = vacationPackage.id

        def model = controller.edit()

        assert model.vacationPackageInstance == vacationPackage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vacationPackage/list'

        response.reset()

        populateValidParams(params)
        def vacationPackage = new VacationPackage(params)

        assert vacationPackage.save() != null

        // test invalid parameters in update
        params.id = vacationPackage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vacationPackage/edit"
        assert model.vacationPackageInstance != null

        vacationPackage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vacationPackage/show/$vacationPackage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vacationPackage.clearErrors()

        populateValidParams(params)
        params.id = vacationPackage.id
        params.version = -1
        controller.update()

        assert view == "/vacationPackage/edit"
        assert model.vacationPackageInstance != null
        assert model.vacationPackageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vacationPackage/list'

        response.reset()

        populateValidParams(params)
        def vacationPackage = new VacationPackage(params)

        assert vacationPackage.save() != null
        assert VacationPackage.count() == 1

        params.id = vacationPackage.id

        controller.delete()

        assert VacationPackage.count() == 0
        assert VacationPackage.get(vacationPackage.id) == null
        assert response.redirectedUrl == '/vacationPackage/list'
    }
}
