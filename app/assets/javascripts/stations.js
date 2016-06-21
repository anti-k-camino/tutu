$(document).ready(function(){  
  $('a.edit_station').click(function(e){
    e.preventDefault();    
    var station_id = $(this).data('stationId');
    var form = $('#edit_station_' + station_id);
    var title = $('#station_name_' + station_id);

    if (!$(this).hasClass('cancel')){  
      $(this).html('Cancel')
      $(this).addClass('cancel');
    }else{  
      $(this).html('Редактировать');
      $(this).removeClass('cancel');
    }
    form.toggle();
    title.toggle(); 
  });
});