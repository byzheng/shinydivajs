// * Author:    Bangyou Zheng (Bangyou.Zheng@csiro.au)
// * Created:   08:59 PM Saturday, 05 March 2016
// * Copyright: MIT


HTMLWidgets.widget({

  name: "shinydivajs",
  
  type: "output",
  
  factory: function(el, width, height) {
  
    // create our sigma object and bind it to the element
    //var diva_obj = $(el.id);
    
    return {
      renderValue: function(x) {
          var diva = $(el).data('diva');
          if (typeof diva === "undefined") {
            $(el).diva({
				objectData: x.objectData,
				inGrid: x.inGrid,
				enableAutoTitle: x.enableAutoTitle,
				enableFullscreen: x.enableFullscreen,
				enableLinkIcon: x.enableLinkIcon,
				enableCanvas: false,
                enableDownload: false,
                enableAutoHeight: true
			});
          } else {
              diva.changeObject(x.objectData);
          }
      }
    };
  }
});

