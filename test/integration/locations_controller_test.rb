require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success code' do
    get '/locations.kml'
    assert_equal 200, status
  end

  test 'should return the right xml' do
    get '/locations.kml'
    assert_equal response.body, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<kml xmlns=\"http://earth.google.com/kml/2.2\">\n  \n    <Placemark>\n      <name>NeonRoots Uruguay Office</name>\n      <description>Zelmar Michelini 1290 Apto. 401   Esq. San José - Tel.  2909 0655</description>\n      <Point>\n        <coordinates>-56.19006872177124,-34.907047903278404,0</coordinates>\n      </Point>\n    </Placemark>\n[{:name=&gt;&quot;NeonRoots Uruguay Office&quot;, :description=&gt;&quot;Zelmar Michelini 1290 Apto. 401   Esq. San José - Tel.  2909 0655&quot;, :coordinates=&gt;&quot;-56.19006872177124,-34.907047903278404,0&quot;}]</kml>\n"
  end
end
