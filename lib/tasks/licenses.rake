namespace :db do
  desc "Adds License Information"
  task populate: :environment do
    make_licenses
  end
end

def make_licenses
  License.create!(name: 'Reconocimiento (by)', description: 'Se permite cualquier explotación de la obra, incluyendo una finalidad comercial, así como la creación de obras derivadas, la distribución de las cuales también está permitida sin ninguna restricción.')
  License.create!(name: 'Reconocimiento – NoComercial (by-nc)', description: 'Se permite la generación de obras derivadas siempre que no se haga un uso comercial. Tampoco se puede utilizar la obra original con finalidades comerciales.')
  License.create!(name: 'Reconocimiento – NoComercial – CompartirIgual (by-nc-sa)', description: 'No se permite un uso comercial de la obra original ni de las posibles obras derivadas, la distribución de las cuales se debe hacer con una licencia igual a la que regula la obra original.')
  License.create!(name: 'Reconocimiento – NoComercial – SinObraDerivada (by-nc-nd)', description: 'No se permite un uso comercial de la obra original ni la generación de obras derivadas.')
  License.create!(name: 'Reconocimiento – CompartirIgual (by-sa)', description: 'Se permite el uso comercial de la obra y de las posibles obras derivadas, la distribución de las cuales se debe hacer con una licencia igual a la que regula la obra original.')
  License.create!(name: 'Reconocimiento – SinObraDerivada (by-nd)', description: 'Se permite el uso comercial de la obra pero no la generación de obras derivadas.')
end
