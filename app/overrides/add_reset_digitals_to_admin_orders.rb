Deface::Override.new(:virtual_path => "spree/admin/shared/_order_tabs",
                     :name => "add_reset_digitals_to_admin_orders",
                     :insert_bottom => "[data-hook='admin_order_tabs'], #admin_order_tabs[data-hook]",
                     :text => %q{
<%= content_tag(:li, button_link_to(t(:reset_downloads), reset_digitals_admin_order_url(@order))) if @order.digital? %>
                      },
                     :disabled => false)
