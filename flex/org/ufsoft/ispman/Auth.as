/**
 * @author vampas
 */
package org.ufsoft.ispman {

  import flash.events.KeyboardEvent;
  import mx.events.FlexEvent;
  import mx.core.IFlexDisplayObject;
  import mx.events.CloseEvent;
  import mx.managers.PopUpManager;
  import mx.controls.Alert;
  import mx.containers.TitleWindow;
  import mx.events.FlexEvent;
  import mx.controls.Button;
  import mx.controls.TextInput;
  import flash.events.MouseEvent;

  public class Auth extends TitleWindow {

    public var username   : TextInput;
    public var password   : TextInput;
    public var authButton : Button;

    public function Auth() {
      super(); // Star Application

      addEventListener( FlexEvent.INIT_COMPLETE, initComplete );
      addEventListener( FlexEvent.APPLICATION_COMPLETE, appComplete );
      authButton.addEventListener( MouseEvent.CLICK, submitForm );
    }

    private function initComplete(event:FlexEvent):void {
      event.target.isPopUp = false;
      event.target.close = authWin_close;
    }

    private function appComplete(event:FlexEvent):void {
      username.setFocus();
      this.addEventListener(KeyboardEvent.KEY_UP, submit_Ok);
    }

    private function authWin_close(evt:CloseEvent):void {
      PopUpManager.removePopUp(evt.target as IFlexDisplayObject);
    }

    private function submit_Ok(evt:KeyboardEvent):void {
      if ( password.text.length > 0 && username.text.length > 0) {
        authButton.enabled = true;
      } else {
        authButton.enabled = false;
      }
    }

    private function submitForm(evt:MouseEvent):void {
      Alert.show("Authenticating with backend server");
    }
  }

}


