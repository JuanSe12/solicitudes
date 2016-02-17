require 'test_helper'

class ParametroclavesControllerTest < ActionController::TestCase
  setup do
    @parametroclafe = parametroclaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parametroclaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parametroclafe" do
    assert_difference('Parametroclave.count') do
      post :create, parametroclafe: { diascambios: @parametroclafe.diascambios, maxalfanumerico: @parametroclafe.maxalfanumerico, maxcapital: @parametroclafe.maxcapital, maxcaracteres: @parametroclafe.maxcaracteres, maxlongitud: @parametroclafe.maxlongitud, maxnumerico: @parametroclafe.maxnumerico, minalfanumerico: @parametroclafe.minalfanumerico, mincapital: @parametroclafe.mincapital, mincaracteres: @parametroclafe.mincaracteres, minlongitud: @parametroclafe.minlongitud, minnumerico: @parametroclafe.minnumerico, numeroreintentos: @parametroclafe.numeroreintentos, tipoclave: @parametroclafe.tipoclave }
    end

    assert_redirected_to parametroclafe_path(assigns(:parametroclafe))
  end

  test "should show parametroclafe" do
    get :show, id: @parametroclafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parametroclafe
    assert_response :success
  end

  test "should update parametroclafe" do
    patch :update, id: @parametroclafe, parametroclafe: { diascambios: @parametroclafe.diascambios, maxalfanumerico: @parametroclafe.maxalfanumerico, maxcapital: @parametroclafe.maxcapital, maxcaracteres: @parametroclafe.maxcaracteres, maxlongitud: @parametroclafe.maxlongitud, maxnumerico: @parametroclafe.maxnumerico, minalfanumerico: @parametroclafe.minalfanumerico, mincapital: @parametroclafe.mincapital, mincaracteres: @parametroclafe.mincaracteres, minlongitud: @parametroclafe.minlongitud, minnumerico: @parametroclafe.minnumerico, numeroreintentos: @parametroclafe.numeroreintentos, tipoclave: @parametroclafe.tipoclave }
    assert_redirected_to parametroclafe_path(assigns(:parametroclafe))
  end

  test "should destroy parametroclafe" do
    assert_difference('Parametroclave.count', -1) do
      delete :destroy, id: @parametroclafe
    end

    assert_redirected_to parametroclaves_path
  end
end
