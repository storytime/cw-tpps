package cw



import org.junit.*
import grails.test.mixin.*

@TestFor(TouristAgencyController)
@Mock(TouristAgency)
class TouristAgencyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/touristAgency/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.touristAgencyInstanceList.size() == 0
        assert model.touristAgencyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.touristAgencyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.touristAgencyInstance != null
        assert view == '/touristAgency/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/touristAgency/show/1'
        assert controller.flash.message != null
        assert TouristAgency.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/touristAgency/list'

        populateValidParams(params)
        def touristAgency = new TouristAgency(params)

        assert touristAgency.save() != null

        params.id = touristAgency.id

        def model = controller.show()

        assert model.touristAgencyInstance == touristAgency
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/touristAgency/list'

        populateValidParams(params)
        def touristAgency = new TouristAgency(params)

        assert touristAgency.save() != null

        params.id = touristAgency.id

        def model = controller.edit()

        assert model.touristAgencyInstance == touristAgency
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/touristAgency/list'

        response.reset()

        populateValidParams(params)
        def touristAgency = new TouristAgency(params)

        assert touristAgency.save() != null

        // test invalid parameters in update
        params.id = touristAgency.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/touristAgency/edit"
        assert model.touristAgencyInstance != null

        touristAgency.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/touristAgency/show/$touristAgency.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        touristAgency.clearErrors()

        populateValidParams(params)
        params.id = touristAgency.id
        params.version = -1
        controller.update()

        assert view == "/touristAgency/edit"
        assert model.touristAgencyInstance != null
        assert model.touristAgencyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/touristAgency/list'

        response.reset()

        populateValidParams(params)
        def touristAgency = new TouristAgency(params)

        assert touristAgency.save() != null
        assert TouristAgency.count() == 1

        params.id = touristAgency.id

        controller.delete()

        assert TouristAgency.count() == 0
        assert TouristAgency.get(touristAgency.id) == null
        assert response.redirectedUrl == '/touristAgency/list'
    }
}
