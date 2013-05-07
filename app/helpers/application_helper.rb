module ApplicationHelper

  def team_logo
    lbl = current_team.try(:logo_text) || "SMSO-ESB"
    link = link_to(lbl, "/")
    "<a href='/'><img style='position: relative; bottom: -2px;' src='http://placehold.it/16x16&text=X'/> #{lbl}</a>"
  end

  def page_flash
    error_flash + notice_flash + alert_flash
  end

  def error_flash
    return "" unless flash[:error]
    gen_flash("error", flash[:error])
  end

  def notice_flash
    return "" unless flash[:notice]
    gen_flash("notice", flash[:notice])
  end

  def alert_flash
    return "" unless flash[:alert]
    gen_flash("alert", flash[:alert])
  end

  def debug_text
    "<b>#{params["controller"]}##{params["action"]}</b> (params: #{params.inspect})"
  end

  private

  def gen_flash(klas, message)
    <<-HTML
      <div id='#{klas}Flash' class='#{klas}'>
        <div class="row">
          <div class="large-12 columns">
            <div class='row'>
              <div class='large-12'>
                #{message} <i class='icon-remove-circle ml10 flashClose' data-tgtcontainer='#{klas}Flash'></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    HTML
  end

end
