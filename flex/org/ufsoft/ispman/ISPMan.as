/**
 * @author vampas
 */
package org.ufsoft.ispman {
  import flash.events.Event;
  import mx.controls.Button;
  import mx.core.Application;
  import mx.events.FlexEvent;
  import mx.managers.PopUpManager;


  public class ISPMan extends Application {

    private var authWin     : authentication;
    private var _server     : ISPManSocket;
    private var _auth       : Auth;


    [Bindable]
    public var log          : String;


    public function ISPMan() {
      super(); // Star Application
      addEventListener( FlexEvent.APPLICATION_COMPLETE, initApp );
    }

    private function initApp(event:FlexEvent):void {
      _server = new ISPManSocket(); // Connect to server

      // Listen for log updates
      _server.addEventListener( ISPManSocket.CONNECTED, startState );
      _server.addEventListener( ISPManSocket.DISCONNECTED, startState );
      _server.addEventListener( ISPManSocket.LOG_UPDATE, logUpdate );

      authWin = PopUpManager.createPopUp(_auth, authentication, true) as authentication;
      PopUpManager.centerPopUp(authWin);
    }

    private function logUpdate( event:Event ):void {
      log = _server.log; // Display log
    }

    private function startState( event:Event=null ):void {
    //
    }

    private function stopState( event:Event=null ):void {
    //
    }


  }

}


