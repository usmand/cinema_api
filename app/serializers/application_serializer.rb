class ApplicationSerializer < Blueprinter::Base
  field :type do |object|
    object.class.name
  end
end
