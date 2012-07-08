module TboneHelper
  def tbone_include_tag(name)
    javascript_tag("var __params = #{ Tbone.config.params.to_json }")
  end
end
