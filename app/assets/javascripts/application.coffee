#= require jquery
#= require jquery_ujs
#= require foundation
#= require shoppe/stripe/form_handler

$ ->

  $('form.disableable').on 'submit', ->
    $('input[type=submit]').addClass('disabled').prop('disabled', true)
  
  toggleDeliveryAddress = ->
    if $('div.checkout input#order_separate_delivery_address').prop('checked')
      $('div.checkout .delivery').show()
    else
      $('div.checkout .delivery').hide()
    false
  $('div.checkout input#order_separate_delivery_address').on 'change', toggleDeliveryAddress
  toggleDeliveryAddress() if $('div.checkout').length
  
  #
  # Receive some response from the orders controller and update the order items
  # table as appropriate.
  #
  updateOrderItemsFromRemote = (data)->
    if data.status == 'complete'
      if data.redirect?
        window.location.replace(data.redirect)
      else if data.items?
        $('table.orderItems').replaceWith(data.items)
    else if data.status == 'error'
      alert data.message
    
  #
  # Submit a link
  #
  ajaxLink = (successMethod)->
    $.ajax
      url: $(this).attr('href')
      type: $(this).data('method')
      dataType: 'json'
      success: successMethod
    false
    
  #
  # When clicking links in the order items table, submit them
  # using the ajaxLink helper
  #
  $('body').on 'click', 'table.orderItems tbody td a.ajax', -> ajaxLink.call(this, updateOrderItemsFromRemote)
  
  #
  # When the delivery method is changed on the form, submit the associated
  # form with ajax
  #
  $('body').on 'change', 'table.orderItems select', -> 
    form = $(this).parents('form')
    $.ajax
      url: form.attr('action')
      type: form.attr('method')
      data: form.serialize()
      dataType: 'json'
      success: updateOrderItemsFromRemote
      
$ ->
  $(document).foundation()
