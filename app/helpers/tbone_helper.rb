module TboneHelper
  def tbone_include_tag(name)
    javascript_tag("var vars = #{ render(file: "#{name}.json.rabl") }")
  end
end
