////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package services
{
	import org.apache.royale.net.HTTPService;
	import org.apache.royale.net.HTTPHeader;
	import org.apache.royale.events.EventDispatcher;
	import org.apache.royale.events.Event;

    [Event(name="dataReady", type="org.apache.royale.events.Event")]
    /**
     * GitHubService is in charge of getting the source code of some example
     * so we can show the code in a TabBarContentPanel along with the working example
     */
	public class GitHubService extends EventDispatcher
	{
        /**
         * constructor
         */
        public function GitHubService():void
        {
            // this header makes gihub serve the raw code instead of base64 encoded data
            var header:HTTPHeader = new HTTPHeader('accept', 'application/vnd.github.VERSION.raw');
            
            service = new HTTPService();
			service.headers.push(header);
			service.addEventListener("complete", completeHandler);
        }

        /**
         * the service that performs the request to Github
         */
		private var service:HTTPService;

        /**
         * we dispatch an event once we have the source code from gihub
         */
        private function completeHandler(event:Event):void
        {
            dispatchEvent(new Event("dataReady"));
        }

        //example = "https://api.github.com/repos/apache/royale-asjs/contents/examples/royale/JewelExample/src/main/royale/AlertPlayGround.mxml";
        private var _sourceCodeUrl:String = null;
        /**
         * The source code url we want to retrieve
         */
        private function get sourceCodeUrl():String
        {
        	return _sourceCodeUrl;
        }
        private function set sourceCodeUrl(value:String):void
        {
        	_sourceCodeUrl = value;
            service.url = sourceCodeUrl;
            service.send();
        }

        /**
         * data holds the resulting text code to show
         */
        public function get data():String
        {
        	return service.data;
        }
	}
}