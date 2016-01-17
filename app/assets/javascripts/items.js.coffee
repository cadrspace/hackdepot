# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


class Item
  search: (query, cb) ->
    $.get "/items/search.json", {query: query} , (data) ->
      cb(data)
  remove_image: (id, image_id) ->
    $.get "/items/remove_image.json", {id: id, image_id: image_id}, (data) ->
        console.log(data)

cls = ".hd-form-parents-block"

setParent = (parent) ->
  $('input[name="item[parent_id]"]').val(parent._id.$oid)
  $('input[name="parent_title_id"]').val(parent.title)
  $(cls).html('')

drawParents = (data) ->
  data.forEach (k, v) ->
    $("<a>", { title: k.title, text: k.title + ' - ' + k.description, href: '#', click: -> setParent(k)}).appendTo(cls)
    $(cls).append("<br />")

$(document).on 'keydown', '#parent_title_id', (event) ->
  $(cls).html('')
  $(cls).removeClass('hide')
  target = event.currentTarget
  if $(target).val().length >= 3
    item = new Item
    item.search $(target).val(), drawParents

$(document).on 'click', '#remove_image', (event) ->
        event.preventDefault()

        console.log(event)

        item_id  = event.currentTarget.attributes.item_id.value
        image_id = event.currentTarget.attributes.image_id.value

        item = new Item
        item.remove_image item_id, image_id

