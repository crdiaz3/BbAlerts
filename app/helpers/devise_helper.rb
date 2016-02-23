module DeviseHelper
 def devise_error_messages!
  return '' if resource.errors.empty?

   messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
   sentence = I18n.t('errors.messages.not_saved',
   count: resource.errors.count,
   resource: resource.class.model_name.human.downcase)

   html = <<-HTML
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
   <div class="alert alert-error alert-block"> <button type="button"
    class="close" data-dismiss="alert">x</button>
    <h4>#{sentence}</h4>
    #{messages}
   </div>
   HTML

   html.html_safe
 end
end
