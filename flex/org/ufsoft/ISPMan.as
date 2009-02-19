/**
 * @author vampas
 */

package org.ufsoft {


  import mx.core.Application;
  import mx.containers.TitleWindow;
  import mx.managers.PopUpManager;

  public class ISPMan {

    private var titleWindow:TitleWindow;
    private var application:Application;

    public function init(app:Application):void {
      application = app;
    };

    private function authenticate():void {
      titleWindow = PopUpManager.createPopUp(Application.application, authentication, true) as TitleWindow;
      PopUpManager.centerPopUp(titleWindow);
    };

  };
};


