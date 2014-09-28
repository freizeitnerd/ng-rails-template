class TemplateConstraint
  def self.matches?(request)
    filename = request.path_parameters[:filename].gsub(/[^a-zA-z0-9\/\-]+/, '')  # clean up the file name
    path = Rails.root.join('app','views','templates')
    re = "_#{filename}"+'\.html\.(erb|haml)'
    files = Dir.entries(path).select {|x| x =~ /#{re}/ }
    #Rails.logger.debug "*** Debugging TemplateConstraint"
    #Rails.logger.debug "    filename: #{filename}"
    #Rails.logger.debug "    path: #{path}"
    #Rails.logger.debug "    regular expression: #{re}"
    #Rails.logger.debug "    #{files.length} file(s) found: #{files}"
    #Rails.logger.debug "    Result: #{files.length > 0}"

    files.length > 0 # returns true/false
  end
end