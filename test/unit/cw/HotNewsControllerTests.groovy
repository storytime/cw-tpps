package cw



import org.junit.*
import grails.test.mixin.*

@TestFor(HotNewsController)
@Mock(HotNews)
class HotNewsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hotNews/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hotNewsInstanceList.size() == 0
        assert model.hotNewsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.hotNewsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hotNewsInstance != null
        assert view == '/hotNews/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hotNews/show/1'
        assert controller.flash.message != null
        assert HotNews.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hotNews/list'

        populateValidParams(params)
        def hotNews = new HotNews(params)

        assert hotNews.save() != null

        params.id = hotNews.id

        def model = controller.show()

        assert model.hotNewsInstance == hotNews
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hotNews/list'

        populateValidParams(params)
        def hotNews = new HotNews(params)

        assert hotNews.save() != null

        params.id = hotNews.id

        def model = controller.edit()

        assert model.hotNewsInstance == hotNews
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hotNews/list'

        response.reset()

        populateValidParams(params)
        def hotNews = new HotNews(params)

        assert hotNews.save() != null

        // test invalid parameters in update
        params.id = hotNews.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hotNews/edit"
        assert model.hotNewsInstance != null

        hotNews.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hotNews/show/$hotNews.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hotNews.clearErrors()

        populateValidParams(params)
        params.id = hotNews.id
        params.version = -1
        controller.update()

        assert view == "/hotNews/edit"
        assert model.hotNewsInstance != null
        assert model.hotNewsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hotNews/list'

        response.reset()

        populateValidParams(params)
        def hotNews = new HotNews(params)

        assert hotNews.save() != null
        assert HotNews.count() == 1

        params.id = hotNews.id

        controller.delete()

        assert HotNews.count() == 0
        assert HotNews.get(hotNews.id) == null
        assert response.redirectedUrl == '/hotNews/list'
    }
}
